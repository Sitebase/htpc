class motd {
	
	file { '/etc/motd':
    	source => template('motd/motd.erb')
	}

}