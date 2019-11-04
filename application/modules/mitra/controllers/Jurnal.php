<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Jurnal extends Admin_Controller {
	private $any_error = array();
        protected $idjurnal;
        // Define Main Table
	public $tbl = 't_transaksi_master';

	public function __construct() {
			parent::__construct();
			$this->load->library('system_message');
			$files = array(            
				'assets/js/accounting_scripts.js', 
				'app-assets/js/scripts/ui/jquery-ui/date-pickers.js',  
				'accounting_posting_scripts'            
			);
			$this->add_script($files);  
			$this->mPageTitlePrefix ='Accounting - ';
	}

	public function index(){
		$this->view();
	}


	public function view(){
		$this->load->library('form_builder');
		$form = $this->form_builder->create_form($this->mModule.'/jurnal/postdata','','class="form-horizontal"');
		$this->mViewData['form'] = $form;
		$this->mPageTitle = 'Jurnal Entry';
		$this->render('jurnal/V_jurnal');
		
	}
	public function Postdata()
	{

		$in_jtanggal 	= $this->input->post('jurnal_tanggal') 		?: date('d F, Y');
		$in_project    	= $this->input->post('spp_kode_project')     ?: '';
		$in_jurnal_tipe = $this->input->post('jurnal_tipe')     ?: '';
		$in_jnobukti    = $this->input->post('jurnal_no_bukti')     ?: '';
		$in_j_uraian    = $this->input->post('jurnal_keterangan')   ?: '';
		$in_jitemttl    = $this->input->post('jml_itemBarang')      ?: 0;
		$in_jkodecoa    = $this->input->post('kodecoa')             ?: '';
		$in_ji_debet    = $this->input->post('itemdebet')           ?: '';
		$in_ji_krdit    = $this->input->post('itemkredit')          ?: '';

		$in_jtanggal = DateTime::createFromFormat('d F, Y', $in_jtanggal);
		$in_jtanggal = $in_jtanggal->format('Y-m-d');

		$this->idjurnal = $this->gen->ID('m');
		$arr = array();
		if(empty($in_jitemttl)){  
			redirect($this->mModule.'/jurnal');	
		}
		
		                
		log_message('error', json_encode($arr));
		$arrinsert = array(
			'PROJECTKODE'       => $in_project,
			'NO_BUKTI'          => $in_jnobukti,
			'TGL_TRANS'         => $in_jtanggal,
			'URAIAN'            => $in_j_uraian,
			'USERID'            => $this->session->userdata('user_id'),
			'DTM_INSERT'        => date('Y-m-d H:i:s'),
			'acc_type_id'          => $in_jurnal_tipe,
		);
		if($in_jitemttl == 0){
			$this->system_message->set_error('Gagal, Transaksi kosong');
			redirect($this->mModule.'/jurnal');
		}
		log_message('error', json_encode($arrinsert));
		$master = $this->mod->insert_data_table('t_transaksi_jurnal_master',NULL,$arrinsert);
		if($master->status){

			for ($i = 0 ; $i < $in_jitemttl; $i++){

				$debet_int 		= $in_ji_debet[$i];
				$kredit_int 	= $in_ji_krdit[$i];
				
				$debet_int = str_replace(',', '', $debet_int);
				$kredit_int = str_replace(',', '', $kredit_int);
				$debet_int	= (float) $debet_int;
				$kredit_int	= (float) $kredit_int;
				$arr[] = array('MASTER_ID' => $master->output,'KODE_PERK' => $in_jkodecoa[$i],'DEBET' =>$debet_int,'KREDIT' => $kredit_int);
			}

			$detail = $this->mod->insert_data_batch('t_transaksi_jurnal_detail',$arr);
			log_message('error', json_encode($detail));
			if($detail->status == false){
				$this->db->delete('t_transaksi_jurnal_master',array('TRANS_ID' => $master->output));
				$response['status'] = '204';
				$this->system_message->set_error('Gagal');
			}else{
				$response['status'] = '200'; 
				$this->system_message->set_success('Berhasil');
			}
		}else{
			$this->system_message->set_error('Gagal');
		}

		

		redirect($this->mModule.'/jurnal');
	}
	public function loadData(){
		$priv = $this->cekUser(32);
		$select = '*';
		//LIMIT
		$limit = array(
			'start'  => $this->input->get('start'),
			'finish' => $this->input->get('length')
		);
		//WHERE LIKE
		$where_like['data'][] = array(
			'column' => 'JURNALID, NO_BUKTI,TGL_JURNAL, URAIAN, USERID, KODE_COA, NAMA_COA,UPLOADED',
			'param'	 => $this->input->get('search[value]')
		);
		//ORDER
		$index_order = $this->input->get('order[0][column]');
		$order['data'][] = array(
			'column' => $this->input->get('columns['.$index_order.'][name]'),
			'type'	 => $this->input->get('order[0][dir]')
		);

		$query_total = $this->mod->select($select, 'v_jurnal_posting');
		$query_filter = $this->mod->select($select, 'v_jurnal_posting', NULL, NULL, NULL, $where_like, $order);
		$query = $this->mod->select($select, 'v_jurnal_posting', NULL, NULL, NULL, $where_like, $order, $limit);

		$response['data'] = array();
		if ($query<>false) {
			$no = $limit['start']+1;
			
			foreach ($query->result() as $val) {
				$button = '';
//					
//					if($priv['update'] == 1)
//					{
//						$button = $button.'<button class="btn blue-ebonyclay" type="button" onclick="openFormBarang('.$val->JURNALID.')" title="Edit" data-toggle="modal" href="#modaladd">
//											<i class="icon-pencil text-center"></i>
//										</button>';
//								// <button class="btn blue-soft" type="button" onclick="openFormValueBarang('.$val->barang_id.')" title="Edit Value" data-toggle="modal" href="#modaladd">
//								// 	<i class="icon-notebook text-center"></i>
//								// </button>';
//					}
					if($priv['delete'] == 1)
					{
						$button = $button.'
									<button class="btn red-thunderbird" type="button" onclick="deleteData('.$val->JURNALID.')" title="Hapus Jurnal">
							<i class="icon-power text-center"></i>
						</button>';
					}
					
					$response['data'][] = array(
					$no,
					$val->UPLOADED,
					$val->JURNALID,
					$val->TGL_JURNAL,
					$val->NO_BUKTI,
					$val->URAIAN,
					$val->KODE_COA,
					$val->NAMA_COA,					
					$val->DEBET,
					$val->KREDIT,
					$button
				);
				$no++;
			}
		}

		$response['recordsTotal'] = 0;
		if ($query_total<>false) {
			$response['recordsTotal'] = $query_total->num_rows();
		}
		$response['recordsFiltered'] = 0;
		if ($query_filter<>false) {
			$response['recordsFiltered'] = $query_filter->num_rows();
		}

		echo json_encode($response);
	}

	// Function Insert & Update
	public function postData1(){
                header("Content-type:application/json");
		$id = $this->input->post('kode') ?: '';
		if (strlen($id)>0) {
			//UPDATE
			$data = $this->general_post_data(2, $id);
			$where['data'][] = array(
				'column' => 'barang_id',
				'param'	 => $id
			);
			$update = $this->mod->update_data_table($this->tbl, $where, $data);
			if($update->status) {
				$response['status'] = '200';
				$queryKonversi = $this->mod->select('*', 'm_konversi', null, $where);
				if($queryKonversi) {
					for($i = 0; $i < sizeof($this->input->post('konversi_akhir_satuan', TRUE)); $i++) {
						$dataKonversi = $this->general_post_data3(2, $val->konversi_id, $i, $id);
						if(@$where_det['data']) {
							unset($where_det['data']);
						}
						$where_det['data'][] = array(
							'column'	=> 'jenis_produksidet_id',
							'param'		=> $this->input->post('jenis_produksidet_id', TRUE)[$i]
						);
						$update_det = $this->mod->update_data_table('m_konversi', $where, $dataKonversi);
						if($update_det->status) {
							$response['status'] = '200';
						} else {
							$response['status'] = '204';
						}
					}
					foreach ($queryKonversi->result() as $val) {
						$whereKonversi['data'][] = array(
							'column' => 'konversi_id',
							'param'	 => $val->konversi_id
						);
						$updateKonversi = $this->mod->update_data_table('m_konversi', $whereKonversi, $dataKonversi);
					}
				}
				else
				{
					$dataKonversi = $this->general_post_data3(1, null, $id);
					$insert = $this->mod->insert_data_table('m_konversi', NULL, $dataKonversi);
				}
				if($data['barang_status_aktif'] == 'n')
				{
					$updateAttr = $this->nonaktif_atribut($id);
				}
			} else {
				$response['status'] = '204';
			}
		} 
                else {
			//INSERT
                        log_message('error', json_encode($this->input->post()));
                        if(count($this->input->post()) == 0){
                            $response['status'] = '204';
                            echo json_encode($response);
                            return;
                        }
                        //$in_jkodecoa    = $this->input->post('kodecoa')             ?: '';
                        $in_jtanggal    = $this->input->post('jurnal_tanggal')      ?: date('d/m/Y');
                        $in_jnobukti    = $this->input->post('jurnal_no_bukti')     ?: '';
                        $in_j_uraian    = $this->input->post('jurnal_keterangan')   ?: '';
                        $in_jitemttl    = $this->input->post('jml_itemOption')      ?: 0;
                        $in_jkodecoa    = $this->input->post('kodecoa')             ?: '';
                        $in_ji_debet    = $this->input->post('itemdebet')           ?: '';
                        $in_ji_krdit    = $this->input->post('itemkredit')          ?: '';
                        
                        //$filldate = date_format(date_create($in_jtanggal),"Y-m-d");
                        $filldate = DateTime::createFromFormat('d/m/Y', $in_jtanggal)->format('Y-m-d');
                        
                        $this->idjurnal = $this->gen->ID('m');
                        $arr = array();
                        if($in_jitemttl > 0){                            
                            for ($i = 0 ; $i < $in_jitemttl; $i++){
                                $arr[] = array('TRANS_ID' => $this->gen->ID('d'),'MASTER_ID' => $this->idjurnal,'KODE_PERK' => $in_jkodecoa[$i],'DEBET' => $in_ji_debet[$i],'KREDIT' => $in_ji_krdit[$i]);
                            }
                        }                       
                        log_message('error', json_encode($arr));
                        $arrinsert = array(
                            'TRANS_ID'          => $this->idjurnal,
                            'NO_BUKTI'          => $in_jnobukti,
                            'TGL_TRANS'         => $filldate,
                            'URAIAN'            => $in_j_uraian,
                            'USERID'            => $this->session->userdata('user_id'),
                            'CABANG_ID'            => $this->session->userdata('cabang_id'),
                            'DTM_INSERT'        => date('Y-m-d H:i:s'),
                        );
                        log_message('error', json_encode($arrinsert));
                        $master = $this->mod->insert_data_table('t_jurnal_umum_master',NULL,$arrinsert);
                        if($master->status){
                            $detail = $this->mod->insert_data_batch('t_jurnal_umum_detail',$arr);
                            log_message('error', json_encode($detail));
                            if($detail->status == false){
                                $this->db->delete('t_transaksi_master',array('TRANS_ID' => $this->idjurnal));
                                $response['status'] = '204';
                            }else{
                                $response['status'] = '200'; 
                            }
                        }else{
                            $response['status'] = '204';
                        }
                        
                        log_message('error', json_encode($arrinsert));
                        
		}
		echo json_encode($response);
	}

	public function postDataValue(){
		for ($i = 0; $i < sizeof($this->input->post('referensi_id', TRUE)); $i++) { 
			if (@$where['data']) {
				unset($where['data']);
			}
			$where['data'][] = array(
				'column' => 'referensi_type',
				'param'	 => $this->input->post('referensi_type', TRUE)[$i]
			);
			$where['data'][] = array(
				'column' => 'referensi_id',
				'param'	 => $this->input->post('referensi_id', TRUE)[$i]
			);
			$check = $this->mod->select('*', 'm_value', NULL, $where);
			if ($check) {
				$data = $this->general_post_data2($i, 2);
				$update = $this->mod->update_data_table('m_value', $where, $data);
				if($update->status) {
					$response['status'] = '200';
				} else {
					$response['status'] = '204';
				}
			} else {
				$data = $this->general_post_data2($i, 1);
				$insert = $this->mod->insert_data_table('m_value', NULL, $data);
				if($insert->status) {
					$response['status'] = '200';
				} else {
					$response['status'] = '204';
				}
			}
		}

		echo json_encode($response);
	}

	// Function Delete
	public function deleteData(){
		$id = $this->input->post('id');
		$data = $this->general_post_data(3, $id);
		$where['data'][] = array(
			'column' => 'barang_id',
			'param'	 => $id
		);
		$update = $this->mod->update_data_table($this->tbl, $where, $data);
		$updateAttr = $this->nonaktif_atribut($id);
		if($update->status) {
			$response['status'] = '200';
		} else {
			$response['status'] = '204';
		}
		echo json_encode($response);
	}
}
