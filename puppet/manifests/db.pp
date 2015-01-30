node db {

  include roles::db 

  host { 'rails':
    ip => '10.20.1.2',
  }
}
