<?php 

    Class M_cerita extends CI_Model{

        public function tampil_data()
        {
            $query = $this->db->get('tb_cerita');
            return $query;
        }

        public function insert_data()
        {
            $title      = $this->input->post('title');
            $cerita     = $this->input->post('cerita');
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
                'cerita'    => $cerita,
                'gambar'    => $gambar
            );

            return $this->db->insert('tb_cerita',$data);
        }

        public function detail_blog($id)
        {
            $query = $this->db->get_where('tb_cerita', array('id_cerita'=>$id));
            // var_dump($query);
            // exit();
            return $query;
        }

    }

?>