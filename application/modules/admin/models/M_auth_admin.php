<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_auth_admin extends CI_Model {
	var $tabel 			= 'sys_users';
	var $tabel_log		= 't_logs';

	public function validasi_login($input_username, $hash_input_password, $input_role_id){
		return $this->db
			->select("*", false)
			->where("username", $input_username) 
			->where("password", $hash_input_password) 
			->where("id_group", "1") 
			->limit(1)
			->get($this->tabel);
	}

	public function is_valid($user_id, $user_pass, $user_role_id){
		return $this->db
			->select("ID as id_user ")
			->where("ID", $user_id)
			->where("user_pass", $user_pass)
			->where("user_role_id", $user_role_id)
			->where('st_delete', 'N')
			->limit(1)
			->get($this->tabel);
	}
		
	function save_log($data){
		$this->db->insert($this->tabel_log, $data);
		return $this->db->insert_id();
	}

	function saveAksesModul($data){
		$this->db->insert($this->tabel_acces, $data);
		return $this->db->insert_id();
	}

	function deleteAksesModul($id){
		$this->db->where("user_role_id", $id)
				 ->delete($this->tabel_acces);
	}

	function deleteAksesModulByRole($id){
		$this->db->where("user_role_id", $id)
				 ->delete($this->tabel_acces);
	}

	function deleteAksesModulByModul($id){
		$this->db->where("mdl_id", $id)
				 ->delete($this->tabel_acces);
	}

	function deleteAksesModulBySubModul($id){
		$this->db->where("submdl_id", $id)
				 ->delete($this->tabel_acces);
	}

	function cekAdmin($code){
		return $this->db
			->select("*")
			->where("nip", $code)
			->limit(1)
			->get("admin");
	}

	function cekAuditor($code){
		return $this->db
			->select("*")
			->where("nip", $code)
			->limit(1)
			->get("auditor");
	}
	
	function cekAuditee($code){
		return $this->db
			->select("*")
			->where("nip", $code)
			->limit(1)
			->get("unit");
	}
	
}