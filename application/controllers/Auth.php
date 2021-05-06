<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// NOTE: this controller inherits from MY_Controller instead of Admin_Controller,
// since no authentication is required
class Auth extends MY_Controller {

    /**
     * Login page and submission
     */
    public function __construct() {
        parent::__construct();
            $this->load->library('form_builder');
    }
    public function index()
    {
        $this->load->library('form_builder');
        $form = $this->form_builder->create_form();
        if ($form->validate())
        {
            // passed validation
            $identity = $this->input->post('username');
            $password = $this->input->post('password');
            $remember = ($this->input->post('remember')=='on');
//                    echo $this->input->post();
            $a = $this->ion_auth->login($identity, $password, $remember);
            $this->ion_auth_model->tables = array(
                    'users'				=> 'users',
                    'groups'			=> 'groups',
                    'users_groups'		=> 'users_groups',
                    'login_attempts'	=> 'login_attempts',
            );

            if ($this->ion_auth->login($identity, $password, $remember))
            {
                    // login succeed
//                    $messages = $this->ion_auth->messages();
//                    var_dump($messages);
//                    return;
                    $this->system_message->set_success('Login Berhasil');
                    redirect('account');
            }
            else
            {
                    // login failed
                    $errors = $this->ion_auth->errors();
                    $this->system_message->set_error($errors);

                    refresh();
            }
        }

        // display form when no POST data, or validation failed
        $this->mViewData['form'] = $form;
        $this->mBodyClass = 'login-page';
        $this->render('login', 'empty');
    }

    public function Logout()
    {
        $this->ion_auth->logout();
        $this->system_message->set_success('Logout berhasil');
        redirect($this->mConfig['login_url']);
    }
    public function Register() {
        $form = $this->form_builder->create_form();

        if ($form->validate())
        {
                // passed validation
                $username           = $this->input->post('username');                    
                $name_perusahaan    = $this->input->post('name_perusahaan');
                $email              = $this->input->post('email');
                $password           = $this->input->post('password');

                $a = explode('@', $email);
                $identity =  $a[0] ?: '';
                
                $additional_data = array(
                        'first_name'        => $this->input->post('nama_pengguna'),
                        'company_name'      => $this->input->post('name_perusahaan'),
                        'category'          => $this->input->post('kategori'),
                        'handphone'         => $this->input->post('handphone'),
                        'address'           => $this->input->post('alamat'),
                );
                $groups = array("1");

                // [IMPORTANT] override database tables to update Frontend Users instead of Admin Users
                $this->ion_auth_model->tables = array(
                        'users'                             => 'users',
                        'groups'                            => 'groups',
                        'users_groups'                      => 'users_groups',
                        'login_attempts'                    => 'login_attempts',
                );

                
                // proceed to create user
                $user_id = $this->ion_auth->register($identity, $password, $email, $additional_data, $groups);			
                if ($user_id)
                {
                        // success
                        $messages = $this->ion_auth->messages();
                        $this->system_message->set_success($messages);

                        // directly activate user
                        $this->ion_auth->activate($user_id);
                        redirect('account');
                }
                else
                {
                        // failed
                        $errors = $this->ion_auth->errors();
                        $this->system_message->set_error($errors);
                }
                refresh();
        }

        // get list of Frontend user groups
//        $this->load->model('group_model', 'groups');
//        $this->mViewData['groups'] = $this->groups->get_all();
        $this->mPageTitle = 'Create User';

        $this->mViewData['form'] = $form;
        $this->render('register');
    }
}
