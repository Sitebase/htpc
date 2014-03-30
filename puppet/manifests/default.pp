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

#include ssh::server
include couchpotato 
