<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_standart extends CI_Model {
	var $tablePrimary;
	public function __construct()
	{
		parent::__construct();
		$this->tablePrimary = "standart";
	}


	public function copyStandart($id_periode){
		$this->db->trans_begin();
		//save AMI

	 	$get_standart = $this->db->select("*")->where("id_periode",$id_periode)->get("standart")->result();
            
        foreach ($get_standart as $key => $row) {
        	$this->db->insert('standart',array(
        		"id_periode"=>$this->session->userdata('periodeIDSet'),
        		"nama_standart"=>$row->nama_standart
        	));

	 		$insert_id_standart = $this->db->insert_id();
	 		$get_sub_standart = $this->db->select("*")->where("id_standart",$row->id_standart)->get("sub_standart")->result();
            foreach ($get_sub_standart as $key => $sub) {
                //Insert Sub Standart
                $insertSub = $this->db->insert("sub_standart",array(
                    "id_standart" => $insert_id_standart,
                    "deskripsi_substandart"=> $sub->deskripsi_substandart,
                    "isi_substandart"=> $sub->isi_substandart,
                ));
            }
        }

		$this->db->trans_complete();
		if ($this->db->trans_status() === FALSE){
		        $this->db->trans_rollback();
		        return FALSE;
		}
		else{
		        $this->db->trans_commit();
		        return TRUE;
		}
	}

}

/* End of file M_standart.php */
/* Location: ./application/controllers/M_standart.php */