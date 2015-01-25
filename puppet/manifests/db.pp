node db {
  class { '::mysql::server':
    root_password   => 'str0ngp4ssW0r6!',
    require => Exec['AptUpdate'],
  }

  exec { 'AptUpate':
    command => 'apt-get update',
  }
}
