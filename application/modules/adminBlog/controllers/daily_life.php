<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class daily_life extends BackendController {
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

        $this->load->model('M_daily_life');
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
	public function index() {
        $this->data['daily_life'] = $this->M_daily_life->tampil_data()->result();
		$this->template_admin('v_admin_daily_life', $this->data, true);
	}

    public function insert()
    {
        $this->M_daily_life->insert_data();
        redirect('admin/blog/daily-life');
    }

}
