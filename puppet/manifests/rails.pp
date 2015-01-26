node rails {

  class { 'profiles::vrbenv':
    build => '2.0.0-p576',
  }

  class { '::mysql::client': }

  host { 'db':
    ip => '10.20.1.3',
  }
}
