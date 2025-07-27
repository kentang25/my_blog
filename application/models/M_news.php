<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_news extends CI_Model {
	var $news		= 'news';

	public function get_published_count($q=null)
	{
		$query =$this->db->select("news.*, m_kategori.nama_kategori,m_unit.nama_unit")
				->join("m_unit ","m_unit.id_unit=news.id_unit","left")
				->join("m_kategori","m_kategori.id_kategori = news.id_kategori")
				->order_by('news.id_news',"DESC")
				->get("news");
		return $query->num_rows();
	}
	public function get_published($limit = null, $offset = null, $q = null)
	{
		if (!$limit && $offset) {
			$query = 
			 	$this->db->select("news.*, m_kategori.nama_kategori,m_unit.nama_unit")
				->join("m_unit ","m_unit.id_unit=news.id_unit","left")
				->join("m_kategori","m_kategori.id_kategori = news.id_kategori")
				->order_by('news.id_news',"DESC")
				->get("news");
		} else {
			$query =  $this->db->select("news.*, m_kategori.nama_kategori,m_unit.nama_unit")
				->join("m_unit ","m_unit.id_unit=news.id_unit","left")
				->join("m_kategori","m_kategori.id_kategori = news.id_kategori")
				->like('news.konten', $q)
				->or_like('news.title', $q)
				->limit($limit, $offset)
				->order_by('news.id_news',"DESC")
				->get("news");
		}
		return $query->result();
	}

	function getNews($q = null){
		if(empty($q)){
			return $this->db->select("news.*, m_kategori.nama_kategori,m_unit.nama_unit")
				->join("m_unit ","m_unit.id_unit=news.id_unit","left")
				->join("m_kategori","m_kategori.id_kategori = news.id_kategori")
				->order_by('news.id_news',"DESC")
				->get("news");
			}else{
			return $this->db->select("news.*, m_kategori.nama_kategori,m_unit.nama_unit")
				->join("m_unit ","m_unit.id_unit=news.id_unit","left")
				->join("m_kategori","m_kategori.id_kategori = news.id_kategori")
				->like('news.konten', $q)
				->or_like('news.title', $q)
				->order_by('news.id_news',"DESC")
				->get("news");
			}
	}

	function getNewsSlug($slug = null){
		return $this->db->select("news.*, m_kategori.nama_kategori,m_unit.nama_unit")
				->join("m_unit ","m_unit.id_unit=news.id_unit","left")
				->join("m_kategori","m_kategori.id_kategori = news.id_kategori")
				->where("news.slug", $slug)
				->order_by('news.id_news',"DESC")
				->get("news");
	}

	function getNewsRandom($count){
		return $this->db->select("news.*, m_kategori.nama_kategori,m_unit.nama_unit")
				->join("m_unit ","m_unit.id_unit=news.id_unit","left")
				->join("m_kategori","m_kategori.id_kategori = news.id_kategori")
				->order_by('rand()')
    			->limit($count)
				->get("news");
	}

	function getNewsMostView($count){
		return $this->db->select("news.*, m_kategori.nama_kategori,m_unit.nama_unit")
				->join("m_unit ","m_unit.id_unit=news.id_unit","left")
				->join("m_kategori","m_kategori.id_kategori = news.id_kategori")
				->order_by('views','DESC')
    			->limit($count)
				->get("news");
	}


	function getNewsCategory($kategori){
			return $this->db->select("news.*, m_kategori.nama_kategori,m_unit.nama_unit")
				->join("m_unit ","m_unit.id_unit=news.id_unit","left")
				->join("m_kategori","m_kategori.id_kategori = news.id_kategori")
				->where("m_kategori.nama_kategori", $kategori)
				->order_by('news.id_news',"DESC")
				->get("news");
	}

	function updateViews($slug){
		return	$this->db->query("UPDATE news SET views=views+1 WHERE slug='$slug'");
	}



}