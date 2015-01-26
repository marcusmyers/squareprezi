class profiles::rbenv ( $build='2.0.0-p576', $gems=[] ) inherits profiles {
  class { '::rbenv': }
  rbenv::plugin { 'sstephenson/ruby-build': }
  rbenv::build { $build: global => true }

  if (count($gems) > 0) {
    rbenv::gem { $gems: ruby_version => "${build}" }
  }
}
