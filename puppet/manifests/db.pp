node db {


  class { 'profiles::mysql::server':
    root_password   => 'str0ngp4ssW0r6!',
  }

  host { 'rails':
    ip => '10.20.1.2',
  }
}
