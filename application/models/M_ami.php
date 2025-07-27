<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_ami extends CI_Model {
	var $tablePrimary;
	public function __construct()
	{
		parent::__construct();
		$this->tablePrimary = "ami";
	}

	public function getAmi($id_periode = null){
		if($id_periode){
			return $this->db
				->select("*")
				->join("periode","periode.id_periode=ami.id_periode")
				->join("m_unit","m_unit.id_unit=ami.id_unit")
				->where("ami.id_periode",$id_periode)
				->get("ami");	
		}else{
			return $this->db
				->select("*")
				->join("periode","periode.id_periode=ami.id_periode")
				->join("m_unit","m_unit.id_unit=ami.id_unit")
				->get("ami");
		}
		
	}

	public function getAuditorAmi($id_ami){
		return $this->db
				->select("*")
				->join("auditor","auditor.id_auditor=auditor_ami.id_auditor")
				->join("pegawai","pegawai.nip=auditor.nip")
				->where("auditor_ami.id_ami",$id_ami)
				->order_by("auditor.level","DESC")
				->get("auditor_ami");
	}

	//AUDITOR ADMIN
	public function getAmiAuditorAdmin($id_periode = null){
		if($id_periode){
			return $this->db
				->select("*")
				// ->join("ami","ami.id_ami=auditor_ami.id_ami")
				->join("periode","periode.id_periode=ami.id_periode")
				->join("m_unit","m_unit.id_unit=ami.id_unit")
				->where("ami.id_periode",$id_periode)
				->order_by("ami.created_at","DESC")
				->get("ami");	
		}else{
			return $this->db
				->select("*")
				// ->join("ami","ami.id_ami=auditor_ami.id_ami")
				->join("periode","periode.id_periode=ami.id_periode")
				->join("m_unit","m_unit.id_unit=ami.id_unit")
				->order_by("ami.created_at","DESC")
				->get("ami");
		}
		
	}
	

	public function createAMI($data){
		$this->db->trans_begin();

		//save AMI
	 	$this->db->insert("ami", array(
	 		"id_periode"=>$data['id_periode'],
	 		"id_unit"=>$data['id_unit'],
	 	));

	 	$insert_id_ami = $this->db->insert_id();
	 	$dataAuditor = [];
	 	for ($i=0; $i < count($data['id_auditor']) ; $i++) { 
	 		array_push($dataAuditor,array(
	 			"id_ami"=>$insert_id_ami,
	 			"id_auditor"=>$data['id_auditor'][$i]
	 		));
	 	}

	    $this->db->insert_batch("auditor_ami", $dataAuditor);

	    //insert ke hasil mekanisme
	    $mekanisme = $this->db->get("mekanisme")->result();

	    foreach ($mekanisme as $key => $value) {
	        $detail = array(
	 			"id_ami"=>$insert_id_ami,
	            "id_mekanisme"=>$value->id_mekanisme,
	            "jawaban"=>"N",
	        );
	        $this->db->insert("hasil_mekanisme",$detail);
	    }

	    $proses_ami = array(
	    	array(
	    		"id_ami"=>$insert_id_ami,
	    		"nama_proses"=>"mekanisme",
	    	),
	    	array(
	    		"id_ami"=>$insert_id_ami,
	    		"nama_proses"=>"audit",
	    	),
	    	array(
	    		"id_ami"=>$insert_id_ami,
	    		"nama_proses"=>"kesimpulan",
	    	),
	    	array(
	    		"id_ami"=>$insert_id_ami,
	    		"nama_proses"=>"rtm",
	    	),
	    	array(
	    		"id_ami"=>$insert_id_ami,
	    		"nama_proses"=>"dokumentasi",
	    	),
	    );
        $this->db->insert_batch("proses_ami",$proses_ami);




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

	public function getStandadtAMI($id_ami,$id_periode){
		return $this->db->query("SELECT *,sub_standart.id_substandart as idsubstd FROM `standart` INNER JOIN sub_standart on sub_standart.id_standart=standart.id_standart LEFT JOIN audit ON audit.id_substandart=sub_standart.id_substandart AND audit.id_ami='".$id_ami."' WHERE standart.id_periode='".$id_periode."' AND audit.id_ami IS NULL");
	}

	public function getSubStandart($id_ami,$id_periode,$id_unit){
		return $this->db->select("*")
				->join("audit","audit.id_ami=ami.id_ami")
				->join("sub_standart","sub_standart.id_substandart=audit.id_substandart")
				->where(array(
					// "ami.id_ami"=>$id_ami,
					"ami.id_periode"=>$id_periode,
					"ami.id_unit"=>$id_unit,
				))
				->get("ami");
	}

	//AUDITOR
	public function getAmiAuditor($id_periode = null, $id_auditor){
		if($id_periode){
			return $this->db
				->select("*")
				->join("ami","ami.id_ami=auditor_ami.id_ami")
				->join("periode","periode.id_periode=ami.id_periode")
				->join("m_unit","m_unit.id_unit=ami.id_unit")
				// ->join("kesimpulan","kesimpulan.id_ami=ami.id_ami","LEFT")
				->where("ami.id_periode",$id_periode)
				->where("auditor_ami.id_auditor",$id_auditor)
				->order_by("ami.created_at","DESC")
				->get("auditor_ami");	
		}else{
			return $this->db
				->select("*")
				->join("ami","ami.id_ami=auditor_ami.id_ami")
				->join("periode","periode.id_periode=ami.id_periode")
				->join("m_unit","m_unit.id_unit=ami.id_unit")
				// ->join("kesimpulan","kesimpulan.id_ami=ami.id_ami","LEFT")
				->where("auditor_ami.id_auditor",$id_auditor)
				->order_by("ami.created_at","DESC")
				->get("auditor_ami");
		}
		
	}

	public function getDataAuditor($id_auditor){
		return $this->db
				->select("*")
				->join("pegawai","pegawai.nip=auditor.nip")
				->where("auditor.id_auditor",$id_auditor)
				->get("auditor");	
	}

	public function getHasilMekanisme($id_ami){
		return $this->db
				->select("*")
				->join("mekanisme","mekanisme.id_mekanisme=hasil_mekanisme.id_mekanisme")
				->where("hasil_mekanisme.id_ami",$id_ami)
				->order_by("hasil_mekanisme.id_hasil_mekanisme")
				->get("hasil_mekanisme");	
	}

	public function getKesimpulanAmi($id_ami){
		return $this->db
				->select("*")
				->join("ami","ami.id_ami=kesimpulan.id_ami")
				->where("kesimpulan.id_ami",$id_ami)
				->get("kesimpulan");	
	}

	//AUDITEE
	public function getDataAuditee($unit){
		return $this->db
				->select("*")
				->join("pegawai","pegawai.nip=unit.nip")
				->where("unit.id_unit",$unit)
				->get("unit");	
	}

	public function getAmiAuditee($id_periode = null, $code_user){
		if($id_periode){
			return $this->db
				->select("*")
				->join("ami","ami.id_unit=unit.id_unit")
				->join("periode","periode.id_periode=ami.id_periode")
				->join("m_unit","m_unit.id_unit=unit.id_unit")
				->where("ami.id_periode",$id_periode)
				->where("unit.id_periode",$id_periode)
				->where("unit.nip",$code_user)
				->order_by("ami.created_at","DESC")
				->get("unit");	
		}else{
			return $this->db
				->select("*")
				->join("ami","ami.id_ami=unit.id_ami")
				->join("periode","periode.id_periode=ami.id_periode")
				->join("m_unit","m_unit.id_unit=unit.id_unit")
				->where("unit.nip",$code_user)
				->order_by("ami.created_at","DESC")
				->get("unit");
		}
		
	}

	public function getDokumentasiAmi($id_ami){
		return $this->db
				->select("*")
				->join("ami","ami.id_ami=dokumentasi.id_ami")
				->join("m_unit","m_unit.id_unit=ami.id_unit")
				->join("pegawai","pegawai.nip=dokumentasi.created_by","LEFT")
				->where("ami.id_ami",$id_ami)
				->order_by("dokumentasi.id_dokumentasi")
				->get("dokumentasi");	
	}

	//AUDIT
	public function getDataAudit($id_ami){
		return $this->db
				->select("*")
				->join("sub_standart","sub_standart.id_substandart=audit.id_substandart")
				->join("standart","standart.id_standart=sub_standart.id_standart")
				->where("audit.id_ami",$id_ami)
				->order_by("audit.id_substandart")
				->get("audit");	
	}

	//Cetak AMI
	public function getDataAmiUnit($id_ami){
		return $this->db
				->select("*")
				->join("m_unit","m_unit.id_unit=ami.id_unit")
				->join("unit","unit.id_unit=m_unit.id_unit","LEFT")
				->join("pegawai","pegawai.nip=unit.nip","LEFT")
				->where("ami.id_ami",$id_ami)
				->get("ami");	
	}

	public function getDataAmiPeriode($id_ami){
		return $this->db
				->select("*")
				->join("periode","periode.id_periode=ami.id_periode")
				->where("ami.id_ami",$id_ami)
				->get("ami");	
	}
}

/* End of file M_ami.php */
/* Location: ./application/controllers/M_ami.php */