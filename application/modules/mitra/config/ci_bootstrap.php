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
	'site_name' => 'Mitra Panel',

	// Default page title prefix
	'page_title_prefix' => '',

	// Default page title
	'page_title' => '',

	// Default meta data
	'meta_data'	=> array(
		'author'		=> '',
		'description'	=> '',
		'keywords'		=> ''
	),
	
	// Default scripts to embed at page head or end
	'scripts' => array(
		'head'	=> array(
			// 'https://www.google.com/recaptcha/api.js'
		),
		'foot'	=> array(
        	'app-assets/vendors/js/vendors.min.js',
			'app-assets/vendors/js/ui/jquery.sticky.js',
			'app-assets/vendors/js/tables/datatable/datatables.min.js',
			'app-assets/vendors/js/charts/jquery.sparkline.min.js',
			'app-assets/vendors/js/forms/icheck/icheck.min.js',
			'app-assets/js/core/app-menu.js',
			'app-assets/js/core/app.js',
		),
	),

	// Default stylesheets to embed at page head
	'stylesheets' => array(
		'screen' => array(
                        'https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i%7CMuli:300,400,500,700',
			'app-assets/css/vendors.css',
			'app-assets/vendors/css/forms/icheck/icheck.css',
			'app-assets/vendors/css/forms/icheck/custom.css',
			'app-assets/css/app.css',
                        'app-assets/css/app.min.css',
			'assets/css/style.css',
			'app-assets/css/core/menu/menu-types/horizontal-top-icon-menu.css',
		)
	),

	// Default CSS class for <body> tag
	'body_class' => 'navbar-light',
	
	// Multilingual settings
	'languages' => array(
	),

	// Menu items
	'menu' => array(

			'masterdata1' => array(
			'name'		=> 'Master Data',
			'url'		=> '',
			'icon'		=> 'ft-server',
			'children'  => array(
				'Supplier'			=> 'supplier',
				'Pelanggan'			=> 'pelanggan',
				'Bidang'			=> 'masterdata/bidang',
				'Kategori Produk'               => 'masterdata/produk_kategori',
				'Gudang'			=> 'masterdata/gudang',
				'Periode'			=> 'masterdata/periode',
				'Satuan'			=> 'masterdata/satuan',
				'Daftar Bank'			=> 'masterdata/bank',
				'Daftar Provinsi'			=> 'masterdata/provinsi',
				'Daftar Kab. Kota'			=> 'masterdata/regensi',
			)
		),
			'project' => array(
			'name'		=> 'Project',
			'url'		=> '',
			'icon'		=> 'fa fa-pencil-square-o',
			'children'  => array(
				'Project'			=> 'project',
			)
		),
			'mpembelian' => array(
			'name'		=> 'Pembelian',
			'url'		=> '',
			'icon'		=> 'fa fa-calculator',
			'children'  => array(
				'Purchase Order'			=> 'PurchaseOrder/',
				'Request Pembelian Produk'			=> 'PermintaanPembelian/pembelian',
			)
		),
			'rpembelian' => array(
			'name'		=> 'Report Pembelian',
			'url'		=> '',
			'icon'		=> 'fa fa-bar-chart',
			'children'  => array(
				'Report Pembelian'			=> 'tes/tes',
			)
		),
			'mgudang' => array(
			'name'		=> 'Gudang',
			'url'		=> '',
			'icon'		=> 'fa fa-trello',
			'children'  => array(
				'Surat Permintaan Pembelian'			=> 'PermintaanPembelian/gudang',
				'Barang Masuk'			=> 'PenerimaanBarang/Gudang',
				'Barang Siap Kirim'			=> 'inventory/BarangSiapKirim',
				'Barang Keluar'			=> 'inventory/GudangOut',
				'Stok Gudang'			=> 'inventory/StokGudang',
			)
		),
			'mpenjualan' => array(
			'name'		=> 'Penjualan',
			'url'		=> '',
			'icon'		=> 'fa fa-cart-arrow-down',
			'children'  => array(
				'Transaksi Penjualan'			=> 'penjualan',
				'Pelanggan'			=> 'tes/tes',
			)
		),
			'rpenjualan' => array(
			'name'		=> 'Report Penjualan',
			'url'		=> '',
			'icon'		=> 'fa fa-line-chart',
			'children'  => array(
				'Report Jual Detail Produk'			=> 'penjualan/ReportDetailProduct',
				'Laporan Jual per Transaksi'			=> 'penjualan/ReportPerTransaction',
				'Cetak Transaksi Penjualan'			=> 'tes/tes',
			)
		),
			'mkeuangan' => array(
			'name'		=> 'Keuangan',
			'url'		=> '',
			'icon'		=> 'fa fa-balance-scale',
			'children'  => array(
				'Jurnal Entry'			=> 'jurnal',
				'Jurnal Posting'			=> 'accounting/JurnalPosting',
				'Laporan Jurnal Harian'			=> 'accounting/JurnalTransaksi',
				'Laporan Bukubesar'			=> 'accounting/Ledger',
				'Laporan Neraca Lajur'			=> 'accounting/NeracaLajur',
				'Laporan Laba Rugi'			=> 'accounting/LabaRugi',
				'Laporan Neraca'			=> 'accounting/Neraca',
				'Kelola Permintaan Modal'			=> 'tes/tes',
				'Chart of Account(CoA)'			=> 'accounting/coa',
			)
		),
			'msdm' => array(
			'name'		=> 'SDM',
			'url'		=> '',
			'icon'		=> 'fa fa-address-book-o',
			'children'  => array(
				'Karyawan'			=> 'masterdata/karyawan',
				'Kelola Gaji'			=> 'tes/tes',
				'Kelola Absensi'			=> 'tes/tes',
			)
		),

		'panel1' => array(
			'name'		=> 'Admin Panel',
			'url'		=> 'panel',
			'icon'		=> 'ft-users',
			'children'  => array(
				'Admin Users'			=> 'panel/admin_user',
				'Create Admin User'		=> 'panel/admin_user_create',
				'Admin User Groups'		=> 'panel/admin_user_group',
			)
		),
		'util' => array(
			'name'		=> 'Utilities',
			'url'		=> 'util',
			'icon'		=> 'fa fa-cogs',
			'children'  => array(
				'Database Versions'		=> 'util/list_db',
			)
		),
	),

	// Login page
	'login_url' => 'mitra/login',

	// Restricted pages
	'page_auth' => array(
		'user/create'				=> array('manager', 'manager', 'manager'),
		'user/group'				=> array('manager', 'manager', 'manager'),
		'panel'						=> array('manager','webmaster'),
		'panel/admin_user'			=> array('manager','webmaster'),
		'panel/admin_user_create'               => array('manager','webmaster'),
		'panel/admin_user_group'                => array('manager','webmaster'),
		'util'						=> array('manager'),
		'util/list_db'				=> array('manager'),
		'util/backup_db'			=> array('manager'),
		'util/restore_db'			=> array('manager'),
		'util/remove_db'			=> array('manager'),
	),

	// AdminLTE settings
	'adminlte' => array(
		'body_class' => array(
			'webmaster'	=> 'navbar-light',
			'admin'		=> 'navbar-light',
			'manager'	=> 'navbar-light',
			'staff'		=> 'navbar-light',
		)
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
$config['sess_cookie_name'] = 'kilostok_session_mitra';