node db {

  class { 'apt':
    always_apt_update => true,
  }

  class { '::mysql::server':
    root_password   => 'str0ngp4ssW0r6!',
    require => Class['apt'],
  }

  host { 'rails':
    ip => '10.20.1.2',
  }
}
