<?php 

    Class M_about extends CI_Model{

        public function tampil_data()
        {
            $query = $this->db->get('tb_about');
            return $query;
        }

        public function insert_data()
        {
        $title      = $this->input->post('title');
        $about_user = $this->input->post('about_user');
        $title_2    = $this->input->post('title_2');
        $about_kegiatan = $this->input->post('about_kegiatan');
        $gambar_user = '';
        $gambar_kegiatan = '';

        // var_dump($_FILES['gambar_user']);
        // exit();

        if(!empty($_FILES['gambar_user']['name'])){
            $config['upload_path']      = FCPATH. 'assets/uploads/';
            $config['allowed_types']    = 'jpg|jpeg|png|webp';

            $this->load->library('upload',$config);

            if(!$this->upload->do_upload('gambar_user')){
                echo $this->upload->display_errors();
                exit();
            }else{
                $gambar_user = $this->upload->data('file_name');
            }
        }

        if(!empty($_FILES['gambar_kegiatan']['name'])){
            $config['upload_path']      = FCPATH. 'assets/uploads/';
            $config['allowed_types']    = 'jpg|jpeg|png|webp';

            $this->load->library('upload',$config);

            if(!$this->upload->do_upload('gambar_kegiatan')){
                echo $this->upload->display_errors();
                exit();
            }else{
                $gambar_kegiatan = $this->upload->data('file_name');
            }
        }

        $data = array(
            'title'             => $title,
            'about_user'        => $about_user,
            'title_2'           => $title_2,
            'about_kegiatan'    => $about_kegiatan,
            'gambar_user'       => $gambar_user,
            'gambar_kegiatan'   => $gambar_kegiatan
        );

        return $this->db->insert('tb_about', $data);

        }
    }


?>