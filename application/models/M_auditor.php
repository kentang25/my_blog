<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_auditor extends CI_Model {
	var $tablePrimary;
	public function __construct()
	{
		parent::__construct();
		$this->tablePrimary = "auditor";
	}

	public function getAuditor($level = null,$id_periode=null){
		if($level){
			$auditor = $this->db->select("*")
						->join("pegawai","pegawai.nip=auditor.nip")
						->where("auditor.level",$level)
						->get("auditor");
		}else{
			$auditor = $this->db->select("*")
						->join("pegawai","pegawai.nip=auditor.nip")
						->where("id_periode",$id_periode)
						->get("auditor");
		}
		return $auditor;
	}
	

}

/* End of file M_auditor.php */
/* Location: ./application/controllers/M_auditor.php */