<?php

    Class M_barang extends CI_model{
        public function tampil_data()
        {
            $query = $this->db->limit(3)->get('tb_data_barang');
            return $query;
        }
        
        public function tampil_karya()
        {
            $query = $this->db->limit(3)->get('tb_karya');
            return $query;
        }

        public function tampil_galeri()
        {
            $query = $this->db->limit(6)->get('tb_galeri');
            return $query;
        }
    }

?>