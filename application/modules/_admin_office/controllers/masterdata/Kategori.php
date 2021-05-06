<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kategori extends Admin_Controller {
	private $any_error = array();
	// Define Main Table
	public $tbl = 'm_produk_kategori';

	public function __construct() {
        parent::__construct();
            $this->mPageTitlePrefix ='Master Data - ';
	}

	public function index(){
		$this->view();
	}

	public function view(){
                $crud = $this->generate_crud($this->tbl);
//                $crud->set_theme('datatables');
                $crud->columns('kategori_id','kategori_nama');
                $crud->display_as('kategori_id', 'Kode Kategori');
                $crud->display_as('kategori_nama', 'Nama');
//                $crud->display_as('status', 'Status');
//                $crud->display_as('biaya_adm', 'Biaya Admin');
//                $crud->display_as('keterangan', 'Keterangan');
                $this->mPageTitle = 'Daftar Kategori';
                $crud->set_subject('Kategori');
                $crud->unset_add();
                $crud->unset_delete();
                
                
		$this->render_crud();
	}
	

}
