class profiles::appsetup {

  exec { '/usr/bin/gem install bundler':
    require => File['/usr/bin/gem'],
  }

  exec { 'bundle':
    command => '/usr/local/bin/bundle install --without production',
    cwd     => '/home/vagrant/code',
    unless  => '/usr/bin/gem list | grep -c "activerecord (4.0.8)"',
    require => Exec['/usr/bin/gem install bundler'],
  }

}
