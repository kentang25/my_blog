<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class cerita extends BackendController {
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
        $this->data['cerita'] = $this->M_cerita->tampil_data()->result();
		$this->template_admin('v_admin_cerita', $this->data, true);
	}

    public function insert()
    {
        $this->M_cerita->insert_data();
        redirect('admin/blog/cerita');
    }

    public function edit_cerita($id)
    {
        $where = array('id_cerita'=>$id);

        $this->data['edit_cerita'] = $this->M_cerita->edit_data('tb_cerita',$where)->result();
        $this->template_admin('v_edit_cerita',$this->data,true);
    }

    public function update($id)
    {
        $this->M_cerita->update_data($id);
        redirect('admin/blog/cerita');
    }

    public function detail_cerita($id)
    {
        $this->data['detail_cerita'] = $this->M_cerita->detail_data($id)->row();
        $this->template_admin('v_detail_cerita',$this->data,true);
    }

    public function delete_cerita($id)
    {
        $this->M_cerita->delete_data($id);
        redirect('admin/blog/cerita');
    }

}
