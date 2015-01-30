class roles::rorserver ($db='mysql') {
  if $db == 'mysql' {
    include profiles::mysql::client
  }
  include profiles::nodejs
  include profiles::ruby
  include profiles::nginx
}
