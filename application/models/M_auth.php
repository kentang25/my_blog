<?php

    Class M_auth extends CI_Model{
        public function insert_data()
        {
            $username = $this->input->post('username');
            $password = password_hash($this->input->post('password'), PASSWORD_DEFAULT );

                $data = array(
                    'username'  => $username,
                    'password'  => $password
                );

                return $this->db->insert('tb_auth_admin',$data);
        }

        public function get_data($username,$password)
        {
            $query = $this->db->get_where('tb_auth_admin', array('username'=>$username));
            $admin = $query->row_array();

                if($admin && password_verify($password, $admin['username']));

                return $admin;
        }

        public function is_loggin()
        {
            if(!isset($_SESSION['is_loggedin'])){
                return FALSE;
            }else{
                return TRUE;
            }
        }
    }

?>