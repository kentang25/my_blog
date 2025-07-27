<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_log extends CI_Model {
	var $tabel_log		= 't_logs';

	function created_log($data){
		$this->db->insert($this->tabel_log, $data);
		return $this->db->insert_id();
	}
	
}