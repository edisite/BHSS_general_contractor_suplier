<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/*
| -------------------------------------------------------------------------
| CI Bootstrap 3 Configuration
| -------------------------------------------------------------------------
| This file lets you define default values to be passed into views 
| when calling MY_Controller's render() function. 
| 
| See example and detailed explanation from:
| 	/application/config/ci_bootstrap_example.php
*/

$config['ci_bootstrap'] = array(

	// Site name
	'site_name' => 'BHSS',

	// Default page title prefix
	'page_title_prefix' => '',

	// Default page title
	'page_title' => 'BHSS - GENERAL CONTRACTOR & SUPPLIER',

	// Default meta data
	'meta_data'	=> array(
		'author'		=> '',
		'description'	=> 'PT Bintang Harapan Sukses Sejahtera didirikan pada hari Senin tanggal 12 november 2018, 
					dengan bidang kegiatan usaha Pertambangan, Perkebunan dan Pertanian, Pembangunan dan General Supllier.',
		'keywords'		=> 'bhss, 
						general contractor and supplier, 
						jasa pengadaan kendaraan, 
						jasa pengadaan bahan bakar minyak, 
						produsen dan supplier kapur'
	),

	// Default scripts to embed at page head or end
	'scripts' => array(
		'head'	=> array(
		),
		'foot'	=> array(
			'assets/3th/vendor/jquery/jquery.min.js',
			'assets/3th/vendor/bootstrap/js/bootstrap.bundle.min.js',
			'assets/3th/vendor/jquery.easing/jquery.easing.min.js',
			'assets/3th/vendor/php-email-form/validate.js',
			'assets/3th/vendor/venobox/venobox.min.js',
			'assets/3th/vendor/waypoints/jquery.waypoints.min.js',
			'assets/3th/vendor/counterup/counterup.min.js',
			'assets/3th/vendor/owl.carousel/owl.carousel.min.js',
			'assets/3th/vendor/bootstrap-datepicker/js/bootstrap-datepicker.min.js',
			'assets/3th/js/main.js',
                        'assets/3th/js/jquery.min.js',
                        'assets/3th/bootstrap/js/bootstrap.min.js',
                        'https://code.jquery.com/jquery-3.2.1.slim.min.js',
                        'https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js',
                        'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js',
		),
	),

	// Default stylesheets to embed at page head
	'stylesheets' => array(
		'screen' => array(
			'assets/3th/vendor/bootstrap/css/bootstrap.min.css',
			'assets/3th/vendor/icofont/icofont.min.css',
			'assets/3th/vendor/boxicons/css/boxicons.min.css',
			'assets/3th/vendor/venobox/venobox.css',
			'assets/3th/vendor/animate.css/animate.min.css',
			'assets/3th/vendor/remixicon/remixicon.css',
			'assets/3th/vendor/owl.carousel/assets/owl.carousel.min.css',
			'assets/3th/vendor/bootstrap-datepicker/css/bootstrap-datepicker.min.css',
			'assets/3th/css/style.css',
			'assets/3th/css/NMDIGbanner.css',
			'https://fonts.googleapis.com/css?family=Abril+Fatface',
			'https://fonts.googleapis.com/css?family=Arbutus+Slab',
			'assets/3th/fonts/font-awesome.min.css',
                        'https://fonts.googleapis.com/css?family=Baloo',
                        'assets/3th/css/Timeline.css',
//                        'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css',
                    
		)
	),

	// Default CSS class for <body> tag
	'body_class' => '',
	
	// Multilingual settings
	'languages' => array(
		'default'		=> 'en',
		'autoload'		=> array('general'),
		'available'		=> array(
			'en' => array(
				'label'	=> 'English',
				'value'	=> 'english'
			),
			'zh' => array(
				'label'	=> '繁體中文',
				'value'	=> 'traditional-chinese'
			),
			'cn' => array(
				'label'	=> '简体中文',
				'value'	=> 'simplified-chinese'
			),
			'es' => array(
				'label'	=> 'Español',
				'value' => 'spanish'
			)
		)
	),

	// Google Analytics User ID
	'ga_id' => '',

	// Menu items
	'menu' => array(
		'home' => array(
			'name'		=> 'Beranda',
			'url'		=> '',
		),
		'tentangkami' => array(
			'name'		=> 'Tentang Kami',
			'url'		=> 'tentangkami',
		),
		'layanankami' => array(
			'name'		=> 'Layanan Kami',
			'url'		=> '',
//                        'icon'		=> 'fa fa-user',
			'children'  => array(
				'Jasa Penyewaan Kendaraan'        => 'layanan/kendaraan',
				'Jasa Bahan Bakar Minyak'		=> 'layanan/bahan_bakar',
				'Jasa Kapur'		=> 'layanan/produsen_kapur',
			)
		),
		'rekankerja' => array(
			'name'		=> 'Rekan Kerja',
			'url'		=> 'rekankerja',
		),
		'pesanan' => array(
			'name'		=> 'Pesanan',
			'url'		=> 'account/pesanan',
		),
		'hubungikami' => array(
			'name'		=> 'Hubungi Kami',
			'url'		=> 'hubungikami',
		),
	),

	// Login page
	'login_url' => 'auth',

	// Restricted pages
	'page_auth' => array(
	),

	// Email config
	'email' => array(
		'from_email'		=> '',
		'from_name'			=> '',
		'subject_prefix'	=> '',
		
		// Mailgun HTTP API
		'mailgun_api'		=> array(
			'domain'			=> '',
			'private_api_key'	=> ''
		),
	),

	// Debug tools
	'debug' => array(
		'view_data'	=> FALSE,
		'profiler'	=> FALSE
	),
);

/*
| -------------------------------------------------------------------------
| Override values from /application/config/config.php
| -------------------------------------------------------------------------
*/
$config['sess_cookie_name'] = 'ci_session_frontend';