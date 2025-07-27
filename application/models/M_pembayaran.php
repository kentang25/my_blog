<?php

    Class M_pembayaran extends CI_Model{

        public function created_order($data){
            $query = $this->db->insert('tb_order',$data);
            return $this->db->insert_id();
        }

        public function get_id_order($id_order){
            $query = $this->db->get_where('tb_order',array('id_order=>$id_order'))->row();
            return $query;
        }

        public function get_order(){
            $query = $this->db->get('tb_order');
            return $query;
        }

        // --- transaksi ---

        public function created_transaksi($data)
        {
            $query = $this->db->insert('tb_transaksi',$data);
            return $query;
        }

        public function update_status_order($id_order)
        {
            $this->db->where('id_order',$id_order);
            $this->db->update('tb_order',array('status'=>'complated'));
            
        }

        public function clear_cart($id_user)
        {
            $this->db->trans_start();

            $this->db->where('id_user',$id_user);
            $this->db->delete('tb_cart');

            $this->db->where('id_user',$id_user);
            $this->db->delete('tb_order');

            $this->db->trans_complete();

            if($this->db->trans_status() === FALSE){
                return FALSE;
            }else{
                redirect('futuretrend');
            }

        }

    }

?>