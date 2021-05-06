<?php
define('REFSPACE', '4');
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of M_Gen
 *
 * @author edisite
 */
class M_Gen extends CI_Model{
    //put your code here
    protected $verid = 0;
    
    public function __construct() {
        parent::__construct();
    }
    function ID($kategory = '') {
        
        $sql = "SELECT get_next_id() as ID";
        $qry = $this->db->query($sql);
        if ($qry->num_rows() > 0){
            foreach ($qry->result() as $v) {
                $this->verid =  $v->ID ?: 0;
            }
        }
        $yes = date('Y');
        $panjangcreate = REFSPACE - strlen($this->verid);
        $panjangspace = "";
        if($panjangcreate >= 1){
            $no = 1;
            do {
                $panjangspace = $panjangspace."0";
                $no++;
            } while ($no <= $panjangcreate);
        }
        return $panjangspace. $this->verid."/".strtoupper($kategory)."/PO/"."PTBHSS"."/".$yes;
        
    }
    public function CheckIDGenerator() {
        //check tanggal apakah masih sama
        $sqldate = "SELECT * FROM `m_id_generator_date` WHERE month(dtm) = month(now())";
        $qrydate = $this->db->query($sqldate);
        if($qrydate->num_rows() > 0){
            // jika sama
        }else{
            // jika tidak sama
            $this->db->empty_table('m_id_generator_date');
            $this->db->query("INSERT INTO `m_id_generator_date` (`dtm`) VALUES (CURRENT_TIMESTAMP)");
            $this->db->query("TRUNCATE m_id_generator");
            $this->db->query("ALTER TABLE m_id_generator AUTO_INCREMENT = 1"); 
        }
        return;
    }
    public function ProdukNameByID($produk_id = '') {
        //check tanggal apakah masih sama
        $sqldate = "SELECT * FROM `m_produk` WHERE produk_id = '".$produk_id."' and produk_status_aktif = '1' limit 1";
        $qrydate = $this->db->query($sqldate);
        if($qrydate->num_rows() > 0){
            // jika sama
            foreach ($qrydate->result() as $data) {
                return $data->produk_nama;
            }
        }
        return "-";
    }

}
