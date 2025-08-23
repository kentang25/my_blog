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
                $this->template_login('auth/v_register',$this->data,true);
            }else{
                $data = $this->M_auth->insert_data();

                redirect('admin/register');
            }
	}

    // public function login()
    // {

    // }

}
