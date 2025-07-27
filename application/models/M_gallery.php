<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_gallery extends CI_Model {
	var $m_gallery		= 'web_gallery';

	function getGallery(){
		return $this->db->select("*")
						->order_by("created_at", "DESC")
						->limit(6)
						->get("web_gallery");
		
	}
	
}