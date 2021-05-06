<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Produk extends Admin_Controller {
	private $any_error = array();
	// Define Main Table
	public $tbl = 'm_produk';

	public function __construct() {
        parent::__construct();
            $this->mPageTitlePrefix ='Master Data - ';
	}

	public function index(){
		$this->view();
	}

	public function view(){
                $crud = $this->generate_crud($this->tbl);
                $crud->columns('produk_id','produk_nama','produk_status_aktif','produk_stok','product_harga');
                $crud->edit_fields('produk_nama','product_harga','produk_stok','produk_status_aktif');
                $crud->display_as('produk_id', 'Kode Produk');
                $crud->display_as('produk_nama', 'Nama');
                $crud->display_as('produk_status_aktif', 'Status');
                $crud->display_as('product_harga', 'Harga');
                $crud->display_as('produk_stok', 'Sisa Stok');
                $crud->callback_column('product_harga',array($this,'rp'));
                $crud->set_subject('Produk');                
                $crud->unset_add();
                $crud->unset_delete();
		$this->render_crud();
	}
            function Rp($value)    {
        if(is_numeric($value)){
            return number_format($value,0,",",".");
        }
        return $value;
    }
        

}
