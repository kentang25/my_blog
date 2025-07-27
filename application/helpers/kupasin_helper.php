<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

function front_url($var=null){
    $ci =& get_instance();
    $url = site_url()."frontend".$var;
    return $url;
} 

function back_url($var=null){
    $ci =& get_instance();
    $url = site_url().$var;
    return $url;
} 