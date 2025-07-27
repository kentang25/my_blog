<?php defined('BASEPATH') or exit('No direct script access allowed');

class MY_Controller extends MX_Controller
{
    //
    public $CI;

    /**
     * An array of variables to be passed through to the
     * view, layout
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

        // This function returns the main CodeIgniter object.
        // Normally, to call any of the available CodeIgniter object or pre defined library classes then you need to declare.
        $CI =& get_instance();

        // Copyright year calculation for the footer
        $begin = 2019;
        $end =  date("Y");
        $date = "$begin - $end";

        // Copyright
        $this->data['copyright'] = $date;

        $CI->load->model('M_log');

    }

     protected function input_false(){
        $json = array(
                        'token'     => $this->security->get_csrf_hash() ,
                        'status'    => 0,
                        'pesan'     => validation_errors()
                    );
        echo json_encode($json);
    }

    protected function captcha_false(){
        $json = array(
                        'token'     => $this->security->get_csrf_hash(),
                        'status'    => 1,
                        'pesan'     => "Kode harus sama !!"
                    );
        echo json_encode($json);
    }

    protected function access_valid($pesan = "Click to Continue..!!", $url = 'base_url()' ){
        $json = array(
                        'token'     => $this->security->get_csrf_hash(),
                        'status'    => 4,
                        'pesan'     => $pesan,
                        'url_direct'=> $url
                    );
        echo json_encode($json);
    }

    protected function _createLog($info_modul, $info_action, $info_table, $info_id, $info_data){
        $user_id    = decrypt_string($this->session->userdata('userid'));        
        $tgl        = date('Y-m-d');
        $time       = date('H:i:s');

        $data = array(
                        'user_id'       => $user_id,
                        'info_modul'    => $info_modul,
                        'info_action'   => $info_action,
                        'info_table'    => $info_table,
                        'info_id'       => $info_id,
                        'info_data'     => $info_data,
                        'd_proses'      => $tgl,
                        't_proses'      => $time,
                        'ip'            => $_SERVER['REMOTE_ADDR'],
                        );

        $result_simpan = $this->M_log->created_log($data);
    }

    protected function _cretedLogWithUsername($user_id, $user_name, $info_modul, $info_action, $info_table, $info_data){
        $tgl        = date('Y-m-d');
        $time       = date('H:i:s');

        $data = array(
                        'user_id'       => $user_id,
                        'user_name'     => $user_name,
                        'info_modul'    => $info_modul,
                        'info_action'   => $info_action,
                        'info_table'    => $info_table,
                        'info_data'     => $info_data,
                        'd_proses'      => $tgl,
                        't_proses'      => $time,
                        'ip'            => $_SERVER['REMOTE_ADDR'],
                        );

        $result_simpan = $this->M_log->created_log($data);
    }

    protected function query_error($pesan = "No Processed Activity, Data has not changed.."){
        $json = array(
                        'token'     => $this->security->get_csrf_hash(),
                        'status'    => 2,
                        'pesan'     => $pesan
                    );
        echo json_encode($json);
    }

    protected function show_404($page = ''){ 

        header("HTTP/1.1 404 Not Found");
        $heading = "404 Page Not Found";
        $message = "The page you requested was not found ";
        $CI =& get_instance();
        // $CI->load->view('errors/index');
        redirect("notfound");
    }

    protected function cek_kewajiban(){ 
        $CI =& get_instance();
        return $CI->session->userdata("code");
    }
    
}

// Backend controller
require_once(APPPATH.'core/Backend_Controller.php');

// Frontend controller
require_once(APPPATH.'core/Frontend_Controller.php');

// Landing controller
require_once(APPPATH.'core/Landing_Controller.php');
