node rails {
  include profiles::mysql::client
  include profiles::nodejs


  class { 'profiles::vrbenv':
    build => '2.0.0-p576',
  }

  host { 'db':
    ip => '10.20.1.3',
  }

}
