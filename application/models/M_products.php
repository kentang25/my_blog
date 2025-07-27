<?php

    Class M_products extends CI_Model{

        public function tampil_data()
        {
            $query = $this->db->get('tb_data_barang');
            return $query;
        }

        public function hot_trend()
        {
            $query = $this->db->get_where('tb_data_barang',array('news'=>'Hot Trend'));
            return $query;
        }

        public function best_seller()
        {
            $query = $this->db->get_where('tb_data_barang',array('news'=>'Best Seller'));
            return $query;
        }

        public function feature()
        {
            $query = $this->db->get_where('tb_data_barang',array('news'=>'Feature'));
            return $query;
        }

        public function all_data_kategori()
        {
            $query = $this->db->get('tb_data_barang');
            return $query;
        }

        public function detail_products($id)
        {
            $query = $this->db->get_where('tb_data_barang', array('id_barang'=>$id));
            return $query;
        }

    }

?>