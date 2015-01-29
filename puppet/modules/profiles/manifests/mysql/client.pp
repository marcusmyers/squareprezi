class profiles::mysql::client {
  class { '::mysql::client':  }
  package { 'libmysqlclient-dev':
    ensure => 'installed',
  }
  class { '::mysql::bindings': 
    ruby_enable => true,
  }
}
