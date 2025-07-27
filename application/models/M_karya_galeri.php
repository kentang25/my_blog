<?php
    
    Class M_karya_galeri extends CI_model{

        public function tampil_karya()
        {
            $query = $this->db->get('tb_karya');
            return $query;
        }

        public function insert_data()
        {
            $nama_karya     = $this->input->post('nama_karya');
            $karya          = $_FILES['karya']['name'];

                if($karya = ''){}else{
                    $config['upload_path']      = FCPATH. 'assets/uploads';
                    $config['allowed_types']    = 'jpg|jpeg|webp';

                        $this->load->library('upload',$config);

                        if(!$this->upload->do_upload('karya')){
                            echo "gambar gagal di upload". die();
                        }else{
                            $karya = $this->upload->data('file_name');
                        }
                }
                $data = array(
                    'nama_karya'    => $nama_karya,
                    'gambar'         => $karya,
                );

                $query = $this->db->insert('tb_karya',$data);
                return $query;

        }

        public function delete_karya($id)
        {
            $query = $this->db->delete('tb_karya', array('id_karya'=>$id));
            return $query;
        }

        public function tampil_galeri()
        {
            $query = $this->db->get('tb_galeri');
            return $query;
        }

        public function insert_galeri()
        {
            $nama_galeri    = $this->input->post('nama_galeri');
            $galeri         = $_FILES['galeri']['name'];

            if($galeri = ''){}else{
                $config['upload_path']      = FCPATH. 'assets/uploads';
                $config['allowed_types']    = 'jpg|jpeg|webp';

                    $this->load->library('upload',$config);
                    if(!$this->upload->do_upload('galeri')){
                        echo "gambar gagal di upload". die();
                    }else{
                        $galeri = $this->upload->data('file_name');
                    }
            }
            $data = array(
                'nama_galeri'   => $nama_galeri,
                'gambar'        => $galeri
            );

            $query = $this->db->insert('tb_galeri',$data);
            return $query;

        }

        public function delete_galeri($id)
        {
            $query = $this->db->delete('tb_galeri',array('id_galeri' => $id));
            return $query;
        }
                
        

    }

?>