<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends Admin_Controller {
	private $any_error = array();
	// Define Main Table
	public $tbl = 'users';

	public function __construct() {
        parent::__construct();
            $this->mPageTitlePrefix ='User - ';
	}

	public function index(){
		$this->view();
	}
	public function view(){
            $crud = $this->generate_crud($this->tbl);
            $crud->columns('first_name', 'email', 'active','category', 'company_name','handphone','address');
            $crud->display_as('category', 'Kategori');
            $crud->display_as('first_name', 'Nama');
            $crud->display_as('company_name', 'Kategori');
            $crud->display_as('address', 'Alamat');
            $crud->display_as('email', 'Email');
            $this->mPageTitle = 'Daftar Pelanggan';
            $crud->set_subject('Pelanggan');       
            $crud->unset_add();
            $crud->unset_delete();
            $this->render_crud();
	}
        public function Pesan() {
            $crud = $this->generate_crud('pesan_pelanggan');
            $crud->columns('tanggal_pesan', 'nama_pengirim', 'email_pengirim','subjek_pesan');
            $crud->display_as('category', 'Kategori');
            $crud->display_as('first_name', 'Nama');
            $crud->display_as('company_name', 'Kategori');
            $crud->display_as('address', 'Alamat');
            $crud->display_as('email', 'Email');
            $this->mPageTitle = 'Daftar Pesan Pelanggan';
            $crud->set_subject('Pesan');       
            $crud->unset_add();
//            $crud->unset_delete();
            $this->render_crud();
        }

}
