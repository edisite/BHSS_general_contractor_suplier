<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of RekanKerja
 *
 * @author edisite
 */
class Hubungikami extends MY_Controller {
    //put your code here
    public function __construct() {
        parent::__construct();
        $this->load->library('form_builder');
    }
    public function index() {
        $form = $this->form_builder->create_form();

        if ($form->validate())
        {
            $arrinst = array(
                'tanggal_pesan'     => date('Y-m-d H:i:s'),
                'subjek_pesan'      => $this->input->post('subject'),
                'pesan'             => $this->input->post('message'),
                'nama_pengirim'     => $this->input->post('name'),
                'email_pengirim'    => $this->input->post('email'),
            );
            $this->db->insert('pesan_pelanggan',$arrinst);
            $this->system_message->set_success('Terima kasih. Pesan anda berhasil disimpan');
            refresh();
        }
        $this->mViewData['form'] = $form;
        $this->render('hubungikami_detail');
        
    }
    public function PesanStore() {
        $arrinst = array(
            'tanggal_pesan'     => date('Y-m-d H:i:s'),
            'subjek_pesan'      => $this->input->post('subject'),
            'pesan'             => $this->input->post('message'),
            'nama_pengirim'     => $this->input->post('name'),
            'email_pengirim'    => $this->input->post('email'),
        );
        $this->db->insert('pesan_pelanggan',$arrinst);
        redirect(base_url().'hubungikami');
    }
}
