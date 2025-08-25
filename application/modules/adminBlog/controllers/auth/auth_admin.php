<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class auth_admin extends BackendController {
	//
    public $CI;

    /**
     * An array of variables to be passed through to the
     * view, layouts, ....
     */ 
    protected $data = array();

    /**
     * [__construct description]
     *
     * @method __construct
     */
    public function __construct()
    {
        //
        parent::__construct();
        // This function returns the main CodeIgniter object.
        // Normally, to call any of the available CodeIgniter object or pre defined library classes then you need to declare.
        $CI =& get_instance();

        $this->load->model('M_auth');
        // $this->load->model('M_news');
        // $this->load->model('M_gallery');
    }

    /**
     * [index description]
     *
     * @method index
     *
     * @return [type] [description]
     */
	public function register() {
		$this->form_validation->set_rules('username','Username','required|trim');
        $this->form_validation->set_rules('password','Password','required|trim');

            if($this->form_validation->run() === False){
                $this->template_login('auth_admin/v_auth_admin',$this->data,true);
            }else{
                $data = $this->M_auth->insert_data();

                redirect('admin/register');
            }
	}

    public function login()
    {
        if($this->M_auth->is_loggin()){
            redirect(base_url('admin'));
        }

        $this->form_validation->set_rules('username','Username','required');
        $this->form_validation->set_rules('password','Password','required');

            if($this->form_validation->run() === FALSE)
            {
                $this->template_login('auth_admin/v_auth_admin',$this->data,true);
            }else{
                $username = $this->input->post('username');
                $password = $this->input->post('password');

                    $data = $this->M_auth->get_data($username,$password);

                    if($data === FALSE){
                        $this->session->set_flashdata('pesan','<div class="alert alert-warning alert-dismissible fade-show" role="alert">
                                Username atau Password anda salah!
                                
                            </div>');
                        redirect('login');
                    }else{
                        $this->session->set_userdata('id_admin',$data['id_admin']);
                        $this->session->set_userdata('is_loggedin',TRUE);

                        redirect(base_url('admin'));
                    }
            }
    }

    public function logout()
    {
        $this->session->sess_destroy();
        redirect('admin/login');
    }

}
