<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Karyawan extends Admin_Controller {	
	// Define Main Table
	public $tbl = "m_karyawan";

	public function __construct() {
		parent::__construct();
		$this->mPageTitlePrefix = 'Master Data - ';
	}

	public function index(){
		$this->view();
	}

	public function view(){
		$crud = $this->generate_crud($this->tbl);
		 $crud->columns('karyawan_id','karyawan_nip','karyawan_nama','karyawan_alamat','karyawan_create_date','karyawan_create_by','karyawan_update_date','karyawan_update_by');
		$crud->display_as('karyawan_id', 'Kode');
		$crud->display_as('karyawan_nip', 'NIP');
		$crud->display_as('karyawan_nama', 'Nama');
		$crud->display_as('karyawan_alamat', 'Alamat');
		$crud->display_as('karyawan_telepon', 'Handphone');
		$crud->display_as('karyawan_status_aktif', 'Status Karyawan');
		$crud->display_as('karyawan_create_date', 'Create Date');
		$crud->display_as('karyawan_create_by', 'Create By');
		$crud->display_as('karyawan_update_date', 'Update Date');
		$crud->display_as('karyawan_update_by', 'Update By');
		$this->mPageTitle = 'Karyawan';
		$crud->set_subject('Karyawan');               
		$this->render_crud();
	}
	
}