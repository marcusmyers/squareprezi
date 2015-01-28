class profiles::appsetup {

  exec { 'bundle':
    command => '/usr/local/bin/bundle install --without production',
    cwd     => '/home/vagrant/code',
    unless  => '/usr/bin/gem list | grep -c "activerecord (4.0.8)"',
    require => Exec['/usr/bin/gem install bundler'],
  }

}
