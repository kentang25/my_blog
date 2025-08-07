<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class jalan_jalan extends BackendController {
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

        $this->load->model('M_jalan_jalan');
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
        $this->data['jalan_jalan'] = $this->M_jalan_jalan->tampil_data()->result();
		$this->template_admin('v_admin_jalan_jalan', $this->data, true);
	}

    public function insert()
    {
        $this->M_jalan_jalan->insert_data();
        redirect('admin/blog/jalan-jalan');
    }

    public function edit_jalan_jalan($id)
    {
        $where = array('id_jalan'=>$id);

        $this->data['edit_jalan'] = $this->M_jalan_jalan->edit_data('tb_jalan_jalan', $where)->result();
        $this->template_admin('v_edit_jalan',$this->data,true);
    }

    public function update($id)
    {
        $query = $this->M_jalan_jalan->update_data($id);
        redirect('admin/blog/jalan-jalan');
    }

    public function detail_jalan_jalan($id)
    {
        $this->data['detail_jalan'] = $this->M_jalan_jalan->detail_data($id)->row();
        $this->template_admin('v_detail_jalan',$this->data,true);
    }

    public function delete_jalan_jalan($id)
    {
        $this->M_jalan_jalan->delete_data($id);
         redirect('admin/blog/jalan-jalan');
    }

}
