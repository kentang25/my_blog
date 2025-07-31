<?php

    Class M_daily_life extends CI_Model{

        public function tampil_data()
        {
            $query = $this->db->get('tb_daily_life');
            return $query;
        }

        public function insert_data()
        {
            $title          = $this->input->post('title');
            $dailay_life    = $this->input->post('daily_life');
            $gambar         = '';

                if(!empty($_FILES['gambar']['name'])){
                    $config['upload_path']      = FCPATH. 'assets/uploads';
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
                    'title'         => $title,
                    'daily_life'    => $dailay_life,
                    'gambar'        => $gambar
                );

                return $this->db->insert('tb_daily_life',$data);
        }
        

    }


?>