<?php

/**
 * Config file for form validation
 * http://www.codeigniter.com/user_guide/libraries/form_validation.html (Under section "Creating Sets of Rules")
 */

$config = array(

	/** Example: 
         * 
         */
	'auth/index' => array(
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
	'auth/register' => array(
		array(
			'field'		=> 'name_perusahaan',
			'label'		=> 'Nama Perusahaan',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'kategori',
			'label'		=> 'Kategori',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'handphone',
			'label'		=> 'Handphone',
			'rules'		=> 'required|numeric',
		),
		array(
			'field'		=> 'alamat',
			'label'		=> 'Alamat',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'nama_pengguna',
			'label'		=> 'Nama Pengguna',
			'rules'		=> 'required',
		),
		array(
			'field'		=> 'email',
			'label'		=> 'Email',
			'rules'		=> 'valid_email|is_unique[users.email]',
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
        'hubungikami/index' => array(
            array(
                    'field'		=> 'subject',
                    'label'		=> 'Judul Pesan',
                    'rules'		=> 'required',
            ),
            array(
                    'field'		=> 'message',
                    'label'		=> 'Isi Pesan',
                    'rules'		=> 'required',
            ),
            array(
                    'field'		=> 'name',
                    'label'		=> 'Nama',
                    'rules'		=> 'required',
            ),
            array(
                    'field'		=> 'email',
                    'label'		=> 'Email',
                    'rules'		=> 'valid_email',
            ),	
	),
        'account/index' => array(
            array(
                    'field'		=> 'nama_lengkap',
                    'label'		=> 'Nama Lengkap',
                    'rules'		=> 'required',
            ),
            array(
                    'field'		=> 'hp',
                    'label'		=> 'Handphone',
                    'rules'		=> 'required|numeric',
            ),
            array(
                    'field'		=> 'kategori',
                    'label'		=> 'Kategori',
                    'rules'		=> 'required',
            ),
            array(
                    'field'		=> 'alamat',
                    'label'		=> 'Alamat',
                    'rules'		=> 'required',
            ),
            array(
                    'field'		=> 'name_perusahaan',
                    'label'		=> 'Nama Perusahaan',
                    'rules'		=> 'required',
            ),
            array(
                    'field'		=> 'email',
                    'label'		=> 'Email',
                    'rules'		=> 'valid_email',
            ),	
	)
    );

/**
 * Google reCAPTCHA settings
 * https://www.google.com/recaptcha/
 */
$config['recaptcha'] = array(
	'site_key'		=> '6LcYXcAUAAAAAKCcsOJUL7ydqCYJyaY-L6Ku4Bh3',
	'secret_key'	=> '6LcYXcAUAAAAAI7S8Z0WF0FOucHulkRJYyIr5ur6',
);
