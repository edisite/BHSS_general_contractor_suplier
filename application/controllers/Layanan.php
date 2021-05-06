<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Layanan
 *
 * @author edisite
 */
class Layanan extends MY_Controller{
    //put your code here
    public function __construct() {
        parent::__construct();
    }
    public function index() {
        $this->kendaraan();
    }
    public function kendaraan() {
        $this->render('l_kendaraan');
    }
    public function bahan_bakar() {
        $this->render('l_pengadaan_bahan_bakar_minyak');
    }
    public function produsen_kapur() {
        $this->render('l_produsen_supplier_kapur');
    }
}
