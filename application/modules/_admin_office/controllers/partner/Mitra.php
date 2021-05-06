<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Mitra extends Admin_Controller {
	private $any_error = array();
	// Define Main Table
	public $tbl = 'mitra_users';

	public function __construct() {
        parent::__construct();
            $this->mPageTitlePrefix ='Mitra - ';
	}

	public function index(){
		$this->view();
	}

	public function view(){
                $crud = $this->generate_crud($this->tbl);
                
                $crud->columns('username', 'first_name', 'last_name', 'active','created_on');
                $crud->display_as('username', 'Username');
                $crud->display_as('first_name', 'Nama Depan');
                $crud->display_as('last_name', 'Nama Belakang');
                $crud->display_as('active', 'Status');
                $crud->display_as('created_on', 'Register');
                $crud->display_as('periode_update_date', 'Update Date');
                $crud->display_as('periode_update_by', 'Update By');
                $this->mPageTitle = 'Daftar Mitra';
                $crud->set_subject('Mitra');                
                
		$this->render_crud();
	}
	

}
