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
class Barang extends API_Controller{
    //put your code here
    private $any_error = array();
	// Define Main Table
    public $tbl = 'v_produk';
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
			'column' => 'mitra_project_kode',
			'param'	 => $this->input->get('id')
		);
		// $where_like['data'][] = array(
		// 	'column' => 'produk_kode',
		// 	'param'	 => $this->input->get('q')
		// );
		$where_like['data'][] = array(
			'column' => 'produk_nama',
			'param'	 => $this->input->get('q')
		);
		$order['data'][] = array(
			'column' => 'produk_nama',
			'type'	 => 'ASC'
		);
		$query = $this->mod->select($select, $this->tbl, NULL, $where, NULL, $where_like, $order);
		$response['items'] = array();
		if ($query<>false) {
			foreach ($query->result() as $val) {
				$response['items'][] = array(
					'id'	=> $val->produk_id,
					'text'	=> $val->produk_kode .' - '. $val->produk_nama
				);
			}
			$response['status'] = '200';
		}
		$this->response($response);
            
	}
	public function loadData_where_id_get(){
		$select = '*';
		$where['data'][] = array(
			'column' => 'produk_id',
			'param'	 => $this->input->get('id')
		);
		$query = $this->mod->select($select, $this->tbl, NULL, $where);
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
							
				);				
			}
			
			$this->response($response);
		}
	}

	public function loadData_where_orderid_get(){
		$select = '*';
		$where['data'][] = array(
			'column' => 'order_id',
			'param'	 => $this->input->get('id')
		);
		$query = $this->mod->select($select, 'v_order_barang', NULL, $where);
		if ($query<>false) {
			foreach ($query->result() as $val) {
				// CARI JENIS BARANG
				$selisih = $val->orderdet_qty - $val->orderdet_qty_realisasi;
				$response['val'][] = array(
					'kode' 							=> $val->m_barang_id,
					'project_kode' 					=> $val->project_kode,
					'barang_kode' 					=> $val->produk_kode,
					'barang_nama' 					=> $val->produk_nama,
					'barang_satuan' 				=> $val->satuan_nama,						
					'order_qty' 					=> $val->orderdet_qty,						
					'orderdet_id' 					=> $val->orderdet_id,						
					'order_qty_realisasi' 			=> $val->orderdet_qty_realisasi,						
					'order_qty_selisih' 			=> $selisih,						
					'order_status' 					=> $val->orderdet_status,						
				);				
			}			
			$this->response($response);
		}
	}


 
    
}
