node mysql {
  class { '::mysql::server':
    root_password   => 'str0ngp4ssW0r6!',
  }
}
