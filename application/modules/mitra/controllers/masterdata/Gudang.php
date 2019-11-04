<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Gudang extends Admin_Controller {
	private $any_error = array();
	// Define Main Table
	public $tbl = "m_gudang";

	public function __construct() {
		parent::__construct();
		$this->mPageTitlePrefix = 'Master Data - ';
	}

	public function index(){
		$this->view();
	}

	public function view(){
		$crud = $this->generate_crud($this->tbl);
		$crud->columns('gudang_id','gudang_nama','gudang_alamat','gudang_create_date','gudang_create_by',
				'gudang_update_date','gudang_update_by');
		$crud->display_as('gudang_id', 'Kode');
		$crud->display_as('gudang_nama', 'Nama');
		$crud->display_as('gudang_alamat', 'Alamat');
		$crud->display_as('gudang_create_date', 'Create Date');
		$crud->display_as('gudang_create_by', 'Create By');
		$crud->display_as('gudang_update_date', 'Update Date');
		$crud->display_as('gudang_update_by	', 'Update By');
		$this->mPageTitle = 'Gudang';
		$crud->set_subject('Gudang');                
		
$this->render_crud();
}
	
}