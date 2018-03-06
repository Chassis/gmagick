# A Chassis extensions to add gmagick to your Chassis server
class gmagick (
	$config,
	$path = '/vagrant/extensions/gmagick',
	$php = $config[php]
) {

	if versioncmp( $php, '5.4') <= 0 {
		$php_package = 'php5'
	}
	else {
		$php_package = "php${$php}"
	}

	package { "${$php_package}-gmagick":
		ensure  => latest,
		require => Package["${$php_package}-fpm"],
		notify  => Service["${$php_package}-fpm"]
	}
}
