class profiles::nginx ($docroot='/home/vagrant/code/public') {

  class { '::nginx':
    package_source  => 'passenger',
    package_name    => 'nginx-extras',
    http_cfg_append => {
      'passenger_root' => '/usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini',
    }
  }

  nginx::resource::vhost { 'localhost':
    www_root             => "${docroot}",
    autoindex            => 'off',
    use_default_location => false,
    vhost_cfg_append     => {
      'passenger_enabled' => 'on',
      'passenger_ruby'    => '/usr/bin/ruby',
      'rails_env'         => 'development',
    },
  }
}
