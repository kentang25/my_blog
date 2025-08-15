<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class books extends FrontendController {
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

        $this->load->model('M_books');
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
		
        $this->data['books'] = $this->M_books->tampil_data()->result();
		$this->template_user('v_books', $this->data, true);
	}

    public function detail($id)
    {
        $this->data['detail_books'] = $this->M_books->detail_data($id)->row();
        $this->template_user('v_detail_books',$this->data,true);
    }

}
