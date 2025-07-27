<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_master extends CI_Model {
	var $tablePrimary;
	public function __construct()
	{
		parent::__construct();
		$this->tablePrimary = "test";
	}
	function getLogin($where='',$table="")
	{
		if ($table==null) {
			$table = $this->tablePrimary;
		}
		if($where != null){
			return $this->db->select('*')->get_where($table,$where);
		}
		return $this->db->select('*')->get($table);
	}
	function getData($where='',$table="",$like="")
	{
		$table = ($table=="")?$tablePrimary:$table;
		if($like != null){
			return $this->db->select('*')->like($like)->get($table);
		}
		if($where != null){
			return $this->db->select('*')->get_where($table,$where);
		}
		return $this->db->select('*')->get($table);
	}
	function getSave($data='',$table="")
	{
		$table = ($table=="")?$tablePrimary:$table;
		$this->db->insert($table,$data);
		return $this->db->insert_id();
	}
	function getMultiSave($data='',$table="")
	{
		$table = ($table=="")?$tablePrimary:$table;
	    return $this->db->insert_batch($table, $data);
	}
	function getUpdate($data='',$where='',$table="")
	{
		$table = ($table=="")?$tablePrimary:$table;
		//$where = array_filter($where);
		//$data = array_filter($data);
		return $this->db->where($where)->update($table,$data);
	}
	function getDelete($where='',$table="")
	{
		$table = ($table=="")?$tablePrimary:$table;
		$where = array_filter($where);
		return $this->db->where($where)->delete($table);
	}
	function getQuery($str='')
	{
		return $this->db->query($str);
	}

}

/* End of file M_master.php */
/* Location: ./application/controllers/M_master.php */