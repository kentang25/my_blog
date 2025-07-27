<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends LandingController {
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

        $this->load->model('M_master');
        $this->load->model('M_news');
        $this->load->model('M_gallery');
    }

    /**
     * [index description]
     *
     * @method index
     *
     * @return [type] [description]
     */
	public function index() {
		$this->data['title'] =  "Home";

        $this->data['hero'] = $this->M_master->getData(array("show"=>"Y"),'web_hero',null)->result();
        $this->data['service'] = $this->M_master->getData(array("id_service"=>"1"),'web_service',null)->row();
        $this->data['about'] = $this->M_master->getData(array("id"=>"1"),'web_profile',null)->row();
        $this->data['work'] = $this->M_master->getData(array("id_work"=>"1"),'web_work',null)->row();
        $this->data['team'] = $this->M_master->getData(null,'struktur_organisasi',null)->result();
        $this->data['gallery'] = $this->M_gallery->getGallery(null,"web_gallery",null)->result();
        $this->data['ami_jml'] = $this->M_master->getData(null,"ami",null)->num_rows();
        $this->data['standart'] = $this->M_master->getData(null,"sub_standart",null)->num_rows();
        $this->data['unit'] = $this->M_master->getData(null,"m_unit",null)->num_rows();
        $this->data['news_jml'] = $this->M_master->getData(null,"news",null)->num_rows();
        $this->data['news'] = $this->M_news->getNewsRandom(4)->result();

        
		$this->template_landing('v_home', $this->data, true);
	}

}
