class motd {
  file {
    "/tmp/hello":
      ensure => file,
      source => "puppet:///modules/motd/hello";
  }
}