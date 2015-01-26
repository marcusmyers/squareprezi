class profiles {
  exec { "apt-update":
    command => "/usr/bin/apt-get update",
#    before  => Stage["main"],
  }

  Exec["apt-update"] -> Package <| |>
}
