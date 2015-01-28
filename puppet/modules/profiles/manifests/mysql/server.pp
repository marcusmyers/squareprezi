class profiles::mysql::server ( $root_password='secret', $db='samplerails',$user='railsuser',$password='new*data', $host='10.20.1.2' ) inherits profiles {
  include ufw

  class { '::mysql::server':
    root_password => "${root_password}",
  }

  mysql::db { "${db}":
    user     => "${user}",
    password => "${password}",
    host     => "${host}",
    grant    => ['ALL'],
  }

  # Allow the rails box access to mysql
  ufw::allow { 'allow-mysql-from-rails':
    port => 3306,
    from => "${host}",
  }
}
