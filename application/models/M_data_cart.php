<?php

    Class M_data_cart extends CI_Model{
        public function tampil_data_cart()
        {
            $query = $this->db->get('tb_cart');
            return $query;
        }
    }

?>