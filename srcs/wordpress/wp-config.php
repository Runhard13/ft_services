<?php
/**
 * Custom WordPress configurations on "wp-config.php" file.
 *
 * This file has the following configurations: MySQL settings, Table Prefix, Secret Keys, WordPress Language, ABSPATH and more.
 * For more information visit {@link https://codex.wordpress.org/Editing_wp-config.php Editing wp-config.php} Codex page.
 * Created using {@link http://generatewp.com/wp-config/ wp-config.php File Generator} on GenerateWP.com.
 *
 * @package WordPress
 * @generator GenerateWP.com
 */


/* MySQL settings */
define( 'DB_NAME',     'wordpress' );
define( 'DB_USER',     'user' );
define( 'DB_PASSWORD', 'password' );
define( 'DB_HOST',     'mysql-service:3306' );
define( 'DB_CHARSET',  'utf8' );

/* MySQL database table prefix. */
$table_prefix = 'wp_';


/* Authentication Unique Keys and Salts. */
/* https://api.wordpress.org/secret-key/1.1/salt/ */
define('AUTH_KEY',         'i$!|{<&Y).K?c$|(phC!kbUpZu-ZMsn+@~C$w61N<[Ts9XlIv};ZnQG|=)v2-Y/R');
define('SECURE_AUTH_KEY',  '*@<t$~,&+y-+8qu !?G3H608?_I]VHQ+@Vg,vqO#C!9b[)sAL HzAN7qlggmZN0w');
define('LOGGED_IN_KEY',    'a[+)Q}b{tj k8W4|.j@PZOy#H37Iz6:h.{h0?)~kv]g>/?{R^c1a+O{&lJiran}i');
define('NONCE_KEY',        'wc(ZD<SsREA0 l%iK)e78Dh<2]%;XamkB>w3F. =l6m:T,{K]#v69*bFGBjCio!3');
define('AUTH_SALT',        'UHe)F2H$t0AG.7g}Ps{-Ta(ph<%*NZ,Zrmbpf|](zlqaeFlh|s1j/|qQrfESAzr-');
define('SECURE_AUTH_SALT', 'X1%7SxGRlnn]WgEf&NrZlzi+4X]IGa6mICPJ3BwoF4Oze5R;FV0QxRh$:-2z6|Tw');
define('LOGGED_IN_SALT',   '1|TQ;[(i9K^ss-;:u(<#O+FfM_`Xx-+=N4!{6@C,zoh`Iz_qWgl/5]m-S^{ENitn');
define('NONCE_SALT',       '_MD2-QT;GM(sb+[~l-sanEqn0*KZ~x,Tumd+I9Cd5yq/VL(b(2lL3:Vk|*r4g!M-');


/* Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define( 'ABSPATH', __DIR__ . '/' );

/* Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');