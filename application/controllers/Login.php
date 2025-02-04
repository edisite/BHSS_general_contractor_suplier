<?php
defined('BASEPATH') OR exit('No direct script access allowed');

// NOTE: this controller inherits from MY_Controller instead of Admin_Controller,
// since no authentication is required
class Login extends MY_Controller {

	/**
	 * Login page and submission
	 */
        public function __construct() {
            parent::__construct();
                $this->load->library('form_builder');
		$this->load->library('system_message');
        }
	public function index()
	{
		$this->load->library('form_builder');
                $this->load->library('system_message');
		$form = $this->form_builder->create_form();
		if ($form->validate())
		{
			// passed validation
			$identity = $this->input->post('username');
			$password = $this->input->post('password');
			$remember = ($this->input->post('remember')=='on');
                        echo $this->input->post();
                        $a = $this->ion_auth->login($identity, $password, $remember);
                        			$this->ion_auth_model->tables = array(
				'users'				=> 'users',
				'groups'			=> 'groups',
				'users_groups'		=> 'users_groups',
				'login_attempts'	=> 'login_attempts',
			);
                        var_dump($a);
                        echo "00";
                        return;
			if ($this->ion_auth->login($identity, $password, $remember))
			{
				// login succeed
				$messages = $this->ion_auth->messages();
				$this->system_message->set_success($messages);
				redirect('');
			}
			else
			{
				// login failed
				$errors = $this->ion_auth->errors();
				$this->system_message->set_error($errors);
//                                echo $errors;
				refresh();
			}
		}
		
		// display form when no POST data, or validation failed
		$this->mViewData['form'] = $form;
		$this->mBodyClass = 'login-page';
		$this->render('login', 'empty');
	}
}
