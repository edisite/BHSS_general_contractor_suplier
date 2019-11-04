<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of KategoriBarang
 *
 * @author edisite
 */
class PermintaanPembelian extends API_Controller{
    //put your code here
    private $any_error = array();
	// Define Main Table
    public $tbl = 'm_produk_kategori';
    public function __construct() {
        parent::__construct();
    }
    //loaddata 
    //1. Mitra - Barang Selected
    public function loadData_select_get(){
		$param = $this->input->get('q');
		if ($param!=NULL) {
			$param = $this->input->get('q');
		} else {
			$param = "";
		}
		$select = '*';
		$where['data'][] = array(
			'column' => 'kategori_status_aktif',
			'param'	 => 'y'
		);
		$where_like['data'][] = array(
			'column' => 'kategori_nama',
			'param'	 => $this->input->get('q')
		);
		$order['data'][] = array(
			'column' => 'kategori_nama',
			'type'	 => 'ASC'
		);
		$query = $this->mod->select($select, $this->tbl, NULL, $where, NULL, $where_like, $order);
		$response['items'] = array();
		if ($query<>false) {
			foreach ($query->result() as $val) {
				$response['items'][] = array(
					'id'	=> $val->kategori_id,
					'text'	=> $val->kategori_nama
				);
			}
			$response['status'] = '200';
		}
                $this->response($response);
	}
    
    //loaddata 
    //1. Mitra - PO -> Select SSP
    public function loadData_select_ssp_get(){
		$param = $this->input->get('q');
		if ($param!=NULL) {
			$param = $this->input->get('q');
		} else {
			$param = "";
		}
		$select = '*';
		$names = array('1', '2');
		$this->db->where_in('permintaan_pembelian_status', $names);
		$where_like['data'][] = array(
			'column' => 'permintaan_pembelian_nomor',
			'param'	 => $this->input->get('q')
		);
		$where_like['data'][] = array(
			'column' => 'permintaan_pembelian_tanggal',
			'param'	 => $this->input->get('q')
		);
		$order['data'][] = array(
			'column' => 'permintaan_pembelian_id',
			'type'	 => 'ASC'
		);

		$query = $this->mod->select($select, 't_permintaan_pembelian', NULL, NULL, NULL, $where_like, $order);
		$response['items'] = array();
		if ($query<>false) {
			foreach ($query->result() as $val) {
				$response['items'][] = array(
					'id'	=> $val->permintaan_pembelian_id,
					'text'	=> $val->permintaan_pembelian_nomor
				);
			}
			$response['status'] = '200';
		}
                $this->response($response);
	}
      //loaddata 
    //1. Mitra - PO -> Select kode barang SSP
    public function loadData_select_ssp_barang_get(){
		$param = $this->input->get('q');
		if ($param!=NULL) {
			$param = $this->input->get('q');
		} else {
			$param = "";
		}
		$select = '*';
		$where['data'][] = array(
			'column' => 'permintaan_pembelian_id',
			'param'	 => $this->input->get('id')
		);		
		$where_like['data'][] = array(
			'column' => 'produk_kode',
			'param'	 => $this->input->get('q')
		);
		$where_like['data'][] = array(
			'column' => 'produk_nama',
			'param'	 => $this->input->get('q')
		);
		$order['data'][] = array(
			'column' => 'produk_nama',
			'type'	 => 'ASC'
		);

		$query = $this->mod->select($select, 'v_permintaan_pembelian_produk', NULL, $where, NULL, $where_like, $order);
		$response['items'] = array();
		if ($query<>false) {
			foreach ($query->result() as $val) {
				$response['items'][] = array(
					'id'	=> $val->m_barang_id,
					'text'	=> $val->produk_kode." - ".$val->produk_nama
				);
			}
			$response['status'] = '200';
		}
                $this->response($response);
	}
      //loaddata 
    //1. Mitra - PO -> where kodebarang in SSP
    public function loadData_where_ssp_barang_by_id_get(){
		$select = '*';
		$where['data'][] = array(
			'column' => 'm_barang_id',
			'param'	 => $this->input->get('id')
		);
		$query = $this->mod->select($select,'v_permintaan_pembelian_produk', NULL, $where);
		if ($query<>false) {

			foreach ($query->result() as $val) {
				// CARI JENIS BARANG
				$response['val'][] = array(
					'kode' 							=> $val->produk_id,
					'project_kode' 					=> $val->mitra_project_kode,
					'barang_kode' 					=> $val->produk_kode,
					'barang_nomor' 					=> $val->produk_nomor,
					'barang_nama' 					=> $val->produk_nama,
					'barang_satuan' 				=> $val->satuan_nama,						
					'barang_qty' 					=> (float)$val->permintaan_pembeliandet_qty,						
					'permintaan_pembeliandet_id' 					=> $val->permintaan_pembeliandet_id,						
				);				
			}			
			$this->response($response);
		}
	}
}
