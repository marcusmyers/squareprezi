class profiles::nginx ($docroot='/home/vagrant/code/public') {

#  package { 'apt-transport-https':
#    ensure => installed,
#    before => Package['ca-certificates'],
#  }

#  package { 'ca-certificates':
#    ensure => installed,
#    before => Apt_key['passenger']
#  }

#  apt_key { 'passenger':
#    ensure => 'present',
#    id     => '561F9B9CAC40B2F7',
#    server => 'hkp://keyserver.ubuntu.com:80',
#    notify => Apt::Source['passenger'],
#  }

#  apt::source { 'passenger':
#    location => 'https://oss-binaries.phusionpassenger.com/apt/passenger',
#    repos    => 'main',
#    release  => 'trusty',
#    notify   => Package['passenger'],
#  }

#  package { 'passenger':
#    ensure => installed,
#  }

#  package { 'nginx-extras': 
#    ensure => installed,
#  }

  class { '::nginx':
    package_source  => 'passenger',
    package_name    => 'nginx-extras',
    http_cfg_append => {
      'passenger_root' => '/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini',
    }
  }

  nginx::resource::vhost { 'localhost':
    www_root  => "${docroot}",
    autoindex => 'off',
    vhost_cfg_append => {
      'passenger_enabled' => 'on',
      'passenger_ruby'    => '/usr/bin/ruby',
      'rails_env'         => 'development',
    },
  }
}
