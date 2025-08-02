<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class blog extends FrontendController {
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

        $this->load->model('M_cerita');
        $this->load->model('M_daily_life');
        $this->load->model('M_jalan_jalan');
    }

    /**
     * [index description]
     *
     * @method index
     *
     * @return [type] [description]
     */
	public function index() {
        $this->data['cerita'] = $this->M_cerita->tampil_data()->result();
        $this->data['daily_life'] = $this->M_daily_life->tampil_data()->result();
        $this->data['jalan_jalan'] = $this->M_jalan_jalan->tampil_data()->result();
		$this->template_user('v_blog', $this->data, true);
	}

    public function get_blog($id)
    {
        $detail_blog = $this->M_cerita->detail_blog($id)->row();
        $this->data['get_blog'] = $detail_blog;
        $this->template_user('v_detail_blog', $this->data,true);
    }


}
