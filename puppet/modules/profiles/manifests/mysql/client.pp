class profiles::mysql::client {
  class { '::mysql::client':  }
  class { '::mysql::bindings': 
    ruby_enable => true,
  }
}
