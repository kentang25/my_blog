<?php

    Class M_books extends CI_Model{

        public function tampil_data()
        {
            $query = $this->db->get('tb_books');
            return $query;
        }

        public function insert_data()
        {
            $title      = $this->input->post('title');
            $judul      = $this->input->post('judul');
            $pengarang  = $this->input->post('pengarang');
            $penerbit   = $this->input->post('penerbit');
            $tahun      = $this->input->post('tahun');
            $ulasan     = $this->input->post('ulasan');
            $gambar     = '';

            if(!empty($_FILES['gambar']['name'])){
                $config['upload_path']     = FCPATH. 'assets/uploads/';
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
                'judul'     => $judul,
                'pengarang' => $pengarang,
                'penerbit'  => $penerbit,
                'tahun'     => $tahun,
                'ulasan'    => $ulasan,
                'gambar'    => $gambar
            );

            return $this->db->insert('tb_books',$data);
        }

        public function edit_data($table,$where)
        {
            $query = $this->db->get_where($table,$where);
            return $query;
        }

        public function update_data($id)
        {
            $title      = $this->input->post('title');
            $judul      = $this->input->post('judul');
            $pengarang  = $this->input->post('pengarang');
            $penerbit   = $this->input->post('penerbit');
            $tahun      = $this->input->post('tahun');
            $ulasan     = $this->input->post('ulasan');

                $data = array(
                'title'     => $title,
                'judul'     => $judul,
                'pengarang' => $pengarang,
                'penerbit'  => $penerbit,
                'tahun'     => $tahun,
                'ulasan'    => $ulasan
            );

            $this->db->where('id_book',$id);
            return $this->db->update('tb_books',$data);
        }

        public function detail_data($id)
        {
            $query = $this->db->get_where('tb_books', array('id_book'=>$id));
            return $query;
        }

        public function delete_data($id)
        {
            $query = $this->db->delete('tb_books',array('id_book'=>$id));
            return $query; 
        }

    }

?>