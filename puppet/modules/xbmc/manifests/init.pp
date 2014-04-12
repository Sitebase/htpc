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

	file { "/home/wim/.config/autostart/xbmc.desktop":
	    path    => "/home/wim/.config/autostart/xbmc.desktop",
	    source => "puppet:///modules/xbmc/autostart",
	    mode   => "755",
	    owner  => wim,
	    group  => wim,
	}

	user { "xbmc":
	  ensure     => "present",
	  managehome => true,
	}

	#service { "xbmc":
	#	ensure	=> running,
	#	enable	=> true,
	#	status => '/etc/init.d/xbmc status | grep "is running"',
	#}

}