<?php 
    function path_template(){
        $ci             = & get_instance();
        $result 	    = $ci->template_lib->path_template();
        return $result;
    }

    function folder_template(){
        $ci             = & get_instance();
        $path_template 	= $ci->template_lib->path_template();
        $result 	    = base_url().'template/front/'.$path_template.'/';
        return $result;
    }

    function folder_template_admin(){
        $ci             = & get_instance();
        $result         = base_url().'template/backend/';
        return $result;
    }

    function path_template_admin(){
        $ci             = & get_instance();
        $result         = "admin/template";
        return $result;
    }

    function folder_template_member(){
        $ci             = & get_instance();
        $result         = base_url().'template/backend/';
        return $result;
    }

    function path_template_member(){
        $ci             = & get_instance();
        $result         = "member/template";
        return $result;
    }

    function folder_assets(){
        $ci             = & get_instance();
        $result 	    = base_url().'assets/';
        return $result;
    }
    
    function antiinjection($data){
        $filter_sql = stripslashes(strip_tags(htmlspecialchars($data,ENT_QUOTES)));
        return $filter_sql;
    }

    function hash_password($input_password){
        $hash = md5(sha1(KEY.$input_password));
        return $hash;
    }

	function clean_tag_input($str){
		$t = preg_replace('/<[^<|>]+?>/', '', htmlspecialchars_decode($str));
		$t = htmlentities($t, ENT_QUOTES, "UTF-8");
		$t = trim($t);
		return $t;
    }
    
	function encrypt_string($str) {
		$hasil = '';
		$kunci 	= KEY; // setting in config/constants
		for ($i = 0; $i < strlen($str); $i++) {
			$karakter 		= substr($str, $i, 1);
			$kuncikarakter 	= substr($kunci, ($i % strlen($kunci))-1, 1);
			$karakter 		= chr(ord($karakter)+ord($kuncikarakter));
			$hasil 			.= $karakter;
			
		}
		return urlencode(base64_encode($hasil));
	}
	 
	function decrypt_string($str) {
		$str = base64_decode(urldecode($str));
		$hasil = '';
		$kunci = KEY;
		for ($i = 0; $i < strlen($str); $i++) {
			$karakter = substr($str, $i, 1);
			$kuncikarakter = substr($kunci, ($i % strlen($kunci))-1, 1);
			$karakter = chr(ord($karakter)-ord($kuncikarakter));
			$hasil .= $karakter;
			
		}
		return $hasil;
    }

    function generateRandomString($length = 10) {
        $characters = '123456789ACEGJKLPRSTU';
        $charactersLength = strlen($characters);
        $randomString = '';
        for ($i = 0; $i < $length; $i++) {
            $randomString .= $characters[rand(0, $charactersLength - 1)];
        }
        return $randomString;
    }

    function date_to_save($tmpdate){
        $date    = substr($tmpdate, 3, 2);
        $month   = substr($tmpdate, 0, 2);
        $year    = substr($tmpdate, 6, 4);
        $newdate = $year."-".$month."-".$date;
        return $newdate;
    }

    function date_to_view($tmpdate){
        $date    = substr($tmpdate, 8, 2);
        $month   = substr($tmpdate, 5, 2);
        $year    = substr($tmpdate, 0, 4);
        $newdate = $month."/".$date."/".$year;
        return $newdate;
    }
    
    function data_setup_admin(){
        $ci             = & get_instance();
        $data_setup 	= $ci->get_value_data_setup();
        return $data_setup;
    }
    
    function dt_mdl_admin($user_role_id, $con_code){
        $ci             = & get_instance();
        $data_modul     = $ci->get_value_data_modul($user_role_id, $con_code);
        return $data_modul;
    }


    function dt_mdl_member($con_code){
        $ci             = & get_instance();
        $data_modul     = $ci->get_value_data_modul_member($con_code);
        return $data_modul;
    }

    function array_empty_remover($array, $remove_null_number = true) { //function Menghapus Nilai Array Yang Kosong
		$new_array = array();
		$null_exceptions = array();
		foreach ($array as $key => $value) {
			$value = trim($value);
			if($remove_null_number) {
				$null_exceptions[] = '0';
			}
			if(!in_array($value, $null_exceptions) && $value != "") {
				$new_array[$key] = $value;
			}
		}
		return $new_array;
    }
    
    function filter_col_tbl($dt_array){
        $jml = count($dt_array);
        $filter_item = "";
        $dt_column = 0;

        for($i=0; $i<$jml; $i++){
            $dt_column = $i + 1;
            $filter_item .= "&nbsp; <label> <input type='checkbox' class='toggle_vis' data_column='".$dt_column."' checked> &nbsp;".@$dt_array[$i]."</label>&nbsp;<br>";
        }
        $btn_filter = "<a class='btn btn-default btn-sm' data-toggle='dropdown' ><i class='fa fa-gear'></i>&nbsp; <span class='caret'></span></a><div class='dropdown-menu '><span class='form_filter '>".@$filter_item."</span></div>";
        return $btn_filter;
    }

    function save_filemng($text){
        $result_1 = str_replace("../../filemanager/../", "", $text);
        $result_2 = str_replace("../../", "", $result_1);
        $result_3 = str_replace("../", "", $result_2);
        $result_4 = str_replace("filemanager/../", "", $result_3);
        
        return $result_3; 
    }

    function view_filemng($text){
        $result = str_replace('assets/', folder_assets(), $text);
        return $result; 
    }

    function slug($text){
        // replace non letter or digits by -
        $text = preg_replace('~[^\\pL\d]+~u', '-', $text);
    
        // trim
        $text = trim($text, '-');
    
        // transliterate
        $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);
    
        // lowercase
        $text = strtolower($text);
    
        // remove unwanted characters
        $text = preg_replace('~[^-\w]+~', '', $text);
    
        if (empty($text))
        {
            return 'n-a';
        }
    
        return $text;
    }

    function GetMAC(){
        ob_start();
        system('getmac');
        $Content = ob_get_contents();
        ob_clean();
        return substr($Content, strpos($Content,'\\')-20, 17);
    }
    
    function getBrowser() { 
  $u_agent = $_SERVER['HTTP_USER_AGENT'];
  $bname = 'Unknown';
  $platform = 'Unknown';
  $version= "";
 //First get the platform?
  if (preg_match('/linux/i', $u_agent)) {
    $platform = 'linux';
  }elseif (preg_match('/macintosh|mac os x/i', $u_agent)) {
    $platform = 'mac';
  }elseif (preg_match('/windows|win32/i', $u_agent)) {
    $platform = 'windows';
  }

  // Next get the name of the useragent yes seperately and for good reason
  if(preg_match('/SEB/i',$u_agent)){
    $bname = 'Safe Exam Browser';
    $ub = "SEB";
    $allowed="Y";
  }else{
    $bname = 'Please download SEB (safe exam Browser)';
    $ub = "Not Allowed";
    $allowed="N";

  }

  // finally get the correct version number
  $known = array('Version', $ub, 'other');
  $pattern = '#(?<browser>' . join('|', $known) . ')[/ ]+(?<version>[0-9.|a-zA-Z.]*)#';
  if (!preg_match_all($pattern, $u_agent, $matches)) {
    // we have no matching number just continue
  }
  // see how many we have
  $i = count($matches['browser']);
  if ($i != 1) {
    //we will have two since we are not using 'other' argument yet
    //see if version is before or after the name
    if (strripos($u_agent,"Version") < strripos($u_agent,$ub)){
        $version= $matches['version'][0];
    }else {
        $version= $matches['version'][1];
    }
  }else {
    $version= $matches['version'][0];
  }

  // check if we have a number
  if ($version==null || $version=="") {$version="?";}

  return array(
    'userAgent' => $u_agent,
    'name'      => $bname,
    'version'   => $version,
    'platform'  => $platform,
    'pattern'    => $pattern,
    'allowed'    => $allowed
    
  );


   
} 
    
function cek_kewajiban($kd_dosen){
    $ci = & get_instance();
    $dosen = $ci->db->where(array("kd_dosen"=>$kd_dosen))->get("dosen")->row();

    if(($dosen->id_jenis_dosen==3) || ($dosen->id_jenis_dosen==4) ){
        return true;
    }else{
        return false;
    }
}

function cek_assesor($kd_dosen){
    $ci = & get_instance();
    $periode = $ci->db->where(array("aktif"=>"Y"))->get("periode")->row();

    $assesor = $ci->db->query("SELECT * FROM assesor_dosen WHERE id_periode='".$periode->id_periode."' AND (assesor1='".$kd_dosen."' OR assesor2='".$kd_dosen."') ")->num_rows();

    return $assesor;
}

function get_dosen($kd_dosen){
    $ci = & get_instance();
    $dosen = $ci->db->where(array("kd_dosen"=>$kd_dosen))->get("dosen")->row();
    return $dosen;
}

function get_code_auth($kode){
    $ci = & get_instance();
    $auth = $ci->db->where(array("kode"=>$kode))->get("sys_users")->row();
    return $auth;
}

function send_mail($email, $subject, $content){
   $CI =& get_instance();
    // Load PHPMailer library
    $CI->load->library('phpmailer_lib');

    // PHPMailer object
    $mail = $CI->phpmailer_lib->load();
    
    // SMTP configuration
    $mail->isSMTP();
    $mail->Host     = 'smtp.gmail.com';
    $mail->SMTPAuth = true;
    $mail->Username = 'dev.iainkediri@gmail.com';
    $mail->Password = 'xxjwtchqcqblszlf';
    $mail->SMTPSecure = 'ssl';
    $mail->Port     = 465;
    
    $mail->setFrom('dev.iainkediri@gmail.com', 'IAIN KEDIRI');
    $mail->addReplyTo('dev.iainkediri@gmail.com', 'IAIN KEDIRI');
    
    // Add a recipient
    $mail->addAddress($email);
            
    // Email subject
    $mail->Subject = $subject;
    
    // Set email format to HTML
    $mail->isHTML(true);
    
    // Email body content
    $mailContent = $content;
    $mail->Body = $mailContent;
    
    // Send email
    if(!$mail->send()){
        return true;
    }else{
        return true;
    }
}