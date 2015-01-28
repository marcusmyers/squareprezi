node rails {
  include profiles::mysql::client
  include profiles::nodejs
  include profiles::ruby
  include profiles::nginx
  include profiles::appsetup

  host { 'db':
    ip => '10.20.1.3',
  }

}
