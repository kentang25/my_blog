<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_tag extends CI_Model {
	var $m_tag		= 'M_tag';

	function getTag(){
		// return $this->db->get($this->m_tag);
		return $this->db->query("SELECT * FROM m_tag");
		
	}
	
}