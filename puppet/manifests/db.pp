node db {
  class { '::mysql::server':
    root_password   => 'str0ngp4ssW0r6!',
    require => Exec['AptUpdate'],
  }

  exec { 'AptUpdate':
    command => '/usr/bin/apt-get update',
  }
}
