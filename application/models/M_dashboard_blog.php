<?php
	
	Class M_dashboard_blog extends CI_Model{

		public function tampil_data()
		{
			$query = $this->db->get('tb_dashboard_blog');
			return $query;
		}

		public function insert_data()
		{
			$about_blog = $this->input->post('about_blog');
$file_name = ''; // default jika tidak ada gambar

if (!empty($_FILES['gambar']['name'])) {
    $config['upload_path']   = FCPATH . 'assets/uploads/';
    $config['allowed_types'] = 'jpg|jpeg|webp|png';

    $this->load->library('upload', $config);

    if (!$this->upload->do_upload('gambar')) {
        echo $this->upload->display_errors(); // tampilkan error asli
        exit;
    } else {
        $file_name = $this->upload->data('file_name');
    }
}

$data = array(
    'gambar'      => $file_name,
    'about_blog'  => $about_blog
);

return $this->db->insert('tb_dashboard_blog', $data);
}

	}

?>