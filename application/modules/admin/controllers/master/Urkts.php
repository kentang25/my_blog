<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Urkts extends BackendController {
	//
    public $CI;
    public $table = "m_temuan";
	public $modul = "Urkts";

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
        $this->load->model('M_datatables');
        $this->load->model('M_master');
    }

    /**
     * [index description]
     *
     * @method index
     *
     * @return [type] [description]
     */
	public function index()
    {
    	$this->data['title'] = "Temuan AMI";
        $this->template_admin('master/v_temuan', $this->data, true);
    }

    public function get_data()
    {
    	try {
    		$csrf_name = $this->security->get_csrf_token_name();
			$csrf_hash = $this->security->get_csrf_hash(); 
	        $query  = "SELECT * FROM m_temuan";
	        $search = array('template_temuan');
	        $where  = null; 
	        $isWhere = null;
	        header('Content-Type: application/json');
	        echo $this->M_datatables->get_tables_query_csrf($query,$search,$where,$isWhere,$csrf_name,$csrf_hash);
    	} catch (Exception $e) {
			var_dump($e);
    	}
    }

    public function save(){
    	if($this->input->is_ajax_request()){
    		$token = array('csrfName' => $this->security->get_csrf_token_name(),
				        'csrfHash' => $this->security->get_csrf_hash()
				        );
    		$this->form_validation->set_rules('template_temuan','Nama Temuan AMI','trim|required|min_length[3]');
			$this->form_validation->set_message('required','%s tidak boleh kosong !');

			if($this->form_validation->run() == TRUE){	
                $template_temuan  = clean_tag_input($this->input->post('template_temuan'));

                $data = array(
                    "template_temuan" => $template_temuan,
                );
				//insert 
                $insert = $this->M_master->getSave($data, $this->table);
                if($insert){
                    $this->_createLog($this->modul, "Insert", $this->table, $insert, "data : ".json_encode($data));
				    echo json_encode(array('data'=>array("status"=>true), 'csrfToken'=>$token, "statusCode"=>200));
                }else{
                    echo json_encode(array('error'=>"Gagal Insert", 'csrfToken'=>$token, "statusCode"=>500));
                }   

			}else{
				$errors = validation_errors();
            	echo json_encode(array('error'=>$errors, 'csrfToken'=>$token, "statusCode"=>505));
			}
    	}
    }

    public function update(){
        if($this->input->is_ajax_request()){
            $token = array('csrfName' => $this->security->get_csrf_token_name(),
                        'csrfHash' => $this->security->get_csrf_hash()
                        );
            $this->form_validation->set_rules('id','ID','trim|required');
            $this->form_validation->set_rules('template_temuan','Nama Temuan AMI','trim|required|min_length[3]');
            $this->form_validation->set_message('required','%s tidak boleh kosong !');

            if($this->form_validation->run() == TRUE){  
                $id  = clean_tag_input($this->input->post('id'));
                $template_temuan  = clean_tag_input($this->input->post('template_temuan'));
               
                $data = array(
                    "template_temuan" => $template_temuan,
                );
                $where = array(
                    "id" => $id
                );
                //update 
                $update = $this->M_master->getUpdate($data, $where , $this->table);
                if($update){
                    $this->_createLog($this->modul, "Update", $this->table, $id, "data : ".json_encode($data));
                    echo json_encode(array('data'=>array("status"=>true), 'csrfToken'=>$token, "statusCode"=>200));
                }else{
                    echo json_encode(array('error'=>"Gagal Update", 'csrfToken'=>$token, "statusCode"=>500));
                }   

            }else{
                $errors = validation_errors();
                echo json_encode(array('error'=>$errors, 'csrfToken'=>$token, "statusCode"=>505));
            }
        }
    }


    public function destroy(){
        if($this->input->is_ajax_request()){
            $token = array('csrfName' => $this->security->get_csrf_token_name(),
                        'csrfHash' => $this->security->get_csrf_hash()
                        );
            $this->form_validation->set_rules('id','ID','trim|required');

            if($this->form_validation->run() == TRUE){  
                $id  = clean_tag_input($this->input->post('id'));
                $where = array(
                    "id" => $id
                );
                //update 
                $update = $this->M_master->getDelete($where , $this->table);
                if($update){
                    $this->_createLog($this->modul, "Delete", $this->table, $id, "data : ".json_encode($where));
                    echo json_encode(array('data'=>array("status"=>true), 'csrfToken'=>$token, "statusCode"=>200));
                }else{
                    echo json_encode(array('error'=>"Gagal Delete", 'csrfToken'=>$token, "statusCode"=>500));
                }   

            }else{
                $errors = validation_errors();
                echo json_encode(array('error'=>$errors, 'csrfToken'=>$token, "statusCode"=>505));
            }
        }
    }


    //mass delete data
    function mass_delete(){

        if($this->input->is_ajax_request()){
             $token = array('csrfName' => $this->security->get_csrf_token_name(),
                        'csrfHash' => $this->security->get_csrf_hash()
                        );

            $data_id = $this->input->post('id');

            // echo json_encode($data_id);

            if ($data_id!=''){
                $pjg_array = count($data_id);
                $id = $data_id;
                for($k=0; $k<$pjg_array; $k++){
                    $where = array(
                        "id" => $id[$k]
                    );
                    $mass_delete = $this->M_master->getDelete($where, $this->table);
                    $this->_createLog($this->modul, "Delete", $this->table, $id[$k], "data : ".json_encode($where));
                }   
            }

            if($mass_delete){
                echo json_encode(array('data'=>array("status"=>true), 'csrfToken'=>$token, "statusCode"=>200));
            } else {
                echo json_encode(array('error'=>"Gagal Mass Delete", 'csrfToken'=>$token, "statusCode"=>500));
            }
        }else{
            echo json_encode(array('error'=>"Gagal Mass Delete", 'csrfToken'=>$token, "statusCode"=>500));
        }
    }


}

