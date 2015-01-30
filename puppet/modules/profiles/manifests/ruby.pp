class profiles::ruby ($version='2.0') inherits profiles {
  $ruby = "ruby${version}"
  $rubyDev = "${ruby}-dev"

  class { '::apt': }
  
  apt::ppa { 'ppa:brightbox/ruby-ng':  }->
  package { "${ruby}":
    ensure => installed,
  }->
  package { "${rubyDev}": 
    ensure  => installed,
    require => Package["${ruby}"],
  }->
  file { '/usr/bin/ruby':
    ensure => 'link',
    target => '/usr/bin/ruby2.0',
  }->
  file { '/usr/bin/gem':
    ensure => 'link',
    target => '/usr/bin/gem2.0',
  }

  exec { '/usr/bin/gem install bundler':
    require => File['/usr/bin/gem'],
  }

  package { 'libsqlite3-dev':
    ensure => installed,
  }
}
