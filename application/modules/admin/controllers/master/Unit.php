<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Unit extends BackendController {
	//
    public $CI;
    public $table = "m_unit";
	public $modul = "Unit";

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
    	$this->data['title'] = "Unit";
        $this->template_admin('master/v_unit', $this->data, true);
    }

    public function get_data()
    {
    	try {
    		$csrf_name = $this->security->get_csrf_token_name();
			$csrf_hash = $this->security->get_csrf_hash(); 
	        $query  = "SELECT m_unit.*, COUNT(m_subunit.nama_subunit) as jml_subunit FROM m_unit LEFT JOIN m_subunit ON m_subunit.id_unit = m_unit.id_unit";
	        $search = array('nama_unit');
	        $where  = null; 
	        $isWhere = null;
            $groupBy = "m_unit.id_unit";
	        header('Content-Type: application/json');
	        echo $this->M_datatables->get_tables_query_csrf_groupby($query,$search,$where,$isWhere,$csrf_name,$csrf_hash,$groupBy);
    	} catch (Exception $e) {
			var_dump($e);
    	}
    }

    public function save(){
    	if($this->input->is_ajax_request()){
    		$token = array('csrfName' => $this->security->get_csrf_token_name(),
				        'csrfHash' => $this->security->get_csrf_hash()
				        );
    		$this->form_validation->set_rules('nama_unit','Nama Unit','trim|required|min_length[3]');
			$this->form_validation->set_rules('deskripsi','Deskripsi','trim');
			$this->form_validation->set_message('required','%s tidak boleh kosong !');

			if($this->form_validation->run() == TRUE){	
                $nama_unit  = clean_tag_input($this->input->post('nama_unit'));
                $deskripsi    = clean_tag_input($this->input->post('deskripsi'));

                $data = array(
                    "nama_unit" => $nama_unit,
                    "deskripsi" => $deskripsi,
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
            $this->form_validation->set_rules('id_unit','ID','trim|required');
            $this->form_validation->set_rules('nama_unit','Nama Unit','trim|required|min_length[3]');
            $this->form_validation->set_rules('deskripsi','Deskripsi','trim');
            $this->form_validation->set_message('required','%s tidak boleh kosong !');

            if($this->form_validation->run() == TRUE){  
                $id_unit  = clean_tag_input($this->input->post('id_unit'));
                $nama_unit  = clean_tag_input($this->input->post('nama_unit'));
                $deskripsi    = clean_tag_input($this->input->post('deskripsi'));

                $data = array(
                    "nama_unit" => $nama_unit,
                    "deskripsi" => $deskripsi,
                );
                $where = array(
                    "id_unit" => $id_unit
                );
                //update 
                $update = $this->M_master->getUpdate($data, $where , $this->table);
                if($update){
                    $this->_createLog($this->modul, "Update", $this->table, $id_unit, "data : ".json_encode($data));
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
                    "id_unit" => $id
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
                        "id_unit" => $id[$k]
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


    //select2 pagination
    function selectUnit()
    {
        if($this->input->is_ajax_request()){
             $token = array('csrfName' => $this->security->get_csrf_token_name(),
                        'csrfHash' => $this->security->get_csrf_hash()
                        );
            $page = $this->input->get("page");
            $resultCount = 2;

            $offset = ($page - 1) * $resultCount;

            $data = $this->db->like('nama_unit', $this->input->get("term"), 'both')
                                // ->or_where('id_unit', '')
                                ->order_by('nama_unit')
                                ->limit($resultCount)
                                ->offset($offset)
                                // ->select('id_unit , CONCAT(id_unit , " - " ,nama_unit) as text ')
                                ->select('id_unit , nama_unit as text')
                                ->get("m_unit");

            $count = $this->db->like('nama_unit', $this->input->get("term"), 'both')
                                    // ->or_where('id_unit', 'like',  '%asd%')
                                    ->order_by('nama_unit')
                                    // ->select('id_unit , CONCAT(id_unit , " - " ,nama_unit) as text ')
                                    ->get("m_unit")->num_rows();

            $endCount = $offset + $resultCount;
            $morePages = $count > $endCount;

            $results = array(
                "results" => $data->result(),
                "count" => $count,
                "endCount" => $endCount,
                "pagination" => array(
                    "more" =>$morePages
                ),
                "csrfToken"=>$token,
                "send"=>$this->input->get("page")
            );

            echo json_encode($results);

        }
    }


      //SUBUNIT
    public function subunit($id_unit)
    {
        $unit = $this->M_master->getData(array("id_unit"=>$id_unit),"m_unit",null)->row();
        if(!$unit) return $this->show_404();

        $this->data['title'] = "Sub Unit " . $unit->nama_unit;
        $this->data['unit'] = $unit;
        $this->template_admin('master/v_subunit', $this->data, true);
    }



    public function get_data_subunit($id_unit)
    {
        try {
            $csrf_name = $this->security->get_csrf_token_name();
            $csrf_hash = $this->security->get_csrf_hash(); 
            $query  = "SELECT m_subunit.*, m_unit.nama_unit FROM m_subunit INNER JOIN m_unit ON m_unit.id_unit = m_subunit.id_unit ";
            $search = array('nama_unit', 'nama_subunit');
            $where  = array("m_subunit.id_unit"=>$id_unit); 
            $isWhere = null;
            header('Content-Type: application/json');
            echo $this->M_datatables->get_tables_query_csrf($query,$search,$where,$isWhere,$csrf_name,$csrf_hash);
        } catch (Exception $e) {
            var_dump($e);
        }
    }

    public function save_subunit(){
        if($this->input->is_ajax_request()){
            $token = array('csrfName' => $this->security->get_csrf_token_name(),
                        'csrfHash' => $this->security->get_csrf_hash()
                        );
            $this->form_validation->set_rules('nama_subunit','Nama Subunit','trim|required|min_length[3]');
            $this->form_validation->set_rules('id_unit','Unit','trim|required');
            $this->form_validation->set_rules('deskripsi','Deskripsi','trim');
            $this->form_validation->set_message('required','%s tidak boleh kosong !');

            if($this->form_validation->run() == TRUE){  
                $nama_subunit  = clean_tag_input($this->input->post('nama_subunit'));
                $deskripsi    = clean_tag_input($this->input->post('deskripsi'));
                $id_unit    = clean_tag_input($this->input->post('id_unit'));
                
                $data = array(
                    "nama_subunit" => $nama_subunit,
                    "deskripsi" => $deskripsi,
                    "id_unit" => $id_unit,
                );
                //insert 
                $insert = $this->M_master->getSave($data, "m_subunit");
                if($insert){
                    $this->_createLog($this->modul, "Insert", "m_subunit", $insert, "data : ".json_encode($data));
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

    public function update_subunit(){
        if($this->input->is_ajax_request()){
            $token = array('csrfName' => $this->security->get_csrf_token_name(),
                        'csrfHash' => $this->security->get_csrf_hash()
                        );
            $this->form_validation->set_rules('id_subunit','ID','trim|required');
            $this->form_validation->set_rules('nama_subunit','Nama Subunit','trim|required|min_length[3]');
            $this->form_validation->set_rules('deskripsi','Deskripsi','trim');
            $this->form_validation->set_message('required','%s tidak boleh kosong !');

            if($this->form_validation->run() == TRUE){  
                $id_subunit  = clean_tag_input($this->input->post('id_subunit'));
                $nama_subunit  = clean_tag_input($this->input->post('nama_subunit'));
                $deskripsi    = clean_tag_input($this->input->post('deskripsi'));

                $data = array(
                    "nama_subunit" => $nama_subunit,
                    "deskripsi" => $deskripsi,
                );
                $where = array(
                    "id_subunit" => $id_subunit
                );
                //update 
                $update = $this->M_master->getUpdate($data, $where , "m_subunit");
                if($update){
                    $this->_createLog($this->modul, "Update", "m_subunit", $id_subunit, "data : ".json_encode($data));
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


    public function destroy_subunit(){
        if($this->input->is_ajax_request()){
            $token = array('csrfName' => $this->security->get_csrf_token_name(),
                        'csrfHash' => $this->security->get_csrf_hash()
                        );
            $this->form_validation->set_rules('id','ID','trim|required');

            if($this->form_validation->run() == TRUE){  
                $id  = clean_tag_input($this->input->post('id'));
                $where = array(
                    "id_subunit" => $id
                );
                //update 
                $update = $this->M_master->getDelete($where , "m_subunit");
                if($update){
                    $this->_createLog($this->modul, "Delete", "m_subunit", $id, "data : ".json_encode($where));
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
    function mass_delete_subunit(){

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
                        "id_subunit" => $id[$k]
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

