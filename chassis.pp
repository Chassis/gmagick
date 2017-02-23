$gmagick_config = sz_load_config()
class { 'gmagick':
	path => '/vagrant/extensions/gmagick',
	php => $gmagick_config[php]
}
