node rails {
  include roles::rorserver
  include roles::sampleapp
  
  host { 'db':
    ip => '10.20.1.3',
  }

}
