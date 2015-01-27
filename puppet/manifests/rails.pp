node rails {
  include profiles::mysql::client
  #include profiles::nodejs
  #include profiles::rbenv
  include profiles::aptruby
  include profiles::nginx

  host { 'db':
    ip => '10.20.1.3',
  }

}
