<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Accounting extends Admin_Controller {
	private $any_error = array();
	// Define Main Table
	public $tbl = 'm_perkiraan';

	public function __construct() {
		parent::__construct();
		$this->mPageTitlePrefix ='Accounting - ';
		$files = array(            
			'assets/js/accounting_posting_scripts.js',            
		);
		$this->add_script($files);  
	}

	public function index(){
		$this->view();
	}

	public function Coa(){
		$this->mPageTitle = 'Chart of Accounts (CoA)';
		// $this->render('coa/V_coa');
		$this->mViewData['printview']	= $this->loadDataTreeView();
		$this->render('coa/V_coa_treeview');	
		
	}
	public function treeView(){
		$this->mPageTitle = 'Chart of Accounts (CoA)';
		
		$this->mViewData['printview']	= $this->loadDataTreeView();
		$this->render('coa/V_coa_treeview');		
	}

	public function JurnalTransaksi(){

		$this->mPageTitle = 'Lap. Jurnal';
		$this->render('jurnal/V_transaksi');
	}
	public function Ledger(){

		$this->mPageTitle = 'Buku Besar';
		$this->render('jurnal/V_Bukubesar');
	}
	public function Ledger_loaddata(){
		header('Content-Type: application/json');
		
		$get_datefrom 	= $this->input->get('date_from')	?: '';
		$get_dateto 	= $this->input->get('date_to')		?: '';
		$get_project 	= $this->input->get('project')		?: '';
		$get_coa 		= $this->input->get('kode_coa')		?: '';
		
		$get_datefrom	= DateTime::createFromFormat('d F, Y', $get_datefrom);
		$get_datefrom 	= $get_datefrom->format('Y-m-d');

		$get_dateto 	= DateTime::createFromFormat('d F, Y', $get_dateto);
		$get_dateto 	= $get_dateto->format('Y-m-d');

		if(empty($get_datefrom)){
			echo json_encode(array('status'=>'204'));
			return;
		}
		if(empty($get_dateto)){
			echo json_encode(array('status'=>'205'));
			return;
		}
		$response = '';
		if($get_coa){
			// 	for ($i = 0; $i < count($get_coa); $i++) {
					
				$response .= $this->Ledger_ByCoa($get_datefrom,$get_dateto,$get_coa,$get_project);
				// 	}
			}else{
				$query = $this->mod->select('*', 'm_perkiraan');
				if ($query<>false) {
					$no = 1;
					foreach ($query->result() as $val) {
						$response .= $this->Ledger_ByCoa($get_datefrom,$get_dateto,$val->KODE_PERK,$get_project,$val->NAMA_PERK);
				}
			}
		}
		

		echo json_encode(
					array(
						'status' => '200',
						'response' => $response
					)
				);

	}

	function Ledger_ByCoa($get_datefrom = '', $get_dateto = '', $kode_coa = '', $get_project = '', $coa_name = ''){
		$select = '*';
		$where['data'][] = array(
			'column' => 'TGL_JURNAL >=',
			'param'	 => $get_datefrom
		);
		$where['data'][] = array(
			'column' => 'TGL_JURNAL <=',
			'param'	 => $get_dateto
		);
		$where['data'][] = array(
			'column' => 'KODE_COA',
			'param'	 => $kode_coa
		);
		if($get_project == ""){
			$get_project	= "ALL PROJECT";
		}else{
			$where['data'][] = array(
				'column' => 'PROJECTKODE',
				'param'	 => $get_project
			);
		}
		$query = $this->mod->select($select, 'v_bukubesar', NULL, $where);
		$totaldebet = 0;
		$totalkredit = 0;
		$body = '';
		$header = '<thead class="thead blue-grey bg-info bg-ligten-3">
						<tr>
						<th scope="col" colspan="5">CoA : '. $kode_coa .'-'.ucwords($coa_name).'</th>						
						<th scope="col" colspan="1">Project : '.$get_project.'</th>
						</tr>
	  			</thead>';
		$header_table = '<thead class="thead bg-cyan bg-lighten-5">
						<tr>
							<th scope="col">No. </th>
							<th scope="col">Tanggal </th>
							<th scope="col">Jurnal ID </th>
							<th scope="col"> Uraian </th>
							<th scope="col"> Debet </th>
							<th scope="col"> Kredit </th>						
						</tr>
	  			</thead>';
		$response['data'] = array();
		if ($query<>false) {
			$no = 1;
			foreach ($query->result() as $val) {
				$body .= '	
				<tr>
					<th scope="row">'.$no.'</th>
					<td>'.$val->TGL_JURNAL.'</td>
					<td>'.$val->JURNALID.'</td>
					<td>'.$val->URAIAN.'</td>
					<td>'.$val->DEBET.'</td>
					<td>'.$val->KREDIT.'</td>
				  </tr>';
				  
				$totalkredit 	+= $val->KREDIT;
				$totaldebet 	+= $val->DEBET;
				$no++;
			}
		}else{
			$body .= '	
				<tr>
					<td colspan="6" class="text-center"> Record empty</td>
				  </tr>';
		}
		$footer = '
			<tr>
				<td colspan="4" class="text-right">TOTAL</td>
				<td>'.$totaldebet.'</td>
				<td>'.$totalkredit.'</td>
			</tr>
		';

		$response = '<div class="table-responsive">
		<table class="table">';
		$response .= $header;
		$response .= $header_table;
		$response .= '<tbody>';
		$response .= $body;
		$response .= '</tbody>';
		$response .= $footer;
		$response .= '</table></div>';
		return $response;

	}

	public function loadData(){
		$priv = $this->cekUser(22);
		$select = '*';
		//LIMIT
		$limit = array(
			'start'  => $this->input->get('start'),
			'finish' => $this->input->get('length')
		);
		//WHERE LIKE
		$where_like['data'][] = array(
			'column' => 'coa_kode, coa_nama, coa_kode_induk, coa_level, coa_gord, coa_saldo, coa_dk, cabang_nama',
			'param'	 => $this->input->get('search[value]')
		);
		//ORDER
		$index_order = $this->input->get('order[0][column]');
		$order['data'][] = array(
			'column' => $this->input->get('columns['.$index_order.'][name]'),
			'type'	 => $this->input->get('order[0][dir]')
		);

		$query_total = $this->mod->select($select, 'v_perkiraan');
		$query_filter = $this->mod->select($select, 'v_perkiraan', NULL, NULL, NULL, $where_like, $order);
		$query = $this->mod->select($select, 'v_perkiraan', NULL, NULL, NULL, $where_like, $order, $limit);

		$response['data'] = array();
		if ($query<>false) {
			$no = $limit['start']+1;
			foreach ($query->result() as $val) {
				$button = '';
                                        if($priv['update'] == 1)
					{
						$button = $button.'<button class="btn blue-soft" type="button" onclick="openFormCoa('.$val->coa_kode.')" title="Edit" data-toggle="modal" href="#modaladd">
								 	<i class="glyphicon glyphicon-pencil text-center"></i>
								 </button>';
					}
					if($priv['delete'] == 1)
					{
						$button = $button.'
									<button class="btn red-thunderbird" type="button" onclick="deleteData('.$val->coa_kode.')" title="Hapus Pengajuan Voucher">
							<i class="icon-power text-center"></i>
						</button>';
					}
				$response['data'][] = array(
					$no,					
					$val->coa_kode,
					$val->coa_nama,
					$val->coa_kode_induk,
					$val->coa_dk,
					$val->coa_tipe,
					$val->cabang_nama,
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
	
	public function JurnalTransaksi_loaddata(){

		$get_datefrom 	= $this->input->get('date_from')	?: '';
		$get_dateto 	= $this->input->get('date_to')		?: '';
		$get_project 	= $this->input->get('project')		?: '';
		
		$get_datefrom = DateTime::createFromFormat('d F, Y', $get_datefrom);
		$get_datefrom = $get_datefrom->format('Y-m-d');

		$get_dateto = DateTime::createFromFormat('d F, Y', $get_dateto);
		$get_dateto = $get_dateto->format('Y-m-d');

		$select = '*';
		//LIMIT
		$limit = array(
			'start'  => $this->input->get('start'),
			'finish' => $this->input->get('length')
		);
		$where['data'][] = array(
			'column' => 'TGL_JURNAL >=',
			'param'	 => $get_datefrom
		);
		$where['data'][] = array(
			'column' => 'TGL_JURNAL <=',
			'param'	 => $get_dateto
		);
		if($get_project == ""){

		}else{
			$where['data'][] = array(
				'column' => 'PROJECTKODE',
				'param'	 => $get_project
			);
		}
		//WHERE LIKE
		$where_like['data'][] = array(
			'column' => 'coa_kode, coa_nama, coa_kode_induk, coa_level, coa_gord, coa_saldo, coa_dk, cabang_nama',
			'param'	 => $this->input->get('search[value]')
		);
		//ORDER
		$index_order = $this->input->get('order[0][column]');
		$order['data'][] = array(
			'column' => $this->input->get('columns['.$index_order.'][name]'),
			'type'	 => $this->input->get('order[0][dir]')
		);

		$query_total = $this->mod->select($select, 'v_bukubesar');
		$query_filter = $this->mod->select($select, 'v_bukubesar', NULL, $where, NULL, NULL, $order);
		$query = $this->mod->select($select, 'v_bukubesar', NULL, $where, NULL, NULL, $order, NULL);
		$totaldebet = 0;
		$totalkredit = 0;
		$response['data'] = array();
		if ($query<>false) {
			$no = $limit['start']+1;
			foreach ($query->result() as $val) {

				$response['data'][] = array(
					$no,					
					$val->TGL_JURNAL,
					$val->PROJECTKODE,
					$val->JURNALID,
					$val->URAIAN,
					$val->KODE_COA,
					$this->format_money_id($val->DEBET),
					$this->format_money_id($val->KREDIT),
				);
				$totalkredit 	+= $val->KREDIT;
				$totaldebet 	+= $val->DEBET;
				$no++;
			}
		}
		$response['data'][] = array(
			'',
			'',
			'',
			'',
			'',
			'<b>Total</b>',
			$this->format_money_id($totaldebet),
			$this->format_money_id($totalkredit)
		);

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
	public function JurnalPosting_loaddata(){


		// $get_datefrom 	= $this->input->get('date_from')	?: '';
		// $get_dateto 	= $this->input->get('date_to')		?: '';
		// $get_project 	= $this->input->get('project')		?: '';
		
		// $get_datefrom = DateTime::createFromFormat('d F, Y', $get_datefrom);
		// $get_datefrom = $get_datefrom->format('Y-m-d');

		// $get_dateto = DateTime::createFromFormat('d F, Y', $get_dateto);
		// $get_dateto = $get_dateto->format('Y-m-d');

		$select = '*';
		//LIMIT
		// $limit = array(
		// 	'start'  => $this->input->get('start'),
		// 	'finish' => $this->input->get('length')
		// );
		// $where['data'][] = array(
		// 	'column' => 'TGL_JURNAL >=',
		// 	'param'	 => $get_datefrom
		// );
		// $where['data'][] = array(
		// 	'column' => 'TGL_JURNAL <=',
		// 	'param'	 => $get_dateto
		// );
		// if($get_project == ""){

		// }else{
		// 	$where['data'][] = array(
		// 		'column' => 'PROJECTKODE',
		// 		'param'	 => $get_project
		// 	);
		// }
		//WHERE LIKE
		$where_like['data'][] = array(
			'column' => 'TRANS_ID, TGL_TRANS,PROJECTKODE, URAIAN, acc_type_name',
			'param'	 => trim($this->input->get('search[value]'))
		);
		//ORDER
		// $index_order = $this->input->get('order[0][column]');
		// $order['data'][] = array(
		// 	'column' => $this->input->get('columns['.$index_order.'][name]'),
		// 	'type'	 => $this->input->get('order[0][dir]')
		// );

		$query_total = $this->mod->select($select, 'v_jurnal_posting');
		$query_filter = $this->mod->select($select, 'v_jurnal_posting', NULL, NULL, NULL, $where_like, NULL);
		$query = $this->mod->select($select, 'v_jurnal_posting', NULL, NULL, NULL, $where_like, NULL, NULL);
		$totaldebet = 0;
		$totalkredit = 0;
		$response['data'] = array();
		if ($query<>false) {
			$no = 0;
			foreach ($query->result() as $val) {
				$button = '<button class="btn btn-red" type="button" onclick="deleteData('.$val->TRANS_ID.')" title="Hapus Transaksi">
							<i class="icon-power text-center"></i>
						</button>';
				$response['data'][] = array(
					$val->TRANS_ID,		
					$val->TGL_TRANS,
					$val->UPLOADED,
					$val->PROJECTKODE,
					$val->acc_type_name,				
					$val->KODE_PERK,
					$this->format_money_id($val->DEBET),
					$this->format_money_id($val->KREDIT),
					$button
				);
				//TRANS_ID, PROJECTKODE, NO_BUKTI,TGL_TRANS, URAIAN,ACC_TYPE_NAME, KODE_PERK, DEBET, KREDIT,UPLOADED
				$totalkredit 	+= $val->KREDIT;
				$totaldebet 	+= $val->DEBET;
				$no++;
			}
		}
		$response['data'][] = array(
			'',
			'',
			'',
			'',
			'',
			'<b>Total</b>',
			'<b>'.$this->format_money_id($totaldebet).'</b>',
			'<b>'.$this->format_money_id($totalkredit).'</b>',
			''
		);

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
	function loadDataTreeView(){
	
		$select = ' `m_perkiraan`.`KODE_PERK` AS `coa_kode`,`m_perkiraan`.`NAMA_PERK` AS `coa_nama`,`m_perkiraan`.`KODE_INDUK` AS `coa_kode_induk`,`m_perkiraan`.`LEVEL_PERK` AS `coa_level`,`m_perkiraan`.`G_OR_D` AS `coa_gord`,`m_perkiraan`.`SALDO_AWAL` AS `coa_saldo`,`m_perkiraan`.`D_OR_K` AS `coa_dk`,`m_perkiraan`.`TYPE_PERK` AS `coa_tipe`, TRIM(REPLACE(`KODE_PERK`,".","")) AS `trimcoa` , TRIM(REPLACE(`KODE_INDUK`,".","")) AS `trimparent`';
		//LIMIT
		$where_coa2['data'][] = array(
				'column' => 'LEVEL_PERK <>',
				'param'	 => '0'
		);
		$where_coa2['data'][] = array(
				'column' => 'KODE_INDUK <>',
				'param'	 => ''
		);
		$index_order = $this->input->get('order[0][column]');
		$order['data'][] = array(
			'column' => $this->input->get('columns['.$index_order.'][name]'),
			'type'	 => $this->input->get('order[0][dir]')
		);
                $this->db->order_by('kode_perk','ASC');
		$query = $this->mod->select($select, 'm_perkiraan', NULL, $where_coa2, NULL, null, null, null);
                
		$response = '';
		if ($query<>false) {
                    foreach ($query->result() as $val) {					
                            $induk = $val->trimparent ?: '0';
                            if(empty($induk)):
                                $induk = 0;
                            endif;
                            $class ='';
                            if($val->coa_level == "2"){
                                $class = " style='background:#e6f2ff' ";
                            }
                            if($val->coa_level == "3"){
                                $class = " style='background:#cce6ff' ";
                            }
                            if($val->coa_level == "4"){
                                $class = " style='background:#ffe6e6' ";
                            }
                            if($val->coa_level == "5"){
                                $class = " style='background:#cce6gg' ";
                            }
                            $response .= '<tr data-id='.$val->trimcoa.' data-parent='.$induk.' data-level='.$val->coa_level.' '.$class.'>
                                <td data-column="name">'.$val->coa_kode.'</td>
                                <td>'.$val->coa_nama.'</td>
                                <td>'.$val->coa_kode_induk.'</td>
                                <td>'.$val->coa_level.'</td>
                                <td>'.$val->coa_dk.'</td>
                                <td>'.$val->coa_tipe.'</td>
                                </tr>'
                                    ;
                        

                    }
		}
		
		

		return $response;
	}   
	public function getForm(){
		$this->check_session();
		$this->load->view("coa/V_form_coa");
	}

	public function loadDataWhere(){
		$select = '*';
		$where['data'][] = array(
			'column' => 'KODE_PERK',
			'param'	 => $this->input->get('id')
		);
		$query = $this->mod->select($select, $this->tbl, NULL, $where);
		if ($query<>false) {

			foreach ($query->result() as $val) {
				$hasil['val2'] = array();
				if ($val->coa_header != 0) {
					$where_coa['data'][] = array(
						'column' => 'coa_id',
						'param'	 => $val->coa_header
					);
					$query_coa = $this->mod->select('*',$this->tbl,NULL,$where_coa);
					foreach ($query_coa->result() as $val2) {
						$hasil['val2'][] = array(
							'id' 	=> $val2->coa_id,
							'text' 	=> $val2->coa_kode . " - " . $val2->coa_nama
						);
					}
				}

				$hasil2['val2'] = array();
				if ($val->coa_subheader != 0) {
					$where_coa2['data'][] = array(
						'column' => 'coa_id',
						'param'	 => $val->coa_subheader
					);
					$query_coa2 = $this->mod->select('*',$this->tbl,NULL,$where_coa2);
					foreach ($query_coa2->result() as $val2) {
						$hasil2['val2'][] = array(
							'id' 	=> $val2->coa_id,
							'text' 	=> $val2->coa_kode . " - " . $val2->coa_nama
						);
					}
				}

				$hasil3['val2'] = array();
//				$where_cashflow['data'][] = array(
//					'column' => 'cashflow_id',
//					'param'	 => $val->m_cashflow_id
//				);
//				$query_chasflow = $this->mod->select('*','m_cashflow',NULL,$where_cashflow);
//				foreach ($query_chasflow->result() as $val2) {
//					$hasil3['val2'][] = array(
//						'id' 	=> $val2->cashflow_id,
//						'text' 	=> $val2->cashflow_nama
//					);
//				}

				$hasil4['val2'] = array();
				$where_cabang['data'][] = array(
					'column' => 'cabang_id',
					'param'	 => $val->m_cabang_id
				);
				$query_cabang = $this->mod->select('*','m_cabang',NULL,$where_cabang);
				foreach ($query_cabang->result() as $val2) {
					$hasil4['val2'][] = array(
						'id' 	=> $val2->cabang_id,
						'text' 	=> $val2->cabang_nama
					);
				}

				$response['val'][] = array(
					'kode' 				=> $val->coa_id,
					'm_cabang_id'		=> $hasil4,
					'coa_header' 		=> $hasil,
					'coa_subheader' 	=> $hasil2,
					'coa_kode' 			=> $val->coa_kode,
					'coa_nama' 			=> $val->coa_nama,
					'coa_tipe' 			=> $val->coa_tipe,
					'coa_debit_kredit' 	=> $val->coa_debit_kredit,
					'm_cashflow_id' 	=> $hasil3,
					'coa_keterangan' 	=> $val->coa_keterangan,
				);
			}

			echo json_encode($response);
		}
	}

	public function checkCOA(){
		$coa = $this->input->get('coa', TRUE);
                if(empty($coa)){
                    $response['status'] = '204';
                    echo json_encode($response);
                    return;
                }
		$select = '*';
		$where['data'][] = array(
			'column' => 'KODE_PERK',
			'param'	 => $coa
		);
		$query = $this->mod->select($select, $this->tbl, NULL, $where);
		if ($query<>false) {
			$response['status'] = '204';
		} else {
			$response['status'] = '200';
		}               

		echo json_encode($response);
	}
        public function checkCOAMaster(){
		$coa = $this->input->get('coa', TRUE);
                
//                $response['status'] = '555555555';
//                    echo json_encode($response);
//                    return;
		$select = '*';
//		$where['data'][] = array(
//			'column' => 'KODE_INDUK',
//			'param'	 => $coa
//		);
                $this->load->helper('string');
                $this->db->where('KODE_PERK',$coa);
                $this->db->limit(1);
                $this->db->order_by('KODE_PERK','DESC');
		$query = $this->mod->select($select, $this->tbl, NULL);
		if ($query<>false) {
                    foreach ($query->result() as $v) {
                        if($v->G_OR_D == 'G'){
                            $sts = '204';
                        }else{
                            $sts ='100';
                        }
                        $response['status'] = $sts;
                    }			
		} else {
			$response['status'] = '101';
		}   
                

		echo json_encode($response);
	}
        public function GenCOA(){
		$coa = $this->input->get('coa', TRUE);
                
//                $response['status'] = '555555555';
//                    echo json_encode($response);
//                    return;
		$select = '*';
//		$where['data'][] = array(
//			'column' => 'KODE_INDUK',
//			'param'	 => $coa
//		);
                $this->load->helper('string');
                $this->db->where('KODE_INDUK',$coa);
                $this->db->limit(1);
                $this->db->order_by('KODE_PERK','DESC');
		$query = $this->mod->select($select, $this->tbl, NULL);
		if ($query<>false) {
                    foreach ($query->result() as $v) {
                        $response['status'] = increment_string($v->KODE_PERK, '.', 2);
                    }			
		} else {
			$response['status'] = $coa.'.01';
		}   
                

		echo json_encode($response);
	}
	public function loadData_select($type){
		$param = $this->input->get('q');
		$cabangid = $this->input->get('cabang_id');
		if ($param!=NULL) {
			$param = $this->input->get('q');
		} else {
			$param = "";
		}
                $select = '*';
                        if($type == 1){			
                            $where['data'][] = array(
                                    'column' => 'CABANG_ID',
                                    'param'	 => $cabangid
                            );
                        }else{
                            $where = NULL;
                        }
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

	// Function Insert & Update
	public function postData(){
		$id = $this->input->post('kode');
		if (strlen($id)>0) {
			//UPDATE
			$data = $this->general_post_data(2, $id);
			$where['data'][] = array(
				'column' => 'coa_id',
				'param'	 => $id
			);
			$update = $this->mod->update_data_table($this->tbl, $where, $data);
			if($update->status) {
				$response['status'] = '200';
			} else {
				$response['status'] = '204';
			}
		} else {
			//INSERT
			$data = $this->general_post_data(1);
			$insert = $this->mod->insert_data_table($this->tbl, NULL, $data);
			if($insert->status) {
				$response['status'] = '200';
			} else {
				$response['status'] = '204';
			}
		}
		
		echo json_encode($response);
	}
	public function NeracaLajur(){

		$this->mPageTitle = 'Lap. Neraca Lajur';
		$this->render('jurnal/V_neraca_lajur');
	}
	public function JurnalPosting(){

		$this->mPageTitle = 'Jurnal Posting';
		$this->render('jurnal/V_posting');
	}

	function jurnalUmumPosting_action(){		
		$no = 1;
		$select = '*';
		$query = $this->mod->select($select, 't_transaksi_jurnal_master');
		if ($query<>false) {			
			foreach ($query->result() as $val) {					
				$this->jurnalUmumPosting_exec($val->TRANS_ID, $query->result());				
			}
			$a = array('status' => '200');
		}else{
			$a = array('status' => '204');
		}
		echo json_encode($a);
                
	}
        
	function jurnalUmumPosting_exec($master_id = '', $getdata = array()) {
						
			$this->idjurnal = $this->gen->ID('m');
			$arrinsert = array();
			if($getdata){
				foreach ($getdata as $val) {
					$arrinsert = array(
						'TRANS_ID'          => $this->idjurnal,
						'MITRAID'          	=> '',
						'PROJECTKODE'       => $val->PROJECTKODE,
						'KODE_JURNAL'       => $val->KODE_JURNAL,
						'NO_BUKTI'          => $val->NO_BUKTI,
						'TGL_TRANS'         => $val->TGL_TRANS,
						'URAIAN'            => $val->URAIAN,
						'USERID'            => $val->USERID,
						'CABANG_ID'         => $val->CABANG_ID,
						'DTM_INSERT'        => $val->DTM_INSERT,
						'acc_type_id'       => $val->acc_type_id,
						'DTM_POSTING'       => date('Y-m-d H:i:s'),
						'USER_POSTING'      => $this->session->userdata('user_id'),
					);
				}
			}  
			//
			$master = $this->mod->insert_data_table('t_transaksi_master',NULL,$arrinsert);
			if ($master<>false) {
				
				$detail_select = '*';
				$detail_where['data'][] = array(
					'column'        => 'MASTER_ID',
					'param'         => $master_id
				);
				$t_detail = $this->mod->select($detail_select, 't_transaksi_jurnal_detail',NULL,$detail_where);
				//
				if ($t_detail<>false) {
						//sudah ada
						foreach ($t_detail->result() as $val_detail) {
							$arrinsert_detail = array(
								'TRANS_ID'          	=> $this->gen->ID('d'),
								'MASTER_ID'          	=> $this->idjurnal,
								'KODE_PERK'       		=> $val_detail->KODE_PERK,
								'DEBET'       			=> $val_detail->DEBET,
								'KREDIT'          		=> $val_detail->KREDIT,
								'KETERANGAN'         	=> $val_detail->KETERANGAN,
							);
							$this->mod->insert_data_table('t_transaksi_detail',NULL,$arrinsert_detail);
							$this->db->delete('t_transaksi_jurnal_master',array('TRANS_ID' => $master_id));
							$this->db->delete('t_transaksi_jurnal_detail',array('MASTER_ID' => $master_id));
						}
					}                           
			}else{
					$dataAttr = array(
						'STS' => '1',
						'RES' => 'gagal insert'
					);
					$this->db->where('TRANS_ID', $master_id);
					$this->db->update('t_transaksi_jurnal_master', $dataAttr);
					return;
			}
			
        }
}
