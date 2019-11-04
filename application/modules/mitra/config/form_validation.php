<?php

/**
 * Config file for form validation
 * Reference: http://www.codeigniter.com/user_guide/libraries/form_validation.html
 * (Under section "Creating Sets of Rules")
 */

$config = array(

	// Admin User Login
	'login/index' => array(
		array(
			'field'		=> 'username',
			'label'		=> 'Username',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'password',
			'label'		=> 'Password',
			'rules'		=> 'required',
		),
	),

	// Create Admin User
	'register/index' => array(
		array(
			'field'		=> 'nama_perusahaan',
			'label'		=> 'Nama Perusahaan',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'first_name',
			'label'		=> 'Nama Depan',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'email',
			'label'		=> 'Email',
			'rules'		=> 'valid_email|is_unique[mitra_users.email]',
		),
		array(
			'field'		=> 'password',
			'label'		=> 'Password',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'retype_password',
			'label'		=> 'Retype Password',
			'rules'		=> 'required|matches[password]',
		),
	),

	// Reset Admin User Password
	
	// Create User
	'user/create' => array(
		array(
			'field'		=> 'first_name',
			'label'		=> 'First Name',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'last_name',
			'label'		=> 'Last Name',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'username',
			'label'		=> 'Username',
			'rules'		=> 'is_unique[users.username]',				// use email as username if empty
		),
		array(
			'field'		=> 'email',
			'label'		=> 'Email',
			'rules'		=> 'required|valid_email|is_unique[users.email]',
		),
		array(
			'field'		=> 'password',
			'label'		=> 'Password',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'retype_password',
			'label'		=> 'Retype Password',
			'rules'		=> 'required|matches[password]',
		),
	),

	// Reset User Password
	'user/reset_password' => array(
		array(
			'field'		=> 'new_password',
			'label'		=> 'New Password',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'retype_password',
			'label'		=> 'Retype Password',
			'rules'		=> 'required|matches[new_password]',
		),
	),

	'panel/admin_user_reset_password' => array(
		array(
			'field'		=> 'new_password',
			'label'		=> 'New Password',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'retype_password',
			'label'		=> 'Retype Password',
			'rules'		=> 'required|matches[new_password]',
		),
	),

	// Admin User Update Info
	'panel/account_update_info' => array(
		array(
			'field'		=> 'username',
			'label'		=> 'Username',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'password',
			'label'		=> 'Password',
			'rules'		=> 'required',
		),
	),

	// Admin User Change Password
	'panel/account_change_password' => array(
		array(
			'field'		=> 'new_password',
			'label'		=> 'New Password',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'retype_password',
			'label'		=> 'Retype Password',
			'rules'		=> 'required|matches[new_password]',
		),
	),
	'PermintaanPembelian/getFormGudang' => array(
		array(
			'field'		=> 'tanggal_permintaan',
			'label'		=> 'Tanggal Permintaan',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'tanggal_dibutuhkan',
			'label'		=> 'Tanggal Dibutuhkan',
			'rules'		=> 'required',
		),
	),
	'PurchaseOrder/getform' => array(
		array(
			'field'		=> 'nama_sales',
			'label'		=> 'Nama Sales',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'm_mitra_supplier_select',
			'label'		=> 'Nama Supplier',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'spp_project',
			'label'		=> 'No SPP ',
			'rules'		=> 'required',
		),
	),
	'PenerimaanBarang/getform' => array(
		array(
			'field'		=> 'tanggal_terima',
			'label'		=> 'Tanggal terima barang',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'm_karyawan_id',
			'label'		=> 'Nama Pemeriksa',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'm_gudang_id',
			'label'		=> 'Nama Gudang',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'no_sj',
			'label'		=> 'No. Surat Jalan',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'po_select',
			'label'		=> 'No PO (Purchase Order)',
			'rules'		=> 'required',
		),
	),

);

$config['recaptcha'] = array(
	'site_key'		=> '6LcYXcAUAAAAAKCcsOJUL7ydqCYJyaY-L6Ku4Bh3',
	'secret_key'	=> '6LcYXcAUAAAAAI7S8Z0WF0FOucHulkRJYyIr5ur6',
);