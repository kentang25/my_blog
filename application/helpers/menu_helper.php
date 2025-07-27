<?php 
   
    
function cekHakAkses($url,$group_id){
    $ci = & get_instance();
   
	$menu = $ci->db->where(array("url"=>$url))->get("sys_menu")->row();
	$role = $ci->db->where(array("id_menu"=>$menu->id,"group_id"=>$group_id))->get("sys_menu_role")->row();
	return $role;
}

