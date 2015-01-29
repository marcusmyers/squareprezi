node db {

  include profiles::mysql::server

  host { 'rails':
    ip => '10.20.1.2',
  }
}
