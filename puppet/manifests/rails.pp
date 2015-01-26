node rails {
  class { 'apt':
    always_apt_update => true,
    notify            => Class['rbenv'],
  }

  class { 'rbenv':  }
  class { '::mysql::client':  
    require => Class['rbenv'],
  }
  rbenv::plugin { 'sstephenson/ruby-build': }
  rbenv::build { '2.0.0-p576': global => true }
}
