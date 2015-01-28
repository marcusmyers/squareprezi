class profiles::nodejs {

  exec { 'get-nodejs':
    command => '/usr/bin/wget -qO- https://deb.nodesource.com/setup | bash -',
    creates => '/etc/apt/sources.list.d/nodesource.list',
  }

  package { 'nodejs':
    ensure => installed,
  }

  file { '/usr/local/bin/node':
    ensure => 'link',
    target => '/usr/bin/node',
  }

  file { '/usr/local/bin/npm':
    ensure => 'link',
    target => '/usr/bin/npm',
  }

}
