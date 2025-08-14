<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class books extends BackendController {
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
		$this->template_admin('v_admin_books', $this->data, true);
	}

    public function insert()
    {
        $this->M_books->insert_data();
        redirect('admin/books');
    }

    public function edit_books($id)
    {
        $where = array('id_book' => $id);

        $this->data['edit_book'] = $this->M_books->edit_data('tb_books',$where)->result();
        $this->template_admin('v_edit_book',$this->data,true);
    }

    public function update($id)
    {
        $this->M_books->update_data($id);
        redirect('admin/books');
    }

    public function detail_books($id)
    {
        $this->data['detail_books'] = $this->M_books->detail_data($id)->row();
        $this->template_admin('v_detail_book',$this->data,true);
    }

    public function delete_books($id)
    {
        $this->M_books->delete_data($id);
        redirect('admin/books');
    }

}
