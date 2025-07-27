<?php

    Class M_cart extends CI_Model{
        public function find($id_brg){
            $result = $this->db->where('id_barang', $id_brg)
                            ->limit(1)
                            ->get('tb_data_barang');
            return $result->num_rows() > 0 ? $result->row() : null;
        }
        

        public function insert_data_cart($data)
        {
            $query = $this->db->insert('tb_cart',$data);
            return $query;
        }

        public function get_cart()
        {
            return $this->db->get('tb_cart')->result();
        }

        public function tampil_cart($id_user)
        {
            $query = $this->db->where('id_user',$id_user)
                              ->get('tb_cart');
            return $query;                                
        }

        public function update_cart_qty($id_barang,$jumlah)
        {
            $this->db->where('id_barang',$id_barang);
            return $this->db->update('tb_cart',['jumlah'=>$jumlah]);
        }

        public function get_gambar($id_barang)
        {
            $query = $this->db->get_where('tb_data_barang', array('id_barang' => $id_barang));
            return $query->row(); // KUNCI FIX
        }

    }

?>