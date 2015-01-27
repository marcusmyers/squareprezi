class profiles::aptruby ($version='2.0') inherits profiles {
  $ruby = "ruby${version}"
  $rubyDev = "${ruby}-dev"

  class { '::apt': }
  
  apt::ppa { 'ppa:brightbox/ruby-ng':  }->
  package { "${ruby}":
    ensure => installed,
  }
  package { "${rubyDev}": 
    ensure  => installed,
    require => Package["${ruby}"],
  }
}
