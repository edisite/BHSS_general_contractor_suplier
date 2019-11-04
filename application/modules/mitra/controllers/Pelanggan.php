<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Pelanggan extends Admin_Controller {
	private $any_error = array();
	// Define Main Table
	public $tbl = 'm_pelanggan';

	public function __construct() {
        parent::__construct();
            $this->mPageTitlePrefix ='Data ';
	}

	public function index(){
		$this->view();
	}

	public function view(){
                $crud = $this->generate_crud($this->tbl);
                $crud->columns('pel_kode','pel_nama','pel_kategori','pel_kota',
                        'pel_alamat','pel_create_date');
                $crud->display_as('pel_kode', 'Kode');
                $crud->display_as('pel_nama', 'Nama');
                $crud->display_as('pel_kategori', 'Kategori');
                $crud->display_as('pel_kota', 'Kota');
                $crud->display_as('pel_alamat', 'Alamat');
                $crud->display_as('pel_create_date', 'Date');
                $crud->display_as('pel_create_by', ' By');
                $crud->display_as('pel_provinsi', ' Provinsi');
                $crud->display_as('pel_telp', ' Telp');
                $crud->display_as('pel_email', ' Email');
                $crud->display_as('pel_pic', ' Pic');
                $crud->display_as('pel_pajak', ' Pajak');
                $this->mPageTitle = 'Pelanggan';
                $crud->set_subject('Pelanggan');                
                
		$this->render_crud();
	}
	

}
