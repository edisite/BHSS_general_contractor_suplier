<?php

class MModel extends CI_Model {

    // Define Users table
    public $user_table = 's_user a';

    public function __construct() {
        parent::__construct();
    }
    
    /* ====================================
        General Function
    ==================================== */

    // Check User Exist
    function check_exist_user($username, $password){
        $this->db->select('a.*, b.*, c.*');
        $this->db->from($this->user_table);
        $this->db->join('m_karyawan b','b.karyawan_id = a.m_karyawan_id','inner');
        $this->db->join('m_type_karyawan c','c.type_karyawan_id = b.m_type_karyawan_id','inner');
        $this->db->where('a.user_username = "'.$username.'" AND a.user_password = "'.$password.'"');

        $query = $this->db->get();

        if($query->num_rows() > 0)
            return $query->row();
        else return false;
    }
    
    // Select data on table
    function select($select = NULL, $table = NULL, $join = NULL, $where = NULL, $where2 = NULL, $like = NULL, $order = NULL, $limit = NULL) {
        $this->db->select($select);
        $this->db->from($table);
        if ($join) {
            for ($i=0; $i<sizeof($join['data']) ; $i++) { 
                $this->db->join($join['data'][$i]['table'],$join['data'][$i]['join'],$join['data'][$i]['type']);
            }
        }
        if ($where) {
            for ($i=0; $i<sizeof($where['data']) ; $i++) { 
                $this->db->where($where['data'][$i]['column'],$where['data'][$i]['param']);
            }
        }
        if ($where2) {
            $this->db->where($where2);
        }
        if ($like) {
            for ($i=0; $i<sizeof($like['data']) ; $i++) { 
                $this->db->like('CONCAT_WS(" ", '.$like['data'][$i]['column'].')',$like['data'][$i]['param']);
            }
        }
        if ($limit) {
            $this->db->limit($limit['finish'],$limit['start']);
        }
        if ($order) {
            for ($i=0; $i<sizeof($order['data']) ; $i++) { 
                $this->db->order_by($order['data'][$i]['column'], $order['data'][$i]['type']);
            }
        }
        
        $query = $this->db->get();
        if($query->num_rows() > 0)
            return $query;
        else
            return false;
    }

    function select2($select = NULL, $table = NULL, $join = NULL, $where = NULL, $where2 = NULL, $like = NULL, $group = NULL, $order = NULL, $limit = NULL) {
        $this->db->select($select);
        $this->db->from($table);
        if ($join) {
            for ($i=0; $i<sizeof($join['data']) ; $i++) { 
                $this->db->join($join['data'][$i]['table'],$join['data'][$i]['join'],$join['data'][$i]['type']);
            }
        }
        if ($where) {
            for ($i=0; $i<sizeof($where['data']) ; $i++) { 
                $this->db->where($where['data'][$i]['column'],$where['data'][$i]['param']);
            }
        }
        if ($where2) {
            $this->db->where($where2);
        }
        if ($like) {
            for ($i=0; $i<sizeof($like['data']) ; $i++) { 
                $this->db->like('CONCAT_WS(" ", '.$like['data'][$i]['column'].')',$like['data'][$i]['param']);
            }
        }
        if ($limit) {
            $this->db->limit($limit['finish'],$limit['start']);
        }
        if ($group) {
            for ($i=0; $i<sizeof($group['data']) ; $i++) { 
                $this->db->group_by($group['data'][$i]['column']);
            }
        }
        if ($order) {
            for ($i=0; $i<sizeof($order['data']) ; $i++) { 
                $this->db->order_by($order['data'][$i]['column'], $order['data'][$i]['type']);
            }
        }
        
        $query = $this->db->get();
        if($query->num_rows() > 0)
            return $query;
        else
            return false;
    }
    
    // Insert data on table
    function insert_data_table($table, $where, $data){
        if ($where) {
            for ($i=0; $i<sizeof($where['data']) ; $i++) { 
                $this->db->where($where['data'][$i]['column'],$where['data'][$i]['param']);
            }
        }
        $this->db->insert($table, $data);
        $error = $this->db->error();
        $result = new stdclass();
        if ($this->db->affected_rows() > 0 or $error['code']==0){
            $result->status = true;
            $result->output = $this->db->insert_id();
        }
        else{
            $result->status = false;
            // if($error['code'] <> 0)
            $result->output = $error['code'].': '.$error['message'];
        }

        return $result;
    }
    function insert_data_batch($table, $data) {
        $this->db->insert_batch($table, $data);
        $error = $this->db->error();
        $result = new stdclass();
        if ($this->db->affected_rows() > 0 or $error['code']==0){
            $result->status = true;
            $result->output = $this->db->insert_id();
        }
        else{
            $result->status = false;
            // if($error['code'] <> 0)
            $result->output = $error['code'].': '.$error['message'];
        }
        return $result;
    }
    
    // Update data on table
    function update_data_table($table, $where, $data){
        if ($where) {
            for ($i=0; $i<sizeof($where['data']) ; $i++) { 
                $this->db->where($where['data'][$i]['column'],$where['data'][$i]['param']);
            }
        }
        $this->db->update($table, $data);
        $error = $this->db->error();
        $result = new stdclass();
        if ($this->db->affected_rows() > 0 or $error['code']==0){
            $result->status = true;
            $result->output = $this->db->insert_id();
        }
        else{
            $result->status = false;
            $result->output = $error['code'].': '.$error['message'];
        }

        return $result;
    }
    
    // Delete data on table
    function delete_data_table($table, $where){
        if ($where) {
            for ($i=0; $i<sizeof($where['data']) ; $i++) { 
                $this->db->where($where['data'][$i]['column'],$where['data'][$i]['param']);
            }
        }
        $this->db->delete($table);
        $error = $this->db->error();
        $result = new stdclass();
        if ($this->db->affected_rows() > 0 or $error['code']==0){
            $result->status = true;
            // $result->output = $this->db->insert_id();
        }
        else{
            $result->status = false;
            $result->output = $error['code'].': '.$error['message'];
        }

        return $result;
    }
    
    /* ====================================
        General Function
    ==================================== */

}