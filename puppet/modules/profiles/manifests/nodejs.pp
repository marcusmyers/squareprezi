class profiles::nodejs ( $version='stable' ) {
  class { 'nodejs':
    version => "${version}",
  }
}
