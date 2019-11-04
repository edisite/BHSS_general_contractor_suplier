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
class Accounting extends API_Controller{
    //put your code here
    private $any_error = array();
	// Define Main Table
    public $tbl = 'm_perkiraan';
    public function __construct() {
        parent::__construct();
    }
    //loaddata 
    //1. Mitra - Accounting -> jurnal : COA Selected
    public function loadData_select_get(){
		$param = $this->input->get('q');
		if ($param!=NULL) {
			$param = $this->input->get('q');
		} else {
			$param = "";
		}
		$select = '*';
		// $where['data'][] = array(
		// 	'column' => 'mitra_project_kode',
		// 	'param'	 => $this->input->get('id')
		// );
		// $where_like['data'][] = array(
		// 	'column' => 'produk_kode',
		// 	'param'	 => $this->input->get('q')
		// );
		$where_like['data'][] = array(
			'column' => 'NAMA_PERK',
			'param'	 => $this->input->get('q')
		);
		$where_like['data'][] = array(
			'column' => 'KODE_PERK',
			'param'	 => $this->input->get('q')
		);
		$order['data'][] = array(
			'column' => 'KODE_PERK',
			'type'	 => 'ASC'
		);
		$query = $this->mod->select($select, $this->tbl, NULL, NULL, NULL, $where_like, $order);
		$response['items'] = array();
		if ($query<>false) {
			foreach ($query->result() as $val) {
				$response['items'][] = array(
					'id'	=> $val->KODE_PERK,
					'text'	=> $val->KODE_PERK .' - '. $val->NAMA_PERK
				);
			}
			$response['status'] = '200';
		}
		$this->response($response);
            
	}

	public function loadData_select_coa_get(){
		$param = $this->input->get('q');
		
		if ($param!=NULL) {
			$param = $this->input->get('q');
		} else {
			$param = "";
		}
//                var_dump(is_numeric($param));
//                return;
                $select = '*';
                        $where = NULL;
                        
                        if(is_numeric($param) == true)
                        {
                            $this->db->like('KODE_PERK',$param,'after');
                            $where_like =  null;
                        }
                        else
                        {
                            $where_like['data'][] = array(
				'column' => 'NAMA_PERK, KODE_PERK',
				'param'	 => $this->input->get('q')
                            );
                        }
			
			$order['data'][] = array(
				'column' => 'KODE_PERK',
				'type'	 => 'ASC'
			);

		$query = $this->mod->select($select, $this->tbl, NULL, $where, NULL, $where_like, $order);
		$response['items'] = array();
		if ($query<>false) {
			foreach ($query->result() as $val) {
                                if($val->G_OR_D == "D"){
                                    $gord	= $val->KODE_PERK . ' - ' . ucwords(strtolower($val->NAMA_PERK));
                                }else{
                                    $gord	= $val->KODE_PERK . ' - ' . $val->NAMA_PERK;
                                }
				$response['items'][] = array(
					'id'	=> $val->KODE_PERK,                                        
					'text'	=> $gord
                                        
				);
			}
			$response['status'] = '200';
		}

		echo json_encode($response);
	}



 
    
}
