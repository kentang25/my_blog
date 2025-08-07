<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class about extends BackendController {
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

        $this->load->model('M_about');
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
        $this->load->helper('my'); // atau autoload['helper'] = ['text']

        $this->data['about'] = $this->M_about->tampil_data()->result();
        
		$this->template_admin('v_admin_about', $this->data, true);
	}

    public function insert()
    {
        $this->M_about->insert_data();
        redirect('admin/about-blog');
    }

    public function edit_about($id)
    {
        $where = array('id_about'=>$id);

        $this->data['edit_about'] = $this->M_about->edit_data('tb_about',$where)->result();
        $this->template_admin('v_edit_about', $this->data, true);
    }

    public function update($id)
    {
        $this->M_about->update_data($id);
        redirect('admin/about-blog');
    }

    public function detail_about($id)
    {
        $this->data['detail_about'] = $this->M_about->detail_data($id)->row();
        $this->template_admin('v_detail_about',$this->data,true);
    }

    public function delete_about($id)
    {
        $this->M_about->detele_data($id);
        redirect('admin/about-blog');
    }


}
