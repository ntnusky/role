class role::manager {
	file { "/srv/storage":
		ensure => 'directory',
		owner => 'root',
		group => 'root',
		mode => '755',
	}
}
