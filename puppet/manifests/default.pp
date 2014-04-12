include apt

apt::ppa { 'ppa:team-xbmc/ppa': }


Exec {
	path => [
		'/usr/bin',
		'/bin',
		'/usr/sbin',
		'/sbin',
		'/usr/local/bin',
		'/usr/local/sbin',
		'/opt/vagrant_ruby/bin',
		'/app/bin',
		'/app/vendor/php5-fpm/bin'
	]
}

exec { 'apt-get update':
	command => 'apt-get update',
}

include motd

#$devPackages = [ 'git-core', 'curl', 'postgresql', 'vim', 'autoconf', 'make', 'htop', 'unzip', 'libjpeg62', 'libfontconfig1', 'libxrender1', 'libxml2-dev']
#nvidia-current
$devPackages1 = [ 'python-software-properties', 'pkg-config', 'software-properties-common', 'xinit']
package { $devPackages1:
	ensure  => 'installed',
	require => Exec['apt-get update'],
}

exec { 'apt-get update2':
	command => 'apt-get update',
}

include xbmc

class {'transmission::daemon':
	rpc_enabled       => true,
	bind_address_ipv4 => $::ipaddress_eth0,
	rpc_bind_address  => $::ipaddress_eth0,
	rpc_username      => "torrent",
	rpc_whitelist     => "10.1.1.*",
	rpc_password      => "{a6d7691be9099dedbd410c8566113e386d6623a69huYVwhh"
}

#include ssh::server
include couchpotato 
