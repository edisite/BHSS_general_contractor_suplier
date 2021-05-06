<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Admin Panel management, includes: 
 * 	- Admin Users CRUD
 * 	- Admin User Groups CRUD
 * 	- Admin User Reset Password
 * 	- Account Settings (for login user)
 */
class Transaksi extends Admin_Controller {
	public $tbl = 't_order';
	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
                $this->mPageTitlePrefix ='Admin Panel - ';
	}
	public function index()
	{
		# code...
		$crud = $this->generate_crud($this->tbl);
		$crud->set_theme('datatables');
                $crud->columns('order_tanggal', 
				'order_nomor_po', 
				'order_total'
				);
                $crud->display_as('order_tanggal', 'Tanggal');
                $crud->display_as('order_nomor_po', 'Nomor PO');
                $crud->display_as('order_total', 'Total');
                $this->mPageTitle = 'Daftar Transaksi';
                $crud->add_action('Detail Print', 'Detail', '_admin_office/transaksi/Detail', '');
                $crud->callback_column('order_total',array($this,'rp'));
                $crud->unset_add();
                $crud->unset_read();
                $crud->set_subject('Transaksi');                
                
		$this->render_crud();
	}
    public function Detail($id = '') {
        $select = '*';
        $where['data'][] = array(
                'column' => 'order_id',
                'param'	 => $id
        );
        $where['data'][] = array(
                'column' => 'order_id',
                'param'	 => $id
        );
        $order['data'][] = array(
                'column' => 'order_id',
                'type'	 => 'DESC'
        );
        $query = $this->mod->select($select,'t_order', NULL, $where, NULL, NULL, $order);
        $response = '';
        $no = 1;
//        $data   = array();
        if ($query<>false) {     
            foreach ($query->result() as $val) {
                
                $data['po']  = $val->order_nomor_po;
                $data['order_tanggal']  = $val->order_tanggal;
                $data['order_keterangan']  = $val->order_keterangan ?: '-';
                $data['m_produk_kategori_id']  = $val->m_produk_kategori_id ?: '-';
                $data['order_qty_unit']  = $val->order_qty_unit ?: '-';
                $data['order_subtotal']  = number_format($val->order_subtotal,2,',','.') ?: '-';
                $data['order_harga']  = number_format($val->order_harga,2,',','.') ?: '-';
                $data['order_total']  = number_format($val->order_total,2,',','.') ?: '-';
                $getuser_category = $this->GetUser($val->order_userid);
                foreach ($getuser_category as $u) {                    
                    if($u->category == 'perusahaan'){
                        $data['pembuat']  = $u->company_name.' / '.$u->first_name;
                    }else{
                        $data['pembuat']  = $u->company_name;
                    }
                    $data['namapembeli']  = $u->first_name;
                    $data['address']  = $u->address;
                    $data['category']  = ucfirst($u->category);
                }
                
                if($val->m_produk_kategori_id == "1"){
                    $order_satuan   = $val->order_lama_sewa ?: 0;
                }elseif($val->m_produk_kategori_id == "2"){
                    $order_satuan   = "Liter";
                }else{
                    $order_satuan   = "Bag";
                }
                $data['order_satuan']  = $order_satuan;
                $getproduk  = $this->GetProduk($val->m_produk_id);
                foreach ($getproduk as $p) {                    
                    $data['produkname']  = $p->produk_nama;
                }
            }
        }else{
            redirect(base_url().'account/pesanan');
        }
        $this->load->view('purchase_order_print',$data);
    }
    function Rp($value)    {
        if(is_numeric($value)){
            return number_format($value,0,",",".");
        }
        return $value;
    }
    function GetUser($id) {
        $select = '*';
        $where['data'][] = array(
                'column' => 'id',
                'param'	 => $id
        );
        $query = $this->mod->select($select,'users', NULL, $where, NULL, NULL, NULL);
        if ($query<>false) {     
           return $query->result();
        }
        return FALSE;
    }
    function GetProduk($id) {
        $select = '*';
        $where['data'][] = array(
                'column' => 'produk_id',
                'param'	 => $id
        );
        $query = $this->mod->select($select,'m_produk', NULL, $where, NULL, NULL, NULL);
        if ($query<>false) {     
           return $query->result();
        }
        return FALSE;
    }
	
}
