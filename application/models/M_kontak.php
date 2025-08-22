<?php

    Class M_kontak extends CI_Model{

        public function tampil_data()
        {
            $query = $this->db->get('tb_kontak');
            return $query;
        }

        public function insert_data()
        {
            $title      = $this->input->post('title');
            $kalimat    = $this->input->post('kalimat');
            $instagram  = $this->input->post('instagram');
            $facebook   = $this->input->post('facebook');
            $email      = $this->input->post('email');
            $gambar     = '';

            if(!empty($_FILES['gambar']['name'])){
                $config['upload_path']      = FCPATH. 'assets/uploads/';
                $config['allowed_types']    = 'jpg|jpeg|png|webp|';

                    $this->load->library('upload',$config);

                    if(!$this->upload->do_upload('gambar')){
                        echo $this->upload->display_errers();
                        die();
                    }else{
                        $gambar = $this->upload->data('file_name');
                    }
            }

            $data = array(
                'title'     => $title,
                'kalimat'   => $kalimat,
                'instagram' => $instagram,
                'facebook'  => $facebook,
                'email'     => $email,
                'gambar'    => $gambar
            );

            return $this->db->insert('tb_kontak',$data);
        }

        public function edit_data($table,$where)
        {
            $query = $this->db->get_where($table,$where);
            return $query;
        }

        public function update_data($id)
        {
            $title      = $this->input->post('title');
            $kalimat    = $this->input->post('kalimat');
            $instagram  = $this->input->post('instagram');
            $facebook   = $this->input->post('facebook');
            $email      = $this->input->post('email');

                $data = array(
                'title'     => $title,
                'kalimat'   => $kalimat,
                'instagram' => $instagram,
                'facebook'  => $facebook,
                'email'     => $email
            );

            $this->db->where('id_kontak',$id);
            return $this->db->update('tb_kontak',$data);
        }

        public function detail_data($id)
        {
            $query = $this->db->get_where('tb_kontak', array('id_kontak'=>$id));
            return $query;
        }

        public function delete_data($id)
        {
            $query = $this->db->delete('tb_kontak', array('id_kontak'=>$id));
            return $query;
        }

    }

?>