class xbmc {

  	$devPackages2 = [ 'xbmc', 'xbmc-standalone']
	package { $devPackages2:
		ensure  => 'installed',
		require => Exec['apt-get update2'],
	}

	file { "/etc/init.d/xbmc":
	    path    => "/etc/init.d/xbmc",
	    source => "puppet:///modules/xbmc/init",
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

}