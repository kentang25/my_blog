<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

 function initGmaps($lat=LATITUDE, $long=LONGITUDE,$draggable=true){
    $ci =& get_instance();
    $ci->load->library('googlemaps');
    $config['zoom'] = 'auto';
    $config['center'] = LONGITUDE.",".LATITUDE;

    $ci->googlemaps->initialize($config);

    $marker = array();
    $marker['position'] = $lat.','.$long;
    $marker['draggable'] = $draggable;
    $marker['ondragend'] = '$(\'#latitude\').val(event.latLng.lat());$(\'#longitude\').val(event.latLng.lng())';


    $ci->googlemaps->add_marker($marker);
  }