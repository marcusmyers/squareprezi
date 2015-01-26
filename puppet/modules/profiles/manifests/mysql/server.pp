class profiles::mysql::server ( $root_password='school', $bindings=[] ) inherits profiles {
  class { '::mysql::server':
    root_password => "${root_password}",
  }
}
