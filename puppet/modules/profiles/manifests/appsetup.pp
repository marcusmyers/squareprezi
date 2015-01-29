class profiles::appsetup {

  exec { '/usr/bin/gem install bundler':
    require => File['/usr/bin/gem'],
  }

  vcsrepo { '/home/vagrant/code':
    ensure   => present,
    provider => git,
    source   => "https://github.com/marcusmyers/sample_app_rails_4.git",
    force    => true,   
    require  => Exec['/usr/bin/gem install bundler'],
  }

  exec { 'bundle':
    command => '/usr/local/bin/bundle install --without production',
    cwd     => '/home/vagrant/code',
    unless  => '/usr/bin/gem list | grep -c "activerecord (4.0.8)"',
#    require => Exec['/usr/bin/gem install bundler'],
    require => Vcsrepo['/home/vagrant/code'],
  }

}
