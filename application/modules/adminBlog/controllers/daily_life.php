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

    public function edit_daily_life($id)
    {
        $where = array('id_daily_life' => $id);

        $this->data['edit_daily_life'] = $this->M_daily_life->edit_data('tb_daily_life',$where)->result();
        $this->template_admin('v_edit_daily',$this->data,true);
    }

    public function update($id)
    {
        $this->M_daily_life->update_data($id);
        redirect('admin/blog/daily-life');
    }

    public function detail_daily_life($id)
    {
        $this->data['detail_daily_life'] = $this->M_daily_life->detail_data($id)->row();
        $this->template_admin('v_detail_daily',$this->data,true);
    }

    public function delete_daily_life($id)
    {
        $this->M_daily_life->delete_data($id);
         redirect('admin/blog/daily-life');
    }

}
