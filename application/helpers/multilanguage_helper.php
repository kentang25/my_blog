<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

   function _multibillingual() {
        $ci =& get_instance();
		$ci->load->language('menu',  _getCookie('bahasa'));
		$ci->session->unset_userdata("menuBahasa");
		$sesi	=array(
						'Bahasa'=>$ci->lang->line('Bahasa'),
						'DataMaster'=>$ci->lang->line('DataMaster'),
						'benderaEng'=>$ci->lang->line('benderaEng'),
						'benderaInd'=>$ci->lang->line('benderaInd'),
						'Admin'=>$ci->lang->line('Admin'),
						'DaftarAdmin'=>$ci->lang->line('DaftarAdmin'),
						'Tempat'=>$ci->lang->line('Tempat'),
						'Tutor'=>$ci->lang->line('Tutor'),
						'Kelas'=>$ci->lang->line('Kelas'),
					);
		$ci->session->set_userdata('menuBahasa',$sesi);
    }
    function _existCookie($name='bahasa')
    {
    	if (is_null(get_cookie($name))) {
		 return FALSE;
		}
		 return TRUE;
    }
    function _getCookie($name='bahasa')
    {
    	return get_cookie($name);
    }
    function _delCookie($name='bahasa')
    {
    	return delete_cookie($name);
    }
    function _setCookie($name='',$value='',$expire='3600',$domain='',$path='/',$prefix='',$secure=FALSE)
    {
		delete_cookie($name);
		$cookie=array(
			'name' => $name,
			'value' => $value,
			'expire' => $expire,
			'domain' => $domain,
			'path' => $path,
			'prefix' => $prefix,
			'secure' => $secure
		);
		return set_cookie($cookie);
    }