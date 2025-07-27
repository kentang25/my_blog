<?php defined('BASEPATH') or exit('No direct script access allowed');


class LandingController extends MY_Controller
{
    //
    public $CI;
    /**
     * An array of variables to be passed through to the
     * view, layout, ....
     */
    protected $data = array();

    /**
     * [__construct description]
     *
     * @method __construct
     */
    public function __construct()
    {
        // To inherit directly the attributes of the parent class.
        parent::__construct();

        // CI profiler
        $this->output->enable_profiler(false);

        // This function returns the main CodeIgniter object.
        // Normally, to call any of the available CodeIgniter object or pre defined library classes then you need to declare.
        $CI =& get_instance();

        //Example data
        // Site name
        $this->data['sitename'] = 'CodeIgniter-HMVC-AdminLTE';

        //Example data
        // Browser tab
        $this->data['site_title'] = ucfirst('Admin Dashboard');
    }

   
     protected function template_landing($template_name, $data, $return)
    {
        if ($return === true) {
            $content  = $this->load->view('template_landing/header', $this->data);
            $content .= $this->load->view('template_landing/navbar', $this->data);
            $content .= $this->load->view($template_name, $this->data);
            $content .= $this->load->view('template_landing/footer', $this->data); 
            return $content;
        } else {
            $this->load->view($template_name, $this->data);
        }
    }


}
