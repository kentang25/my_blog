<?php 



function tgl_indo($date) { // fungsi atau method untuk mengubah tanggal ke format indonesia
   // variabel BulanIndo merupakan variabel array yang menyimpan nama-nama bulan
    $BulanIndo = array("Januari", "Februari", "Maret",
               "April", "Mei", "Juni",
               "Juli", "Agustus", "September",
               "Oktober", "November", "Desember");
  
    $tahun = substr($date, 0, 4); // memisahkan format tahun menggunakan substring
    $bulan = substr($date, 5, 2); // memisahkan format bulan menggunakan substring
    $tgl   = substr($date, 8, 2); // memisahkan format tanggal menggunakan substring
    
    $result = $tgl . " " . $BulanIndo[(int)$bulan-1] . " ". $tahun;
    return($result);
}

//url parsing
function parse_path() {
  $path = array();
  if (isset($_SERVER['REQUEST_URI'])) {
    $request_path = explode('?', $_SERVER['REQUEST_URI']);

    $path['base'] = rtrim(dirname($_SERVER['SCRIPT_NAME']), '\/');
 
    $path['call_utf8'] = substr(urldecode($request_path[0]), strlen($path['base']) + 1);
   
    $path['call'] = utf8_decode($path['call_utf8']);
    // var_dump(basename($_SERVER['PHP_SELF']));
    // exit();
    // if ($path['call'] == basename($_SERVER['PHP_SELF'])) {
    //   $path['call'] = '';
    // }
    $path['call_parts'] = explode('/', $path['call']);
    // var_dump( $path);
    // exit();
    if ($request_path[0]='') {
      $path['query_utf8'] = urldecode($request_path[1]);
       $path['query'] = utf8_decode(urldecode($request_path[1]));
    $vars = explode('&', $path['query']);
    foreach ($vars as $var) {
      $t = explode('=', $var);
      $path['query_vars'][$t[0]] = $t[1];
    }
    }
   
   
  }
return $path;
}
  
function path_url(){
  $path = parse_path();
  $path_url = $path['call_parts'];
  return $path_url;
}

function path_act(){
   $path = parse_path();
    $path_url = $path['call_parts'][0];

    //second path
    $path_act = (isset($path['call_parts'][1]))?$path['call_parts'][1]:'';
    return $path_act;
}

function path_id(){
   $path = parse_path();
    $path_url = $path['call_parts'][0];

    //second path
    $path_id = (isset($path['call_parts'][1]))?$path['call_parts'][1]:'';
    return $path_id;
}

function role_user(){
   $CI =& get_instance();
    $CI->load->library('Dbpdo');

    $path = parse_path();
    $path_url = $path['call_parts'][0];

    //simpan role url page user di array sesuai login session level
    $role_user=array();
    foreach ($CI->dbpdo->fetch_custom("select sys_menu.url from sys_menu inner join sys_menu_role on sys_menu.id=sys_menu_role.id_menu
        where sys_menu_role.group_id=? and sys_menu_role.read_act=?",array('sys_menu_role.group_id'=>$_SESSION['level'],'sys_menu_role.read_act'=>'Y')) as $role) {
      $role_user[]=$role->url;
    }

    return $role_user;
}

function role_act(){
    $CI =& get_instance();
    $CI->load->library('Dbpdo');

    $path = parse_path();
    $path_url = $path['call_parts'][0];

    //simpan role url page user di array sesuai login session level
    $role_act=array();

    //lebih detail detil crud role user
    foreach ($CI->dbpdo->fetch_custom("select read_act,insert_act,update_act,delete_act from sys_menu inner join sys_menu_role on sys_menu.id=sys_menu_role.id_menu where sys_menu_role.group_id=? and sys_menu.url=?",array('sys_menu_role.group_id'=>$_SESSION['level'],'sys_menu.url'=>$path_url)) as $role) {
      $role_act['up_act']=$role->update_act;
      $role_act['insert_act']=$role->insert_act;
      $role_act['del_act']=$role->delete_act;
    }
    //  var_dump($path);
    // exit();

    return $role_act;
}

//first url path
function rolepath(){
  $CI =& get_instance();
  $CI->load->library('Dbpdo');

  $path = parse_path();
  $path_url = $path['call_parts'][1];

  //simpan role url page user di array sesuai login session level
    $role_user=array();
    $role_act=array();
  foreach ($CI->dbpdo->fetch_custom("select sys_menu.url from sys_menu inner join sys_menu_role on sys_menu.id=sys_menu_role.id_menu
      where sys_menu_role.group_id=? and sys_menu_role.read_act=?",array('sys_menu_role.group_id'=>$_SESSION['level'],'sys_menu_role.read_act'=>'Y')) as $role) {
    $role_user[]=$role->url;
  }
  //lebih detail detil crud role user
  foreach ($CI->dbpdo->fetch_custom("select read_act,insert_act,update_act,delete_act from sys_menu inner join sys_menu_role on sys_menu.id=sys_menu_role.id_menu where sys_menu_role.group_id=? and sys_menu.url=?",array('sys_menu_role.group_id'=>$_SESSION['level'],'sys_menu.url'=>$path_url)) as $role) {
    $role_act['up_act']=$role->update_act;
    $role_act['insert_act']=$role->insert_act;
    $role_act['del_act']=$role->delete_act;
  }
}

//obj to array
function toArray($obj)
{
    if (is_object($obj)) $obj = (array)$obj;
    if (is_array($obj)) {
        $new = array();
        foreach ($obj as $key => $val) {
            $new[$key] = toArray($val);
        }
    } else {
        $new = $obj;
    }

    return $new;
}

function base_admin(){
  return site_url();
}
function base_index(){
  return base_url();
}


function isLogin() {
    $CI =& get_instance();

    $login = $CI->session->userdata('login');
    if ($login != 1 ) {
      redirect(base_url('/'), 'refresh');
      die();
    }
  }
?>