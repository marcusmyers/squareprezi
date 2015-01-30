class roles::db ($dbtype='mysql') {
  case $dbtype {
    default: { include profiles::mysql::server }
  }
}
