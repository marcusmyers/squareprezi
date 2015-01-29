class profiles::mysql::server ( $db='samplerails',$user='railsuser',$password='new*data', $host='10.20.1.2' ) inherits profiles {

  $override_options = {
    'mysqld' => {
      'bind-address' => '0.0.0.0',
    }
  }

  class { '::mysql::server':
    override_options => $override_options,
    restart          => true,
  }

  mysql::db { "${db}":
    user     => "${user}",
    password => "${password}",
    host     => "${host}",
    grant    => ['ALL'],
  }

}
