<?php
define('REFSPACE', '10');
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
    function ID($type = '') {
        $this->CheckIDGenerator();
        switch (strtolower($type)):
            case 'm':
                $prefix = "1";
                break;
            case 'd':
                $prefix = "2";
                break;
            default :
                $prefix = "3";
                break;        
        endswitch;
        
        $sql = "SELECT get_next_id() as ID";
        $qry = $this->db->query($sql);
        if ($qry->num_rows() > 0){
            foreach ($qry->result() as $v) {
                $this->verid =  $v->ID ?: 0;
            }
        }
        $yes = $prefix.date('ym');
        $panjangcreate = REFSPACE - (strlen($yes) + strlen($this->verid));
        $panjangspace = "";
        if($panjangcreate >= 1){
            $no = 1;
            do {
                $panjangspace = $panjangspace."0";
                $no++;
            } while ($no <= $panjangcreate);
        }
        return $yes.$panjangspace. $this->verid;
        
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
    function NeracaLajurTheme($yer, $mon) {
        $arrtbl[1] = "r_reporting_01";
        $arrtbl[2] = "r_reporting_02";
        $arrtbl[3] = "r_reporting_03";
        $arrtbl[4] = "r_reporting_04";
        $arrtbl[5] = "r_reporting_05";
        $arrtbl[6] = "r_reporting_06";
        $arrtbl[7] = "r_reporting_07";
        $arrtbl[8] = "r_reporting_08";
        $arrtbl[9] = "r_reporting_09";
        $arrtbl[10] = "r_reporting_10";
        $arrtbl[11] = "r_reporting_11";
        $arrtbl[12] = "r_reporting_12";
        
        $this->db->empty_table($arrtbl[$mon]);
        $this->db->query("TRUNCATE ".$arrtbl[$mon]);            
            $sql = "INSERT INTO ".$arrtbl[$mon]." 
                    (
                        kode_perk, 
                        kode_induk, 
                        type_perk, 
                        level_perk, 
                        id_perk, 
                        id_induk, 
                        g_or_d,
                        dtm_year,
                        dtm_month
                    )
                    SELECT KODE_PERK, 
                        KODE_INDUK, 
                        TYPE_PERK, 
                        LEVEL_PERK, 
                        ID_PERK, 
                        ID_INDUK,
                        G_OR_D,
                        '".$yer."',
                        '".$mon."'
                        FROM 
                        m_perkiraan";
            $qrydate = $this->db->query($sql);
        
    }

}
