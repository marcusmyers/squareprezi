class profiles {
  include git

  exec { "apt-update":
    command => "/usr/bin/apt-get update",
  }

  Exec["apt-update"] -> Package <| |>
}
