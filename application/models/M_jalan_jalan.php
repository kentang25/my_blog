<?php

    Class M_jalan_jalan extends CI_Model{

        public function tampil_data()
        {
            $query = $this->db->get('tb_jalan_jalan');
            return $query;
        }

        public function insert_data()
        {
            $title      = $this->input->post('title');
            $ceritanya  = $this->input->post('ceritanya');
            $gambar     = '';

                if(!empty($_FILES['gambar']['name'])){
                    $config['upload_path']      = FCPATH. 'assets/uploads/';
                    $config['allowed_types']    = 'jpg|jpeg|png|webp';

                        $this->load->library('upload',$config);

                        if(!$this->upload->do_upload('gambar')){
                            echo $this->upload->display_errors();
                            die();
                        }else{
                            $gambar = $this->upload->data('file_name');
                        }
                }

                $data = array(
                    'title'     => $title,
                    'ceritanya' => $ceritanya,
                    'gambar'    => $gambar
                );

                return $this->db->insert('tb_jalan_jalan',$data);
        }

        public function edit_data($table,$where)
        {
            $query = $this->db->get_where($table,$where);
            return $query;
        }

        public function update_data($id)
        {
            $title      = $this->input->post('title');
            $ceritanya  = $this->input->post('ceritanya');

                $data = array(
                    'title'     => $title,
                    'ceritanya' => $ceritanya,
                );

            $this->db->where('id_jalan',$id);
            return $this->db->update('tb_jalan_jalan',$data);
        }

        public function detail_data($id)
        {
            $query = $this->db->get_where('tb_jalan_jalan', array('id_jalan'=> $id));
            return $query;
        }

        public function delete_data($id)
        {
            $query = $this->db->delete('tb_jalan_jalan', array('id_jalan'=>$id));
            return $query;
        }

    }

?>