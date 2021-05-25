<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Account
 *
 * @author edisite
 */
class Account extends MY_Controller{
    //put your code here
    private $saldo_akhir, $jml_pinjmana = 0;
    public function __construct() {
        parent::__construct();
        $this->_setup();
        $this->load->library('form_builder');
    }
    public function _setup() {     
        if ( !$this->ion_auth->logged_in() )
        {
            if ( $redirect_url==NULL )
                    $redirect_url = $this->mConfig['login_url'];
            redirect($redirect_url);                           
        }
        
    }

    public function Pesanan() {
        $form = $this->form_builder->create_form();
        $select = '*';
        $where['data'][] = array(
                'column' => 'order_userid',
                'param'	 => $this->session->userdata('user_id')
        );
        $order['data'][] = array(
                'column' => 'order_id',
                'type'	 => 'DESC'
        );
        $query = $this->mod->select($select,'t_order    ', NULL, $where, NULL, NULL, $order);
        $response = '';
        $no = 1;
        if ($query<>false) {           
            foreach ($query->result() as $val) {

                $getprodukname  = $this->gen->ProdukNameByID($val->m_produk_id);
                $response .= '<tr>'
                        . '<td class="text-sm">'.$no.'</td>'
                        . '<td>'.$val->order_tanggal.'</td>'
                        . '<td class="text-sm">'.$getprodukname.'</td>'
                        . '<td align="right">'.number_format($val->order_total,2,',','.').'</td>'
//                        . '<td align="center">'.$val->order_status.'</td>'
                        . '<td align="center">
                            <div class="btn-group btn-group-sm">';
                if($val->order_status == "1"){
                    $response .= '<a href="'.base_url().'account/OrderEdit/'.$val->order_id.'" class="btn btn-warning">Edit</a>
                                    <a href="'.base_url().'account/OrderDelete/'.$val->order_id.'" class="btn btn-danger">Delete</a>';
                        
                }elseif($val->order_status == "2"){
                    $response .= '<a href="'.base_url().'account/PurchaseOrder/'.$val->order_id.'" class="btn btn-info">Terkirim</a>';
                }else{
                    
                }
                $response .= '  
                            </div>
                            </td>'
                        . '</tr>';
                $no++;
            }
        }else{
            $response .= '<tr><td colspan="6" align="center">Belum ada pesanan</td></tr>';
        }
        $this->mViewData['data']    = $response;
        $this->mViewData['form'] = $form;
       
        $this->render('pesanan');
    }
    public function index() {    
         
//        var_dump($this->session->userdata('user_id'));
        $form = $this->form_builder->create_form();
        $type   = $this->input->get('type') ?: '';
        if ($form->validate())
        {            
            $arrupdate = array(                
                'first_name'        => $this->input->post('nama_lengkap'),
                'category'          => $this->input->post('kategori'),
                'handphone'         => $this->input->post('hp'),
                'email'             => $this->input->post('email'),
                'company_name'      => $this->input->post('name_perusahaan'),
                'address'           => $this->input->post('alamat'),
            );
            $where['data'][] = array(
                'column' => 'id',
                'param'	 => $this->session->userdata('user_id')
            );
            $this->db->where('id',$this->session->userdata('user_id'));
            $this->db->update('users',$arrupdate);
            
            $this->system_message->set_success('Berhasil di update!');
            refresh();
            
        }
        $select = '*';
        $where['data'][] = array(
                'column' => 'id',
                'param'	 => $this->session->userdata('user_id')
        );
        $order['data'][] = array(
                'column' => 'id',
                'type'	 => 'ASC'
        );
        $query = $this->mod->select($select,'users', NULL, $where, NULL, NULL, $order);
        $response = '';
        if ($query<>false) {
                foreach ($query->result() as $val) {
                    $this->mViewData['username']        = $val->username;
                    $this->mViewData['email']           = $val->email;
                    $this->mViewData['nama_lengkap']    = $val->first_name.' '.$val->last_name;
                    $this->mViewData['category']        = $val->category;
                    $this->mViewData['company_name']    = $val->company_name;
                    $this->mViewData['address']         = $val->address;                    
                    $this->mViewData['handphone']       = $val->handphone;                    
                }
        }
        
        if($type == "edit"){
        $this->mViewData['readonly'] = '';
        $this->mViewData['disabled'] = '';
        }else{
        $this->mViewData['readonly'] = 'readonly';
        $this->mViewData['disabled'] = 'disabled';
            
        }
//            echo $val->category;
        if($val->category == "individu"){
            $this->mViewData['individu'] = "checked";
            $this->mViewData['perusahaan'] = "";            
        }else{
            $this->mViewData['individu'] = "";
            $this->mViewData['perusahaan'] = "checked";            
        }
        
        $this->mViewData['form'] = $form;
        $this->render('profile2');
        
    }
    public function Atc($kategory = ''){

        if($kategory == "hilux"){
            $m_produk_kategori_id = "1";
            $catgory_name           ="HILUX";
            $SQL = "SELECT * FROM m_produk WHERE m_kategori_id = '".$m_produk_kategori_id."' LIMIT 1";
        }
        elseif($kategory == "solar"){
            $m_produk_kategori_id = "2";
            $catgory_name           ="SOLAR";
            $SQL = "SELECT * FROM m_produk WHERE m_kategori_id = '".$m_produk_kategori_id."' LIMIT 1";
        }
        elseif($kategory == "kapur"){
            $m_produk_kategori_id = "3";
            $catgory_name           ="KAPUR";
            $SQL = "SELECT * FROM m_produk WHERE m_kategori_id = '".$m_produk_kategori_id."' LIMIT 1";
        }
        else{
            redirect(base_url()."#services");
        }

        $QRY        = $this->db->query($SQL);        

        
        if($QRY->num_rows() > 0){
            foreach($QRY->result() as $d){

                $produk_id          = $d->produk_id;
                $produk_harga       = $d->product_harga;
                $order_qty_unit     = 0;
                $order_lama_sewa    = 0;

            }    
            if($m_produk_kategori_id == 1){
                $order_subtotal = $produk_harga * ($order_qty_unit * $order_lama_sewa);
            }else{
                $order_subtotal = $produk_harga * $order_qty_unit;
            }
            
            $order_total    = $order_subtotal;


            $arrinst = array(
                'order_userid'          => $this->session->userdata('user_id'), 
                'order_nomor_po'        => $this->gen->ID($catgory_name), 
                'order_tanggal'         => date('Y-m-d'), 
                'order_harga'           => $produk_harga,
                'order_subtotal'        => $order_subtotal, 
                'order_total'           => $order_total, 
                'order_tanggal_kirim'   => '', 
                'order_status'          => '1', 
                'm_produk_kategori_id'  => $m_produk_kategori_id, 
                'm_produk_id'           => $produk_id, 
                'order_qty_unit'        => $order_qty_unit,
                'order_lama_sewa'       => $order_lama_sewa, 
                'order_keterangan'      => '', 
            );

            $this->db->insert('t_order', $arrinst);
            redirect(base_url().'account/pesanan');

        }else{
            redirect(base_url()."#services");
        }
    }
    public function PurchaseOrder($id = '') {
        $select = '*';
        $where['data'][] = array(
                'column' => 'order_userid',
                'param'	 => $this->session->userdata('user_id')
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
                $this->mViewData['order_id']  = $val->order_id;
                $this->mViewData['po']  = $val->order_nomor_po;
                $this->mViewData['order_tanggal']  = $val->order_tanggal;
                $this->mViewData['order_keterangan']  = $val->order_keterangan ?: '-';
                $this->mViewData['m_produk_kategori_id']  = $val->m_produk_kategori_id ?: '-';
                $this->mViewData['order_qty_unit']  = $val->order_qty_unit ?: '-';
                $this->mViewData['order_subtotal']  = number_format($val->order_subtotal,2,',','.') ?: '-';
                $this->mViewData['order_harga']  = number_format($val->order_harga,2,',','.') ?: '-';
                $this->mViewData['order_total']  = number_format($val->order_total,2,',','.') ?: '-';
                $getuser_category = $this->GetUser($val->order_userid);
                foreach ($getuser_category as $u) {                    
                    if($u->category == 'perusahaan'){
                        $this->mViewData['pembuat']  = $u->company_name.' / '.$u->first_name;
                    }else{
                        $this->mViewData['pembuat']  = $u->company_name;
                    }
                    $this->mViewData['namapembeli']  = $u->first_name;
                    $this->mViewData['address']  = $u->address;
                    $this->mViewData['category']  = ucfirst($u->category);
                }
                
                if($val->m_produk_kategori_id == "1"){
                    $order_satuan   = $val->order_lama_sewa ?: 0;
                }elseif($val->m_produk_kategori_id == "2"){
                    $order_satuan   = "Liter";
                }else{
                    $order_satuan   = "Bag";
                }
                $this->mViewData['order_satuan']  = $order_satuan;
                $getproduk  = $this->GetProduk($val->m_produk_id);
                foreach ($getproduk as $p) {                    
                    $this->mViewData['produkname']  = $p->produk_nama;
                }
            }
        }else{
            redirect(base_url().'account/pesanan');
        }
        $this->render('purchase_order');
    }
    public function PurchaseOrderPrint($id = '') {
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
    public function OrderDelete($id) {
        $where['data'][] = array(
                'column' => 'order_id',
                'param'	 => $id);
        $where['data'][] = array(
                'column' => 'order_userid',
                'param'	 => $this->session->userdata('user_id')
        );
        $this->mod->delete_data_table('t_order',$where);
        
        $this->system_message->set_success('Berhasil di hapus!');
        
        redirect(base_url().'account/pesanan'); 
        
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
    public function OrderEdit($id, $edit = '') {
        $form = $this->form_builder->create_form();
        $select = '*';
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

        if ($query<>false) {     
            foreach ($query->result() as $val) {
                $this->mViewData['order_id']  = $val->order_id;
                $this->mViewData['po']  = $val->order_nomor_po;
                $this->mViewData['order_tanggal']  = $val->order_tanggal;
                $this->mViewData['order_keterangan']  = $val->order_keterangan ?: '-';
                $this->mViewData['m_produk_kategori_id']  = $val->m_produk_kategori_id ?: '-';
                $this->mViewData['m_produk_id']  = $val->m_produk_id ?: '';
                $this->mViewData['order_qty_unit']  = $val->order_qty_unit ?: 0;
                $this->mViewData['order_lama_sewa']  = $val->order_lama_sewa ?: '-';
                $this->mViewData['order_subtotal']  = number_format($val->order_subtotal,2,',','.') ?: '-';
                $this->mViewData['order_harga']  = number_format($val->order_harga,2,',','.') ?: '-';
                $this->mViewData['order_total']  = number_format($val->order_total,2,',','.') ?: '-';
                $getuser_category = $this->GetUser($val->order_userid);
                foreach ($getuser_category as $u) {                    
                    if($u->category == 'perusahaan'){
                        $this->mViewData['pembuat']  = $u->company_name.' / '.$u->first_name;
                    }else{
                        $this->mViewData['pembuat']  = $u->company_name;
                    }
                    $this->mViewData['namapembeli']  = $u->first_name;
                    $this->mViewData['address']  = $u->address;
                    $this->mViewData['category']  = ucfirst($u->category);
                }
                $getproduk  = $this->GetProduk($val->m_produk_id);
                foreach ($getproduk as $p) {                    
                    $this->mViewData['produkname']  = $p->produk_nama;
                }
                if($val->m_produk_kategori_id == "1"){
                    $order_satuan   = $val->order_lama_sewa ?: 0;
                }elseif($val->m_produk_kategori_id == "2"){
                    $order_satuan   = "Liter";
                }else{
                    $order_satuan   = "Bag";
                }
                if($val->order_total == 0){
                    $this->mViewData['kirimdisable']  = 'disabled';                    
                }
                else{
                    $this->mViewData['kirimdisable']  = '';                    
                }                
                
                if($edit == 'edit'){                
                    $this->mViewData['kirimdisable']  = 'disabled';                    
                    $this->mViewData['linedisable']  = '';                    
                    $this->mViewData['buttonvalue']  = 'UPDATE';                    
                    $this->mViewData['buttonedit']  = 1;                    
                }
                else{
                    $this->mViewData['linedisable']  = 'disabled';                    
                    $this->mViewData['buttonvalue']  = 'EDIT';                                       
                    $this->mViewData['buttonedit']  = 0;                    
                }

                $this->mViewData['order_satuan']  = $order_satuan;
            }
        }else{
            redirect(base_url().'account/pesanan');
        }
        $this->mViewData['form'] = $form;
        $this->render('purchase_order_edit');
    }    
    public function OrderUpdate() {
        $m_produk_kategori_id   = $this->input->post('m_produk_kategori_id');
        $keterangan             = $this->input->post('keterangan');
        $order_qty_unit         = $this->input->post('order_qty_unit');
        
        $order_id               = $this->input->post('order_id');
        $m_produk_id            = $this->input->post('m_produk_id');
        $order_qty_sebelumnya   = $this->input->post('order_qty_sebelumnya') ?: 0;
//        $produk_harga           = $this->input->post('produk_harga');
        $getproduk  = $this->GetProduk($m_produk_id);
        foreach ($getproduk as $p) {                    
            $produk_harga  = $p->product_harga;
            $produk_stok  = $p->produk_stok;
        }
        $produk_stok  += $order_qty_sebelumnya;
        
        if($order_qty_unit == 0){
            $this->system_message->set_error('Masukan Jumlah Unit Kosong!');
            redirect(base_url().'account/OrderEdit/'.$order_id);
        }elseif($produk_stok == 0){
            $this->system_message->set_error('Maaf Produk Kosong !');
            redirect(base_url().'account/OrderEdit/'.$order_id);
        }elseif($order_qty_unit > $produk_stok){
            $this->system_message->set_error('Jumlah Stok Tidak Cukup!');
            redirect(base_url().'account/OrderEdit/'.$order_id);
        }
        
        if($m_produk_kategori_id == 1){
            $order_lama_sewa        = $this->input->post('order_lama_sewa');
            $order_subtotal = $produk_harga * ($order_qty_unit * $order_lama_sewa);
        }else{
            $order_lama_sewa    = '';
            $order_subtotal = $produk_harga * $order_qty_unit;
        }
              
        
        $order_total    = $order_subtotal;

        $arrinst = array(
            'order_userid'          => $this->session->userdata('user_id'), 
            'order_qty_unit'        => $order_qty_unit, 
            'order_lama_sewa'       => $order_lama_sewa, 
            'order_keterangan'      => $keterangan, 
            'order_harga'           => $produk_harga,
            'order_subtotal'        => $order_subtotal, 
            'order_total'           => $order_total, 
        );
        $sisa_stok = $produk_stok - $order_qty_unit;
        //update stok
        $this->db->where('produk_id', $m_produk_id);
        $this->db->update('m_produk', array('produk_stok' => $sisa_stok));          
        
//        var_dump($arrinst);        
        $this->db->where('order_id', $order_id);
        $this->db->update('t_order', $arrinst);        
        $this->system_message->set_success('Berhasil di simpan!');
        redirect(base_url().'account/OrderEdit/'.$order_id);
    }
    public function HapusAkun() {        
        $this->db->where('id', $this->session->userdata('user_id'));
        $this->db->update('users', array('active'=>0));         
        $this->ion_auth->logout();
        $this->system_message->set_success('Akun anda telah berhasil di tutup. Terima kasih');
        redirect($this->mConfig['login_url']);
    }
    public function OrderKirimData($order_id) {
        $select = '*';
        $where['data'][] = array(
                'column' => 'order_id',
                'param'	 => $order_id
        );
        $order['data'][] = array(
                'column' => 'order_id',
                'type'	 => 'DESC'
        );
        $query = $this->mod->select($select,'t_order', NULL, $where, NULL, NULL, $order);
        if ($query<>false) {     
            foreach ($query->result() as $val) {
              
               if($val->order_total == 0){
                    $this->system_message->set_warning('Data tidak dapat dikirimkan, Transaksi Anda masih kosong');
                    redirect(base_url().'account/PurchaseOrder/'.$order_id);
                }
            }
        }

        $arrinst = array(
            'order_status'        => '2', 
            'order_status_date'   => date('Y-m-d H:i:s'), 
        );      
        $this->db->where('order_id', $order_id);
        $this->db->update('t_order', $arrinst);        
        $this->system_message->set_success('Proses Kirim Data Berhasil!');
        redirect(base_url().'account/PurchaseOrder/'.$order_id);
    }
}
