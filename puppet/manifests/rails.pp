node rails {
  class { 'apt':
    always_apt_update => true,
  }

  class { '::mysql::client':
    require => Class['apt'],
  }

  class { 'rbenv': }

  rbenv::plugin { 'sstephenson/ruby-build': }
  rbenv::build { '2.0.0-p576': global => true }
}
