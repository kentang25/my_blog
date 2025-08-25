<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class dashboard_blog extends BackendController {
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

        $this->load->model('M_dashboard_blog');
        $this->load->model('M_auth');
        // $this->load->model('M_gallery');
    }

    /**
     * [index description]
     *
     * @method index
     *
     * @return [type] [description]
     */
	public function index() {
        if(!$this->M_auth->is_loggin()){
            redirect(base_url('admin/login'));
        }

        $this->data['dashboard'] = $this->M_dashboard_blog->tampil_data()->result();
		$this->template_admin('v_admin_blog', $this->data, true);
	}

    public function insert()
    {
        $this->M_dashboard_blog->insert_data();
        redirect('admin/dashboard-blog');
    }

}
