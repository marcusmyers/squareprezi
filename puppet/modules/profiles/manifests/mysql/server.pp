class profiles::mysql::server ( $root_password='secret',  $db='samplerails',$user='railsuser',$password='new*data', $host='%' ) inherits profiles {

  $override_options = {
    'mysqld' => {
      'bind-address' => '0.0.0.0',
    }
  }

  class { '::mysql::server':
    root_password    => $root_password,
    override_options => $override_options,
    restart          => true,
  }

  mysql::db { "${db}":
    user     => "${user}",
    password => "${password}",
    host     => "${host}",
    grant    => ['ALL'],
  }

  mysql::db { "${db}_test":
    user     => "${user}",
    password => "${password}",
    host     => "${host}",
    grant    => ['ALL'],
  }
}
