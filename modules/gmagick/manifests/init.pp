# A Chassis extensions to add gmagick to your Chassis server
class gmagick (
	$config,
	$path = '/vagrant/extensions/gmagick',
	$php  = $config[php]
) {

	if ( ! empty( $::config[disabled_extensions] ) and 'chassis/gmagick' in $config[disabled_extensions] ) {
		$package = absent
	} else {
		$package = latest
	}

	if versioncmp($php, '5.4') <= 0 {
		$php_package = 'php5'
	}
	else {
		$php_package = 'php'
	}

	package { "${$php_package}-gmagick":
		ensure  => $package,
		require => Package["php${$php}-fpm"],
		notify  => Service["php${$php}-fpm"]
	}
}
