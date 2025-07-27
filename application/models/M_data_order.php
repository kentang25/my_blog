<?php

    Class M_data_order extends CI_Model{

        public function tampil_data_order()
        {
            $query = $this->db->get('tb_order');
            return $query;
        }

    }

?>