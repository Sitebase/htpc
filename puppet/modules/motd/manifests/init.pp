class motd {
  file {
    "/etc/motd":
      ensure => file,
      source => "puppet:///modules/motd/hello";
  }
}