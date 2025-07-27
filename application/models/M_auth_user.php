<?php

    Class M_auth_user extends CI_Model{

        public function insert_data_user()
        {
            $username   = $this->input->post('username');
            $email      = $this->input->post('email');
            $password   = password_hash($this->input->post('password'), PASSWORD_DEFAULT);

                $data = array(
                    'username'  => $username,
                    'email'     => $email,
                    'password'  => $password
                );

            $query = $this->db->insert('tb_auth_user',$data);
            return $query;
        }

        public function get_user($username,$password)
        {
            $query  = $this->db->get_where('tb_auth_user',array('username'=>$username));
            $user   = $query->row_array();

                if($user && password_verify($password,$user['password']));
                return $user;
        }

        public function get_id_user()
        {
            return $this->session->userdata('id_user');
        }

        public function loggin()
        {
            if(!isset($_SESSION['is_loggin'])){
                return FALSE;
            }else{
                return TRUE;
            }
        }

    }

?>