class profiles::mysql::server ( $root_password='school', $bindings=[] ) inherits profiles {
  include ufw

  class { '::mysql::server':
    root_password => "${root_password}",
  }

  # Allow the rails box access to mysql
  ufw::allow { 'allow-mysql-from-rails':
    port => 3306,
    from => "10.20.1.2",
  }
}
