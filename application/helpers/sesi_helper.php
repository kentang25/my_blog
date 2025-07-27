<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

function _islogin($flag=null)
{
  $ci =& get_instance();
  $level = (isset($ci->session->userdata('sesiLogin')->level))?$ci->session->userdata('sesiLogin')->level:null; ;
  if ($level==null) {
    if (strtolower($ci->uri->segment(1)) != "login") {
      redirect('login','refresh');
    }
  }else{
    if (strtolower($ci->uri->segment(1)) != "dashboard") {
      return false;
    }
  }
}
function _isMenu()
{
  $menu = _isSesi("menu");
  $data =  json_decode($menu);
  $showMenu="";
    foreach ($data as $key => $level1) {
      if (!isset($level1->children)) {
        $showMenu .= '<li class=""><a href="'.back_url($level1->url).'"><i class="'.$level1->icon.'"></i> <span>'.$level1->nama.'</span></a></li>';
      }else{
        $showMenu .= '<li class=""><a href="#"><i class="'.$level1->icon.'"></i> <span>'.$level1->nama.'</span></a>';
        $showMenu .= '<ul>';
        foreach ($level1->children as $key => $level2) {
          if($level2->description=="menu"){
            if (!isset($level2->children)) {
                $showMenu .= '<li class=""><a href="'.back_url($level2->url).'"><i class="'.$level2->icon.'"></i> <span>'.$level2->nama.'</span></a></li>';
            }else{
                $showMenu .= '<li class=""><a href="#"><i class="'.$level2->icon.'"></i> <span>'.$level2->nama.'</span></a>';
                $showMenu .= '<ul>';
                foreach ($level2->children as $key => $level3) {
                  if($level3->description=="menu"){
                    if (!isset($level3->children)) {
                        $showMenu .= '<li class=""><a href="'.back_url($level3->url).'"><i class="'.$level3->icon.'"></i> <span>'.$level3->nama.'</span></a></li>';
                    }else{
                        $showMenu .= '<li class=""><a href="#"><i class="'.$level3->icon.'"></i> <span>'.$level3->nama.'</span></a>';
                        $showMenu .= '<ul>';
                        foreach ($level3->children as $key => $level4) {
                          if($level4->description=="menu"){
                            if (!isset($level4->children)) {
                                  $showMenu .= '<li class=""><a href="'.back_url($level4->url).'"><i class="'.$level4->icon.'"></i> <span>'.$level4->nama.'</span></a></li>';
                              }else{
                                  $showMenu .= '<li class=""><a href="'.back_url($level4->url).'"><i class="'.$level4->icon.'"></i> <span>'.$level4->nama.'</span></a></li>';
                              }
                            }
                          }
                        $showMenu .= '</ul>';
                        $showMenu .= '</li>';
                    }
                  }
                  }
                $showMenu .= '</ul>';
                $showMenu .= '</li>';
            }
          }
          }
          $showMenu .= '</ul>';
          $showMenu .= '</li>';
      }
    }

  return $showMenu ;
}
function _isSesi($param=null)
{
  $ci =& get_instance();
  if ($param==null) {
    $param = $ci->session->userdata();
    return $param;
  }
  $param = $ci->session->userdata('sesiLogin')->$param;
  return $param;
}
function _setpage($page=''){
  $ci =& get_instance();
  $ci->session->unset_userdata('page');
  $array = array(
    'page' => $page
  );
  $ci->session->set_userdata( $array );
}

function _aDel($menu="",$url=""){
  $ci =& get_instance();
  $level = $ci->session->userdata('sesiLogin')->level;
  $previllage = $ci->db->get_where("permission_role",array('role_id' => $level,'permission_id' => $menu))->num_rows();
  $delete ="onclick=\"return confirm('Anda Yakin Menghapus Data')\"";
  $link = '<a ' . $delete . ' href="'.site_url($url).'" class="btn btn-outline bg-danger border-primary  btn-icon border-2 ml-2"><i class="icon-trash"></i></a>';
  $akses = ($previllage!=0)?"$link":"";
  $akses = ($menu==0)?"$link":$akses;
  return $akses;
}
function _aUpdate($menu="",$url=""){
  $ci =& get_instance();
  $level = $ci->session->userdata('sesiLogin')->level;
  $previllage = $ci->db->get_where("permission_role",array('role_id' => $level,'permission_id' => $menu))->num_rows();
  $link = '<a href="'.site_url($url).'" class="btn btn-outline bg-primary border-primary  btn-icon border-2 ml-2"><i class="icon-pencil"></i></a>';
  $akses = ($previllage!=0)?"$link":"";
  $akses = ($menu==0)?"$link":$akses;

  return $akses;
}
function _aBtn($menu="",$url="",$text=""){
  $ci =& get_instance();
  $level = $ci->session->userdata('sesiLogin')->level;
  $previllage = $ci->db->get_where("permission_role",array('role_id' => $level,'permission_id' => $menu))->num_rows();
  $link = '<a href="'.($url).'" class="btn btn-outline bg-success border-success  btn-icon border-2 ml-2">'.$text.'</a>';
  $akses = ($previllage!=0)?"$link":"";
  $akses = ($menu==0)?"$link":$akses;
  
  return $akses;
}
function _aBack($text="Kembali"){
  $ci =& get_instance();
  $refer =  $ci->agent->referrer();
  $link = '<a href="'.($refer).'" class="btn btn-outline bg-info border-info  btn-icon border-2 ml-2">'.$text.'</a>';
  return $link;
}
function _aLinkBack(){
  $ci =& get_instance();
  $refer =  $ci->agent->referrer();
  return $refer;
}
// Button Menu Header
function _aBtnHeader($menu=""){
  $ci =& get_instance();
  $level = $ci->session->userdata('sesiLogin')->level;
  $previllage =
  $ci->db->select('*')
  ->from('permission_role as t1')
  ->where(array('t1.role_id' => $level,'t1.permission_id' => $menu))
  ->join('permission as t2', 't2.id = t1.permission_id')
  ->get()->result();
  // _lastQuery($previllage);
  $link="";
  if (count($previllage)>0) {
    $objPre = $previllage[0];
    $link = '<a href="'.site_url($objPre->url).'" class="btn btn-link btn-float text-size-small has-text"><i class="'.$objPre->icon .' '.$objPre->warna.'"></i><span>'.$objPre->permission_name.'</span></a>';
  }
  $akses = (count($previllage)==1)?"$link":"";
  $akses = ($menu==0)?"$link":$akses;
  return $akses;
}
// link
function _aLink($menu="",$url="",$text=""){
  $ci =& get_instance();
  $level = $ci->session->userdata('sesiLogin')->level;
  $previllage = $ci->db->get_where("permission_role",array('role_id' => $level,'permission_id' => $menu))->num_rows();

  $link = '<a href="'.site_url($url).'" class="text-size-small has-text">'.$text.'</a>';
  $akses = ($previllage!=0)?"$link":"";
  $akses = ($menu==0)?"$link":$akses;

  return $akses;
}
//Modal
function _aModal($menu="",$modal="",$icon="",$background="success"){
  $ci =& get_instance();
  $level = $ci->session->userdata('sesiLogin')->level;
  $previllage = $ci->db->get_where("permission_role",array('role_id' => $level,'permission_id' => $menu))->num_rows();
  $link = '<a data-toggle="modal" href="#' . $modal.'" class="btn btn-outline bg-'.$background.' border-success  btn-icon border-2 ml-2"><i class="icon-'.$icon.'"></i></a>';
  $akses = ($previllage!=0)?"$link":"";
  $akses = ($menu==0)?"$link":$akses;

  return $akses;
}
//ModalAction
// function _aModalAction($menu="",$id="",$icon="",$text="",$background="success"){
//     $ci =& get_instance();
//     $level = $ci->session->userdata('sesiLogin')->level;
//     $previllage = $ci->db->get_where("permission_role",array('role_id' => $level,'permission_id' => $menu))->num_rows();
//     $link = '<a id="'.$id.'" href="#" class="btn btn-outline bg-'.$background.' border-success  btn-icon border-2 ml-2"><i class="icon-'.$icon.'"></i>'.$text.'</a>';
//     $akses = ($previllage!=0)?"$link":"";
//     $akses = ($menu==0)?"$link":$akses;

//     return $akses;
// }
//menu Table
function _aMenuTable($menu="",$url="",$text="",$icon="icon-diff-added",$target=false,$classJs="",$arrData=array()){
  $ci =& get_instance();
  $target = ($target==true)?'target="_blank"':'';
  $level = $ci->session->userdata('sesiLogin')->level;
  $previllage = $ci->db->get_where("permission_role",array('role_id' => $level,'permission_id' => $menu))->num_rows();

  $attrData = "";
  foreach ($arrData as $key => $value) {
    $attrData .= $key."=\"".$value ."\" ";
  }
  $link = '<li><a class="'.$classJs.'" '.$target.' '.$attrData.' href="'.$url.'"><b><i class="'.$icon.'"></i></b> '.$text.'</a></li>';
  $akses = ($previllage!=0)?"$link":"";
  $akses = ($menu==0)?"$link":$akses;

  return $akses;
}
//btnHeading Card
function _aBtnIcon($menu="",$url="",$text="",$icon="icon-diff-added",$bgColor="bg-blue-800"){
  $ci =& get_instance();
  $level = $ci->session->userdata('sesiLogin')->level;
  $previllage = $ci->db->get_where("permission_role",array('role_id' => $level,'permission_id' => $menu))->num_rows();
  $link = '<a href="'.$url.'" class="btn '.$bgColor.' btn-xs legitRipple  btn-icon "><b><i class="'.$icon.'"></i></b> '.$text.'</a>';
  $akses = ($previllage!=0)?"$link":"";
  $akses = ($menu==0)?"$link":$akses;

  return $akses;
}
//_aModalAction
function _aModalAction($menu="",$classAction="modal_add",$arrData=array(),$text="",$icon="diff-added",$bgColor="bg-blue-800"){
  $ci =& get_instance();
  $level = $ci->session->userdata('sesiLogin')->level;
  $previllage = $ci->db->get_where("permission_role",array('role_id' => $level,'permission_id' => $menu))->num_rows();
  $attrData = "";
  foreach ($arrData as $key => $value) {
    $attrData .= $key."='".$value ."' ";
  }
  $link = '<button '.$attrData.' href="#" class="'.$classAction.' btn '.$bgColor.' border-top-primary btn-xs legitRipple  btn-icon "> '.$text.' <i class="icon-'.$icon.'"></i></button>';


  $akses = ($previllage!=0)?"$link":"";
  $akses = ($menu==0)?"$link":$akses;

  return $akses;
}
function _input($icon='icon-office', $nama="nama_spot",$placeholder="Masukkan",$value="", $editable=false)
{
  $readonly = '';
  if ($editable==false) {
    $readonly = 'readonly';
  }
  $input ='<div class="form-group">
  <div class="input-group input-group-xlg">
  <span class="input-group-addon"><i class="text-orange-800 '.$icon.'"></i></span>
  <input '.$readonly.' value="'.$value.'" id="'.$nama.'" name="'.$nama.'" placeholder="'.$placeholder.'" type="text" class="form-control">
  </div>
  </div>';
  return $input;
}
function _textArea($icon='icon-office', $nama="nama_spot",$placeholder="Masukkan",$value="", $editable=false)
{
  $readonly = '';
  if ($editable==false) {
    $readonly = 'readonly';
  }
  $input ='<div class="form-group">
  <div class="input-group">
  <span class="input-group-addon"><i class="text-orange-800 '.$icon.'"></i></span>
  <textarea '.$readonly.' id="'.$nama.'" name="'.$nama.'" placeholder="'.$placeholder.'" class="form-control">'.$value.'</textarea>
  </div>
  </div>';
  return $input;
}
