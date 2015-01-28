class profiles::nodejs {

  exec { 'get-nodejs':
    command => '/usr/bin/wget -qO- https://deb.nodesource.com/setup | bash -',
    creates => '/etc/apt/sources.list.d/nodesource.list',
  }

  package { 'nodejs':
    ensure => installed,
  }

}
