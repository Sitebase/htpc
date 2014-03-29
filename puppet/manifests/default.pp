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

file { '/etc/motd':
    source => "/vagrant/files/motd"
}

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

$devPackages2 = [ 'xbmc', 'xbmc-standalone']
package { $devPackages2:
	ensure  => 'installed',
	require => Exec['apt-get update2'],
}

file { "/etc/init.d/xbmc":
    path    => "/etc/init.d/xbmc",
    source => "/vagrant/files/xbmc.d",
    mode   => "755",
    owner  => root,
    group  => root,
}

user { "xbmc":
  ensure     => "present",
  managehome => true,
}

service { "xbmc":
	ensure	=> running,
	enable	=> true,
	status => '/etc/init.d/xbmc status | grep "is running"',
}

include vcsrepo 
#include ssh::server
include couchpotato 
