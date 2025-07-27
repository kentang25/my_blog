<?php

    Class M_data_transaksi extends CI_Model{
        public function tampil_data_transaksi()
        {
            $query = $this->db->get('tb_transaksi');
            return $query;
        }
    }

?>