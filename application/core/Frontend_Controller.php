<?php defined('BASEPATH') or exit('No direct script access allowed');


class FrontendController extends MY_Controller
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

   
     protected function template_user($template_name, $data, $return)
    {
        if ($return === true) {
            $content  = $this->load->view('template_user/_partials/header', $this->data);
            $content .= $this->load->view('template_user/_partials/navbar', $this->data);
            $content .= $this->load->view($template_name, $this->data);
            $content .= $this->load->view('template_user/_partials/footer', $this->data);
            $content .= $this->load->view('template_user/_partials/js', $this->data);
            return $content;
        } else {
            $this->load->view($template_name, $this->data);
        }
    }

    protected function template_login($template_name, $data, $return)
    {
        if ($return === true) {
            $content  = $this->load->view('template_user/_partials/header_login', $this->data);
            $content = $this->load->view($template_name, $this->data);
            $content .= $this->load->view('template_user/_partials/js', $this->data); 

            return $content;
        } else {
            $this->load->view($template_name, $this->data);
        }
    }

}
