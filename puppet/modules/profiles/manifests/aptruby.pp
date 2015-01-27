class profiles::aptruby ($version='2.0') {
  apt::ppa { 'ppa:brightbox/ruby-ng': }
  
  $ruby = "ruby${version}"
  $rubyDev = "${ruby}-dev"

  package { "${ruby}":
    ensure => installed,
  }

  package { "${rubyDev}": 
    ensure => installed,
  }
}
