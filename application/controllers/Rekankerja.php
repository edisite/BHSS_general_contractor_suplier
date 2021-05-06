<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of RekanKerja
 *
 * @author edisite
 */
class Rekankerja extends MY_Controller {
    //put your code here
    public function __construct() {
        parent::__construct();
    }
    public function index() {
        $this->render('rekankerja_detail');
    }
    
}
