<?php
function pagination_helper($base_url, $total_rows, $per_page, $uri_segment = 4)
{
    $ci =& get_instance();
    $ci->load->library('pagination');

    $config['base_url']    = $base_url;
    $config['total_rows']  = $total_rows;
    $config['per_page']    = $per_page;
    $config['uri_segment'] = $uri_segment;

    // Tambahkan ini untuk Bootstrap
    $config['attributes'] = ['class' => 'page-link'];

    $config['full_tag_open'] = '<nav><ul class="pagination justify-content-center">';
    $config['full_tag_close'] = '</ul></nav>';

    $config['first_link'] = 'First';
    $config['first_tag_open'] = '<li class="page-item">';
    $config['first_tag_close'] = '</li>';

    $config['last_link'] = 'Last';
    $config['last_tag_open'] = '<li class="page-item">';
    $config['last_tag_close'] = '</li>';

    $config['next_link'] = '&raquo;';
    $config['next_tag_open'] = '<li class="page-item">';
    $config['next_tag_close'] = '</li>';

    $config['prev_link'] = '&laquo;';
    $config['prev_tag_open'] = '<li class="page-item">';
    $config['prev_tag_close'] = '</li>';

    $config['cur_tag_open'] = '<li class="page-item active"><a class="page-link" href="#">';
    $config['cur_tag_close'] = '</a></li>';

    $config['num_tag_open'] = '<li class="page-item">';
    $config['num_tag_close'] = '</li>';

    $ci->pagination->initialize($config);
    return $ci->pagination->create_links();
}

?>