class profiles::mysql::server ( $root_password = 'school', $bindings = [] ) {
  class { '::mysql::server':
    root_password = "${root_password}",
  }
}
