class motd {
	
	file { '/etc/motd':
    	source => puppet:///modules/motd/templates/motd.erb
    	#source => template('motd/motd.erb')
	}

}