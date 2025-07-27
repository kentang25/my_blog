<?php defined('BASEPATH') or exit('maaf akses anda kita tutup');

function getMenu()
{
	$ci = &get_instance();
	$ci->load->database();
	$userid = $ci->session->userdata('level');
	$where = array('a.fc_userid' => $userid, 'b.isActive' => '1', "b.idParent" => '0');
	$query = $ci->db->select("a.*,b.idMenu,b.idParent,b.namaMenu,b.descMenu,b.link,b.icon,b.ordering,(select count(z.idParent) from t_menu z where z.idParent=b.idMenu) as member")
		->from('t_hakakses a')
		->join('t_menu b', 'b.idMenu=a.fc_idmenu')
		->where($where)
		->order_by('b.ordering', 'asc')
		->get();
	return $query;
}
function getSubmenu()
{
	$ci = &get_instance();
	$ci->load->database();
	$userid = $ci->session->userdata('level');
	$where = array('a.fc_userid' => $userid, 'b.isActive' => '1', "b.idParent != " => '0');
	$query = $ci->db->select("a.*,b.idParent,b.namaMenu,b.descMenu,b.link,b.icon,b.ordering")
		->from('t_hakakses a')
		->join('t_menu b', 'b.idMenu=a.fc_idmenu')
		->where($where)
		->order_by('b.ordering', 'asc')
		->get();
	return $query;
}
function upload($data, $name = '', $resize = false, $debug = false)
{
	$out = array('message' => '', 'is_upload' => 0, 'is_resize' => 0);
	$ci = &get_instance();
	$config['upload_path']          = './assets/foto/';
	$config['allowed_types']        = 'gif|jpg|png|jpeg|bmp';
	//$config['remove_space']		= true;
	$config['max_size']             = 9999; // 10mb
	if ($name != '') {
		$config['file_name']	= $name;
	}
	$ci->load->library('upload', $config);
	if ($ci->upload->do_upload($data)) {
		$out['is_upload'] = 1;
		if ($resize == true) {
			$imagedata = $ci->upload->data();
			list($width, $height) = getimagesize($imagedata['full_path']);
			$config2['image_library'] = 'gd2';
			$config2['source_image'] = $imagedata['full_path'];
			$config2['maintain_ratio'] = false;
			$config2['width'] = 900;
			$config2['height'] = 900;
			$ci->load->library('image_lib');
			$ci->image_lib->initialize($config2);
			if ($ci->image_lib->resize()) {
				$out['is_resize'] = 1;
			} else {
				$out['message'] = $ci->image_lib->display_errors();
			}
			$ci->image_lib->clear();
		}
	} else {
		$out['message'] = $ci->upload->display_errors();
	}
	if ($debug == true) {
		return json_encode($out);
	}
}
function buat_form($data, $buttons = array())
{
	$inputan_data = "";
	foreach ($data as $key => $value) {
		$input =  $value;
		$readonly = "";
		$input_grup = "";
		$class_data = "";
		if (!empty($input['readonly'])) {
			$readonly = 'readonly';
		} else {
			$readonly = "";
		}

		if (!empty($input['input_search'])) {
			$class_data = "input-group";
			$input_grup = '<span class="input-group-btn"> <button type="button" id="btn_cari" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg"><i class="fa fa-search"></i></button></span>';
		} else {
			$class_data = "";
			$input_grup = "";
		}

		if ($input['type'] == "text" || $input['type'] == 'number' || $input['type'] == 'date') {
			$val = "";
			if ($input['type'] == 'text' || $input['type'] == 'number') {
				($input['defaultValue'] != '') ? $val = $input['defaultValue'] : $val = "";
			} else
		  		if ($input['type'] == 'date') {
				$val = date('Y-m-d');
			}
			$type = '<input type="' . $input['type'] . '" class="' . $input['class'] . '" id="' . $input['name'] . '" name="' . $input['name'] . '" ' . $readonly . ' value="' . $val . '">' . $input_grup;
		} else
		  	if ($input['type'] == "file") {
			$val = "";
			$type = '<input type="' . $input['type'] . '" class="' . $input['class'] . '" id="' . $input['name'] . '" name="' . $input['name'] . '" ' . $readonly . ' value="' . $val . '">
					<img src="" id="pict_detail_img" width="400px" style="display: none;">
		  		';
		} else if ($input['type'] == 'hidden') {
			$type = '<input type="' . $input['type'] . '" id="' . $input['name'] . '" name="' . $input['name'] . '">';
		} else if ($input['type'] == 'option') {
			$isian = "";
			$total_arr = count($input['option']);
			foreach ($input['option'] as $key => $value) {
				$isian .= '<option value="' . $key . '">' . $value . '</option>';
			}
			$type = '<select class="' . $input['class'] . '" name="' . $input['name'] . '" id="' . $input['name'] . '" ' . $readonly . '>' . $isian . '</select>';
		} else {
			$type = "";
		}

		if ($input['type'] == 'hidden') {
			$inputan_data .= $type;
		} else {
			$inputan_data .= '
				<div class="form-group">
		            <label class="control-label col-sm-2" for="' . $input['name'] . '">' . $input['label'] . '</label>
		            <div class="' . $input['col'] . ' ' . $class_data . '">
		              	' . $type . '
		            </div>
		        </div>
			  	';
		}
	}
	// make default if no input array button
	if (count($buttons) == 0) {
		$button = '<div class="ln_solid"></div>
						  <div class="form-group" id="button_action">
							<div class="col-md-9 col-sm-9 col-xs-12">
							  <button type="reset" class="btn btn-danger">Reset</button> 
							  <button type="submit" class="btn btn-success">Simpan</button>
							</div>
						  </div>';
	} else {
		$button = "<div class=\"ln_solid\"></div>\n
							<div class=\"form-group\" id=\"button_action\">\n
								<div class=\"col-md-9 col-sm-9 col-xs-12\">\n";
		$idbtn = '';
		foreach ($buttons as $btn) {
			($btn['id'] != '') ? ($idbtn = "id=\"$btn[id]\"") : ($idbtn = "");
			$button .= "<button $idbtn type=\"" . $btn['type'] . "\" class=\"" . $btn['class'] . "\">" . $btn['label'] . "</button>\n";
		}
		$button .= "</div>\n
					</div>";
	}
	echo $inputan_data . $button;
}
function buat_table($kolom, $id)
{
	$kode_table = "";
	if (!empty($id)) {
		$kode_table = $id;
	} else {
		$kode_table = "datatable";
	}
	$kolomnya = "";
	for ($i = 0; $i < count($kolom); $i++) {
		$kolomnya .= "<th>" . $kolom[$i] . "</th>";
	}
	$table = '
			<table id="' . $kode_table . '" class="table table-striped table-bordered" cellspacing="0" width="100%">
				<thead>
				<tr>
				    ' . $kolomnya . '
				</tr>
				</thead> 
				<tfoot>
					<tr>
					    ' . $kolomnya . '
					</tr>
				</tfoot>  
			</table>
		';
	echo $table;
}
function getAkses($link)
{
	$ci = &get_instance();
	$ci->load->database();
	$userid = "";
	$input = "";
	$update = "";
	$delete = "";
	$view = "";
	$userid = $ci->session->userdata('level');
	$where = array('a.fc_userid' => $userid, 'fc_hold' => '0');
	$query = $ci->db->select('a.fc_input,a.fc_update,a.fc_delete,a.fc_view')
		->from('t_hakakses a')
		->join('t_menu b', 'b.fc_id=a.fc_idmenu', 'left')
		->where($where)
		->like('trim(b.fc_link)', str_replace(' ', '', $link))
		->get();
	foreach ($query->result() as $key) {
		$input = $key->fc_input;
		$update = $key->fc_update;
		$delete = $key->fc_delete;
		$view   = $key->fc_view;
	}
	$data = array($input, $update, $delete, $view);
	return $data;
}

/**
 * mendapatkan nomor otomatis dari tabel t_nomor
 * jangan lupa untuk memanggil fungsi updateNomor
 */
function getNomor($document)
{
	$ci = &get_instance();
	$ci->load->database();
	$nomor = "";
	$query = $ci->db->where("fc_param", $document)->get('t_nomor');
	if ($query->num_rows() > 0) {
		foreach ($query->result() as $row) {
			$nomor_urut = $row->fc_prefix . str_pad($row->fn_nomor, $row->fn_long, "0", STR_PAD_LEFT) . $row->fc_sufix;
		}
		$nomor = $nomor_urut;
	} else {
		$nomor = "";
	}
	return $nomor;
}
/**
 * digunakan untuk menambah nilai dari nomor, 
 * agar bisa digunakan untuk penomoran selanjutnya
 */
function updateNomor($document)
{
	$ci = &get_instance();
	$ci->load->database();
	$query = $ci->db->query("update t_nomor set fn_nomor=fn_nomor+1 where fc_param='" . $document . "'");
}
function encryptPass($pass)
{
	$ci = &get_instance();
	$ci->load->database();
	$sql = "SELECT SUBSTR(MD5(CONCAT(SUBSTR(MD5(?),1,16),(select fv_value from t_setup where fc_param = 'KEY_SA'))),1,15) COLLATE utf8_general_ci as data";
	$query = $ci->db->query($sql, array($pass));
	foreach ($query->result() as $row) {
		$hasil = $row->data;
	}
	return $hasil;
}
// function hash_password($words, $alt = '', $method = 1)
// {
// 	$hasil = '';
// 	$alt = ($alt == '' ) ? getSetup('KEY_SA') : $alt ;
// 	$combine = $alt . reverseIt( $words ) . $alt;
// 	switch ($method) {
// 		case 0: {
// 				for ($k = 0; $k < count($words); $k++) {
// 					$id = $words;
// 					$g1 = md5($id[$k]);
// 					$g2 = substr($g1, 0, 9);
// 					$g2a = substr($g2, 1, 4);
// 					$g2b = substr($g2, 0, 1);
// 					$g2c = substr($g2, 8, 1);
// 					$g2d = substr($g2, 5, 4);
// 					$gen = $g2a . $g2b . $g2c . $g2d;
// 					$pw = $id[$k] . $gen;
// 					$enc = md5($pw);
// 				}
// 				$hasil = @$enc;
// 			}
// 			break;
// 		case 1:
// 			$hasil = hash('md5', $combine);
// 			break;
// 		case 2:
// 			$hasil = hash('sha1', $combine);
// 			break;
// 		case 3:
// 			$hasil = hash('sha256', $combine);
// 			break;
// 		case 4:
// 			$hasil = hash('sha384', $combine);
// 			break;
// 		case 5:
// 			$hasil = hash('sha512', $combine);
// 			break;
// 		case 6:
// 			$hasil = hash('whirlpool', $combine);
// 			break;
// 		default:
// 			$hasil = '';
// 			break;
// 	}
// 	return $hasil;
// }
// fungsi ini support utf-8 encoding, Human Language, and Character Encoding Support :)
// i think better than strrev() function,
function reverseIt($str){
    $r = '';
    for ($i = mb_strlen($str); $i>=0; $i--) {
        $r .= mb_substr($str, $i, 1);
    }
    return $r;
}

function format_tanggal_indo($tanggalan)
{
	return date("d-m-Y", strtotime($tanggalan));
}
function insertKartuStock($branch, $wh, $fc_stock, $fc_variant, $fc_uom, $fn_in = 0, $fn_out = 0, $referensi, $fc_ket, $userid)
{
	$ci = &get_instance();
	$ci->load->database();
	$data = array(
		'fc_branch'		=> $branch,
		'fc_wh'			=> $wh,
		'fc_stock'		=> $fc_stock,
		'fc_variant'	=> $fc_variant,
		'fc_uom'		=> $fc_uom,
		'fn_in'			=> $fn_in,
		'fn_out'		=> $fn_out,
		'fc_referensi'	=> $referensi,
		'fc_userid'		=> $userid,
		'fc_ket'		=> $fc_ket
	);
	$query = $ci->db->insert('t_kartustock', $data);
	return $ci->db->affected_rows();
}


// START ETC METHOD ---------------------------------------------------------------------
	/*
	* mengecek login atau belum
	 */
	function is_logged()
	{
		$ci = &get_instance();
		$login = $ci->session->userdata('code_user');
		$level_user = $ci->session->userdata('level_user');
	  	if ($level_user != "admin") {
			$ci->session->sess_destroy();
	  		redirect(base_url('auth'));
	  	}
	}

	function is_logged_user()
	{
		$ci = &get_instance();
		$level_user = $ci->session->userdata('level_user');
	  	if ($level_user != "unit") {
			$ci->session->sess_destroy();
	  		redirect(base_url('auth'));
	  	}	  	
	}

	function is_logged_auditor()
	{
		$ci = &get_instance();
		$login = $ci->session->userdata('level_user');
	  	if ($login != "auditor") {
			$ci->session->sess_destroy();
	  		redirect(base_url('auth'));
	  	}
	}

	function is_logged_auditee()
	{
		$ci = &get_instance();
		$login = $ci->session->userdata('level_user');
	  	if ($login != "auditee") {
			$ci->session->sess_destroy();
	  		redirect(base_url('auth'));
	  	}
	}

	function is_authenticate()
	{
		$ci = &get_instance();
		$login = $ci->session->userdata('level_user');
	  	if (!$login) {
			$ci->session->sess_destroy();
	  		redirect(base_url('auth'));
	  	}
	}
	/*
	 * mempersingkat script load view
	 * @page = lokasi halaman yang mau di load
	 * @data = data yang mau dilewatkan ke view
	 * @opt  = opsional, untuk menampilkan datatable, atau yang lain
	 */
function loadView($pages = 'v_view', $data = null, $opt = 0, $fot = 0)
{
	$ci = &get_instance();
	$ci->load->view('Template/header', $data);	
	if (is_array($pages)) {
		foreach ($pages as $page) {
			$ci->load->view($page, $data);
		}
	} else {
		$ci->load->view($pages, $data);
	}	
	$ci->load->view('Template/footer', $data);
}
/*
	 * fungsi ini harus panggil setelah proses userid dimasukan kesession
	 */
function resetMenuSession($data = array('menu', 'submenu'))
{
	$ci = &get_instance();
	$ci->load->library('session');
	$ci->session->unset_userdata($data);
	$menu = getMenu();
	$submenu = getSubmenu();
	$data_menu = array(
		'menu'		=> $menu->result(),
		'submenu'	=> $submenu->result()
	);
	$ci->session->set_userdata($data_menu);
}
/**
 * membuat tombol action dinamis
 */
function getButtonAction($lists = array(), $options = array())
{
	// make default parameter
	$btn_title		= (array_key_exists('title', $options)) ? $options['title'] : 'Aksi';
	$btn_class		= (array_key_exists('class', $options)) ? $options['class'] : 'btn-primary btn-sm';

	$result  = "<div class='x_content'>\n";
	$result .= "<div class='btn-group'>\n";
	$result .= "<button data-toggle='dropdown' class='btn dropdown-toggle $btn_class' type='button' aria-expanded='false'>$btn_title <span class='caret'></span></button>\n";
	$result .= "<ul role='menu' class='dropdown-menu'>\n";
	/**
	 * $lists = array(
	 * 	'key'	=> array('title' => 'button title','action'=>'button action','visible'=> 'how button should appear','type'=>'button or divider')
	 * );
	 */
	foreach ($lists as $key => $list_attr) {
		// make default parameter
		$list_title		= (array_key_exists('title', $list_attr)) ? $list_attr['title'] : 'tombol';
		$list_action	= (array_key_exists('action', $list_attr)) ? $list_attr['action'] : 'alert(\'hello world!\')';
		$list_visible	= (array_key_exists('visible', $list_attr)) ? $list_attr['visible'] : '0';
		$list_type		= (array_key_exists('type', $list_attr)) ? $list_attr['type'] : 'button';

		if ($list_type == 'button') {
			if ($list_visible == '1') {
				$result .= "<li><a href='#' onclick=$list_action title='' ><i class='fa fa-caret-right'></i> $list_title</a></li>\n";
			}
		} else {
			$result .= "<li class='divider'></li>\n";
		}
	}
	$result .= "</ul>\n";
	$result .= "</div>\n";
	$result .= "</div>\n";
	return $result;
}
/**
 * mengecek nilai pada satu kolom ditabel tertentu
 * return int(number)
 */
function isDataExist($data = array())
{
	$ci = &get_instance();
	$ci->load->database();
	if (!is_array($data['column'])) {
		$ci->db->where($data['column'], $data['search']);
	} else {
		foreach ($data['column'] as $key => $search) {
			$ci->db->where($key, $search);
		}
	}
	$result = $ci->db->from($data['table'])
		->get()
		->num_rows();
	return $result;
}
// END ETC METHOD ---------------------------------------------------------------------
// START FORM METHOD ---------------------------------------------------------------------
/** memecah array menjadi beberapa bagian 
 * $output = array multidimensi
 */
function array_split($array, $pieces = 2)
{
	if ($pieces < 2) return array($array);	// skip
	$newCount = ceil(count($array) / $pieces);
	$a = array_slice($array, 0, $newCount);
	$b = array_split(array_slice($array, $newCount), $pieces - 1);
	return array_merge(array($a), $b);
}
/**
 * fungsi ini untuk membuat form secara dinamis HANYA digunakan di wizard form
 * @field 		(array)		= berisi field (selain type hidden) yang ingin digenerate
 * @hiddenField	(array)		= berisi field hidden
 * @buttons		(array)		= berisi button
 * @n_col		(integer)	= jumlah kolom
 * result		(string)
 */
function custom_form($fields, $hiddenField = array(), $buttons = array(), $n_col = 1)
{
	$result 		= '';		 									// initialize output
	$n_field 		= count($fields);  								// cari tau jumlah item array						// jumlah kolom
	$n_items		= array_split($fields, $n_col);					// memecah array
	$n_width_max	= 12; 											// default max width based on bootstrap
	$n_width		= round($n_width_max / $n_col);				// max width is 12, so divide by column
	$c_width		= "col-md-$n_width col-sm-$n_width col-xs-$n_width_max";
	$n_width_btn	= ($n_col == 1) ? $n_width_max - 3 : $n_width_max;
	$n_width_field	= ($n_col == 1) ? 6 : $n_width_max - 3;
	// loop hidden type
	if (count($hiddenField) != 0) {
		foreach ($hiddenField as $arr_key => $arr_data) {
			$defaultValue = (array_key_exists('value', $arr_data)) ? $arr_data['value'] : '';
			$defaultName 	= (array_key_exists('name', $arr_data)) ? $arr_data['name'] : $arr_key;
			$result .= "<input type=\"hidden\" id=\"$defaultName\" name=\"$defaultName\" value=\"$defaultValue\">\n";
		}
	}
	// loop column first
	for ($i = 0; $i < $n_col; $i++) {
		// open container syntax
		$result .= "<div class=\"$c_width\">\n";
		// loop normal type
		foreach ($n_items[$i] as $arr_key => $arr_data) {
			// make some global variable
			$inType 		= strtolower($arr_data['type']);
			$defaultValue 	= (array_key_exists('value', $arr_data)) ? $arr_data['value'] : '';
			$readonly	 	= (array_key_exists('readonly', $arr_data)) ? 'readonly="readonly"' : '';
			$isRequired 	= (array_key_exists('required', $arr_data)) ? 'required="required"' : '';
			$isPlaceholder 	= (array_key_exists('placeholder', $arr_data)) ? "placeholder=\"$arr_data[placeholder]\"" : '';
			$defaultName 	= (array_key_exists('name', $arr_data)) ? $arr_data['name'] : $arr_key;
			$defaultClass 	= (array_key_exists('class', $arr_data)) ? $arr_data['class'] : 'col-md-6 col-sm-6 col-xs-12';

			$result .= "<div class=\"form-group\">\n";
			if ($inType == 'text' || $inType == 'number' || $inType == 'password' || $inType == 'email' || $inType == 'color' || $inType == 'tel' || $inType == 'search' || $inType == 'time' || $inType == 'url') {
				$result .= "<label class=\"control-label col-md-3 col-sm-3 col-xs-12\" for=\"$defaultName\">$arr_data[label]</label>\n";
				$result .= "<div class=\"col-md-$n_width_field col-sm-$n_width_field col-xs-$n_width_max\">\n";
				$result .= "<input type=\"$inType\" id=\"$defaultName\" name=\"$defaultName\" class=\"form-control $defaultClass\" value=\"$defaultValue\" $isPlaceholder $readonly $isRequired>";
				$result .= "</div>\n";
			} else 
				if ($inType == 'date' || $inType == 'datetime-local' || $inType == 'time') {
				switch ($inType) {
					case 'date':
						$defValue = date('Y-m-d');
						break;
					case 'datetime-local':
						$defValue = date('Y-m-d H:m:s');
						break;
					case 'time':
						$defValue = date('H:m:s');
						break;
					default:
						$defValue = date('Y-m-d');
						break;
				}
				$defaultDate = (array_key_exists('value', $arr_data)) ? $arr_data['value'] : $defValue;
				$result .= "<label class=\"control-label col-md-3 col-sm-3 col-xs-12\" for=\"$defaultName\">$arr_data[label]</label>\n";
				$result .= "<div class=\"col-md-6 col-sm-6 col-xs-12\">\n";
				$result .= "<input type=\"$inType\" id=\"$defaultName\" name=\"$defaultName\" class=\"form-control $defaultClass\" value=\"$defaultDate\" $readonly $isRequired>";
				$result .= "</div>\n";
			} else 
				if ($inType == 'option' || $inType == 'multiple') {
				$result .= "<label class=\"control-label col-md-3 col-sm-3 col-xs-12\" for=\"$defaultName\">$arr_data[label]</label>\n";
				$result .= "<div class=\"col-md-6 col-sm-6 col-xs-12\">\n";
				if ($inType != 'multiple') {
					$result .= "<select id=\"$defaultName\" name=\"$defaultName\" class=\"form-control\" $readonly $isRequired >\n";
				} else {
					$result .= "<select id=\"$defaultName\" name=\"$defaultName\" class=\"select2_multiple form-control\" multiple=\"multiple\" $readonly $isRequired >\n";
				}
				foreach ($arr_data['option'] as $key => $value) {
					$result .= "<option value=\"$key\">$value</option>\n";
				}
				$result .= "</select>\n";
				$result .= "</div>\n";
			} else
				if ($inType == 'file') {
				$result .= "<label class=\"control-label col-md-3 col-sm-3 col-xs-12\" for=\"$defaultName\">$arr_data[label]</label>\n";
				$result .= "<div class=\"col-md-6 col-sm-6 col-xs-12\">\n";
				$result .= "<input type=\"$inType\" id=\"$defaultName\" name=\"$defaultName\" class=\"form-control $defaultClass\" $readonly $isRequired>\n";
				$result .= "<img src=\"\" id=\"pict_detail_img\" width=\"400px\" style=\"display: none;\">";
				$result .= "</div>\n";
			} else 
				if ($inType == 'textarea') {
				$t_rows		 = (array_key_exists('rows', $arr_data)) ? "rows=\"$arr_data[rows]\"" : "rows=\"3\"";
				//$t_cols		 = (array_key_exists('cols',$arr_data)) ? "cols=\"$arr_data[cols]\"" : "";
				$result 	.= "<label class=\"control-label col-md-3 col-sm-3 col-xs-12\" for=\"$defaultName\">$arr_data[label]</label>\n";
				$result 	.= "<div class=\"col-md-6 col-sm-6 col-xs-12\">\n";
				$result 	.= "<textarea id=\"$defaultName\" name=\"$defaultName\" $t_rows class=\"form-control $defaultClass\" $isPlaceholder $readonly $isRequired>$defaultValue</textarea>";
				$result 	.= "</div>\n";
			} else 
				if ($inType == 'checkbox' || $inType == 'radio') {
				/**
				 * this is how you should define $option variable
				 * $options = array(
				 *	'Ops1'	=> array('name'=>'radio','desc'=>'ini keterangan label 1'),
				 *	'Ops2'	=> array('name'=>'radio','desc'=>'ini keterangan label 2','checked'=>true),
				 *	);
				 * -> Ops1 (key) will be value of checkbox
				 * -> Ops1 (key) will be name and value of radio
				 */
				$result 	.= "<label class=\"control-label col-md-3 col-sm-3 col-xs-12\" for=\"$defaultName\">$arr_data[label]</label>\n";
				$result 	.= "<div class=\"col-md-6 col-sm-6 col-xs-12\">\n";
				foreach ($arr_data['option'] as $key => $value) {
					$isCheckbox	 = ($inType == 'checkbox') ? "$value[name]" . "[]" : "$value[name]";
					$isChecked	 = (array_key_exists('checked', $value)) ? "checked" : "";
					$result .= "<div class=\"$inType\">\n";
					$result .= "<label>\n";
					$result .= "<input type=\"$inType\" name=\"$isCheckbox\" value=\"$key\" $isChecked> $value[desc]\n";
					$result .= "</label>\n";
					$result .= "</div>\n";
				}
				$result 	.= "</div>\n";
			} else
				if ($inType == 'btn_addon') {
				// default value 
				$btn_id	 	 = (array_key_exists('btn_id', $arr_data)) ? "$arr_data[btn_id]" : "btn_aksi";
				$btn_label	 = (array_key_exists('btn_label', $arr_data)) ? "$arr_data[btn_label]" : "Cari";
				$btn_icon	 = (array_key_exists('btn_icon', $arr_data)) ? "fa $arr_data[btn_icon]" : "fa fa-search";
				$btn_class	 = (array_key_exists('btn_class', $arr_data)) ? "$arr_data[btn_class]" : "btn-primary";

				$result 	.= "<label class=\"control-label col-md-3 col-sm-3 col-xs-12\" for=\"$defaultName\">$arr_data[label]</label>\n";
				$result 	.= "<div class=\"col-md-6 col-sm-6 col-xs-12\">\n";
				$result 	.= "<div class=\"input-group\">";
				$result 	.= "<input type=\"text\" id=\"$defaultName\" name=\"$defaultName\" class=\"form-control col-md-6 col-sm-6 col-xs-12\" value=\"$defaultValue\" $isPlaceholder $readonly $isRequired>";
				$result 	.= "<span class=\"input-group-btn\">";
				$result 	.= "<button type=\"button\" id=\"$btn_id\" class=\"btn $btn_class\"><i class=\"$btn_icon\"></i> $btn_label</button>";
				$result 	.= "</span>";
				$result 	.= "</div>\n";
				$result 	.= "</div>\n";
			} else
				if ($inType == 'btn_action') {
				/**
				 * this sample how to define $option variable
				 * $options = array(
				 *	 'Ops1'	=> array('url'=>'home','label'=>'ini keterangan label 1'),
				 *	 'Ops2'	=> array('url'=>'mutasi','label'=>'ini keterangan label 2'),
				 *	 'Ops3'	=> array('url'=>'kartustock','label'=>'ini keterangan label 3'),
				 *	);
				 */
				$btn_id	 	 = (array_key_exists('btn_id', $arr_data)) ? "$arr_data[btn_id]" : "btn_aksi";
				$btn_label	 = (array_key_exists('btn_label', $arr_data)) ? "$arr_data[btn_label]" : "Action";
				$result 	.= "<label class=\"control-label col-md-3 col-sm-3 col-xs-12\" for=\"$defaultName\">$arr_data[label]</label>\n";
				$result 	.= "<div class=\"col-md-6 col-sm-6 col-xs-12\">\n";
				$result 	.= "<div class=\"input-group\">";
				$result 	.= "<input type=\"text\" id=\"$defaultName\" name=\"$defaultName\" class=\"form-control col-md-6 col-sm-6 col-xs-12\" aria-label=\"Text input with dropdown button\" value=\"$defaultValue\" $isPlaceholder $readonly $isRequired>";
				$result 	.= "<div class=\"input-group-btn\">";
				$result 	.= "<button type=\"button\" id=\"$btn_id\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\">$btn_label <span class=\"caret\"></span></button>";
				$result 	.= "<ul class=\"dropdown-menu dropdown-menu-right\" role=\"menu\">\n";
				foreach ($arr_data['option'] as $key => $value) {
					$result .= "<li><a href=\"$value[url]\">$value[label]</a></li>\n";
				}
				$result 	.= "</ul>\n";
				$result 	.= "</div>\n";
				$result 	.= "</div>\n";
				$result 	.= "</div>\n";
			} else 
				if ($inType == 'search') {
				// default value 
				$btn_id	 	 = (array_key_exists('btn_id', $arr_data)) ? "$arr_data[btn_id]" : "btn_cari";
				$btn_label	 = (array_key_exists('btn_label', $arr_data)) ? "$arr_data[btn_label]" : "Cari";
				$btn_icon	 = (array_key_exists('btn_icon', $arr_data)) ? "fa $arr_data[btn_icon]" : "fa fa-search";
				$btn_class	 = (array_key_exists('btn_class', $arr_data)) ? "$arr_data[btn_class]" : "btn-primary";
				$modal_class = (array_key_exists('modal_class', $arr_data)) ? ".$arr_data[modal_class]" : ".bs-example-modal-lg";

				$result 	.= "<label class=\"control-label col-md-3 col-sm-3 col-xs-12\" for=\"$defaultName\">$arr_data[label]</label>\n";
				$result 	.= "<div class=\"col-md-6 col-sm-6 col-xs-12\">\n";
				$result 	.= "<div class=\"input-group\">";
				$result 	.= "<input type=\"text\" id=\"$defaultName\" name=\"$defaultName\" class=\"form-control col-md-6 col-sm-6 col-xs-12\" value=\"$defaultValue\" $isPlaceholder $readonly $isRequired>";
				$result 	.= "<span class=\"input-group-btn\">";
				$result 	.= "<button type=\"button\" id=\"$btn_id\" class=\"btn $btn_class\" data-toggle=\"modal\" data-target=\"$modal_class\"><i class=\"$btn_icon\"></i> $btn_label</button>";
				$result 	.= "</span>";
				$result 	.= "</div>\n";
				$result 	.= "</div>\n";
			}
			$result .= "</div>\n";
		}
		$result .= "</div>\n";
	}
	// make default if no input array button
	if (count($buttons) == 0) {
		$result .= "<div class=\"clearfix\"></div>\n
						<div class=\"ln_solid\"></div>\n
						<div class=\"form-group\" id=\"button_action\">\n
						<div class=\"$c_width\">\n
							<button type=\"submit\" class=\"btn btn-success pull-right\">Simpan</button>\n
							<button type=\"reset\" class=\"btn btn-danger pull-right\">Reset</button>\n 							
						</div>\n
						</div>\n";
	} else {
		$result .= "<div class=\"clearfix\"></div>\n
					<div class=\"ln_solid\"></div>\n
						<div class=\"form-group\" id=\"button_action\">\n
							<div class=\"col-md-$n_width_btn col-sm-$n_width_btn col-xs-$n_width_max\">\n";
		$idbtn = '';
		rsort($buttons);			// reverse array order bcoz pull-right make button placed reverse and this make all come to normal
		foreach ($buttons as $btn) {
			($btn['id'] != '') ? ($idbtn = "id=\"$btn[id]\"") : ($idbtn = "");
			$result .= "<button $idbtn type=\"" . $btn['type'] . "\" class=\"" . $btn['class'] . " pull-right\">" . $btn['label'] . "</button>\n";
		}
		$result .= "</div>\n
				</div>\n";
	}
	echo $result;
}
/**
 * fungsi ini untuk membuat form secara dinamis di form normal (insyaAlloh)
 * @fields 		(array)		= berisi field (selain type hidden) yang ingin digenerate
 * @hiddenField	(array)		= berisi field hidden
 * @buttons		(array)		= berisi button
 * @n_col		(integer)	= jumlah kolom
 * result		(string)
 * 
 *  How To Use it!
	 	// untuk combobox&checkbox
	 	$options = array(
			'Ops1'	=> array('desc'=>'ini keterangan label 1'),
			'Ops2'	=> array('desc'=>'ini keterangan label 2','checked'=>true),
		);
		// dropdown
		$btn_options = array(
			'Ops1'	=> array('url'=>'home','label'=>'ini keterangan label 1'),
			'Ops2'	=> array('url'=>'mutasi','label'=>'ini keterangan label 2'),
			'Ops3'	=> array('url'=>'kartustock','label'=>'ini keterangan label 3'),
		);
		// field
		$field_attr = array(
			'a1'    => array('type' => 'hidden','label'=>'Nomor Induk','value'=>$userdata['nim'],'readonly'=>true),
			'a2'    => array('type' => 'text','label'=>'Nomor Induk','value'=>$userdata['nim']),
			'a3'    => array('type' => 'option','label'=>'Nomor Induk','option'=>array('1'=>'halo','2'=>'halo 2')),
			'a4'    => array('type' => 'file','label'=>'Nomor Induk','value'=>$userdata['nim']),
			'a6'    => array('type' => 'btn_addon','label'=>'Nomor Induk','value'=>$userdata['nim']),
			'a7'    => array('type' => 'btn_action','label'=>'Nomor Induk','option'=>$btn_options),
			'a8'    => array('type' => 'search','label'=>'pencarian','value'=>$userdata['nim'],'modal_class'=>'modal','required'=>true),
			'a5'    => array('type' => 'checkbox','label'=>'Nomor Induk','option'=>$options),
			'a9'    => array('type' => 'textarea','label'=>'test','value'=>'test')
		);		
		$buttons = array(
			'b2'  =>  array('type'=>'submit','class'=>'btn btn-primary','label'=>'Submit'),
			'b1'  =>  array('type'=>'reset','class'=>'btn btn-warning','label'=>'Reset')
		);
		$form_attr = array(
			'form_id'  =>  'form-2',
			'upload'  =>  true,
			'error'   => 'pesan',
			'center'  =>true
		);
		// generate form syntax
		create_form($field_attr, 2, $buttons, $form_attr);
		// table attribute
		$table_attr = array(
			'table_id'		 => 'tabel-pencarian',
			'columns'		 => array("No.","AKSI","NAMA LENGKAP","SEX","TP LAHIR","TGL LAHIR","HP","ALAMAT","JABATAN","TGL MASUK"),
			'header'		 => 'simple/complex',
			'header_options' => array(
				'row1'		 =>	array(
								'col1'	=> array('label'=>'NO.','mRow'=>2),
								'col2'	=> array('label'=>'AKSI','mRow'=>2),
								'col3'	=> array('label'=>'DATA PRIBADI','mCol'=>6),
								'col4'	=> array('label'=>'LAIN','mCol'=>2),
				),
				'row2'		 => array("NAMA LENGKAP","SEX","TP LAHIR","TGL LAHIR","HP","ALAMAT","JABATAN","TGL MASUK")
			),
			'footer'		 => false
		);
		// if you use field type search, don't forget to mention this too work seamless
		getModalDialog($table_attr,array('class'=>'modal','title_id'=>'model-1','footer'=>'mencoba'));
*/ 
function create_form_old()
{
	date_default_timezone_set('Asia/Jakarta');
	// count parameter given
	$n_param = func_num_args();
	// make different action for different parameter
	switch ($n_param) {
		case 1:
			list($fields) 									= func_get_args();
			$n_col = 1;
			break;
		case 2:
			list($fields, $n_col) 							= func_get_args();
			break;
		case 3:
			list($fields, $n_col, $form_attr) 				= func_get_args();
			break;
		case 4:
			list($fields, $n_col, $buttons, $form_attr) 	= func_get_args();
			break;
	}
	// make first row
	$result 		= "<div class=\"row\">\n";
	// form attribute deploy
	if (!is_null(@$form_attr)) {
		$form_id 			= (array_key_exists('name', $form_attr)) ? $form_attr['name'] : "form-1";
		$form_action 	= (array_key_exists('action', $form_attr)) ? "action=\"$form_attr[action]\"" : "action=\"\"";
		$form_class 	= (array_key_exists('class', $form_attr)) ? $form_attr['class'] : 'form-horizontal form-label-left';
		$isHide		 		= (array_key_exists('hide', $form_attr)) ? ($form_attr['hide']) ? 'hide' : '' : '';
		$isUpload	 		= (array_key_exists('upload', $form_attr)) ? ($form_attr['upload']) ? "enctype=\"multipart/form-data\"" : '' : '';
		$isCenter	 		= (array_key_exists('center', $form_attr)) ? ($form_attr['center']) ? "center-margin" : '' : '';
		// jika memakai pure bootstrap
		$isPure	 			= (array_key_exists('pure', $form_attr)) ? ($form_attr['center']) ? $form_attr['pure'] : false : false;

		// remember error_id dialog untuk container error_msg untuk pesan errornya
		if (array_key_exists('error', $form_attr)) {
			if (!$isPure) {
				$dialog 		= "
					<div id=\"$form_attr[error]\" style=\"display: none;\"  class=\"alert alert-success alert-dismissible fade in\" role=\"alert\">
						<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button>
						<p>Transaksi berhasil</p>
					</div>\n";
			} else {
				$dialog 		= "
					<div class=\"col-sm-12 col-md-12 col-lg-12\">
						<div id=\"$form_attr[error]\" style=\"display: none;\"  class=\"alert alert-success alert-dismissible fade in\" role=\"alert\">
							<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button>
							<p>Transaksi berhasil</p>
						</div>
					</div>\n";
			}
			$result 	.= $dialog;
		}

		// make some container
		if ($isPure) {
			$result 		.= "\n<div class=\"col-sm-12 col-md-12 col-lg-12\">\n";
		}

		$result 		.= "\n<!-- awal dari form -->\n";
		$result			.= "<form id=\"$form_id\" name=\"$form_id\" $form_action class=\"$form_class $isHide\" method=\"post\" $isUpload>\n";
	}
	// make some default 
	$n_width_max	= 12; 																			// default max width based on column bootstrap
	$n_width		= round($n_width_max / $n_col);												// max width is 12, so divide by column
	if ($n_col == 1) {
		$c_width		= "col-md-" . ($n_width - 1) . " col-sm-" . ($n_width - 1) . " col-xs-$n_width_max";
	} else {
		$c_width		= "col-md-$n_width col-sm-$n_width col-xs-$n_width_max";					// for wide until max 
	}
	// field deploy
	foreach ($fields as $arr_key => $arr_data) {
		// make some global variable
		$inType 		= strtolower($arr_data['type']);
		$defaultValue 	= (array_key_exists('value', $arr_data)) ? $arr_data['value'] : '';
		$readonly	 	= (array_key_exists('readonly', $arr_data)) ? 'readonly="readonly"' : '';
		$isRequired 	= (array_key_exists('required', $arr_data)) ? 'required="required"' : '';
		$isPlaceholder 	= (array_key_exists('placeholder', $arr_data)) ? "placeholder=\"$arr_data[placeholder]\"" : '';
		$defaultName 	= (array_key_exists('name', $arr_data)) ? $arr_data['name'] : $arr_key;
		$defaultClass 	= (array_key_exists('class', $arr_data)) ? $arr_data['class'] : '';

		// deploy hidden field
		if ($inType == 'divider') {
			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result 	.= "<div class=\"ln_solid\"></div>\n";
			$result 	.= "</div>\n";
		} else
		if ($inType == 'empty') {
			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result 	.= "</div>\n";
		} else
			if ($inType == 'hidden') {
			$result .= "<input type=\"$inType\" id=\"$defaultName\" name=\"$defaultName\" class=\"$defaultClass\" value=\"$defaultValue\">";
		} else
			if ($inType == 'text' || $inType == 'password' || $inType == 'email' || $inType == 'color' || $inType == 'tel' || $inType == 'url') {
			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result 	.= "<label class=\"control-label\" for=\"$defaultName\">$arr_data[label]</label>\n";
			$result 	.= "<input type=\"$inType\" id=\"$defaultName\" name=\"$defaultName\" class=\"form-control $defaultClass\" value=\"$defaultValue\" $isPlaceholder $readonly $isRequired>";
			$result 	.= "</div>\n";
		} else
		if ($inType == 'number') {
			$defaultStep 	= (array_key_exists('step', $arr_data)) ? $arr_data['step'] : '1';
			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result 	.= "<label class=\"control-label\" for=\"$defaultName\">$arr_data[label]</label>\n";
			$result 	.= "<input type=\"$inType\" id=\"$defaultName\" name=\"$defaultName\" step=\"$defaultStep\" class=\"form-control $defaultClass\" value=\"$defaultValue\" $isPlaceholder $readonly $isRequired>";
			$result 	.= "</div>\n";
		} else
		if ($inType == 'decimal') {
			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result 	.= "<label class=\"control-label\" for=\"$defaultName\">$arr_data[label]</label>\n";
			$result 	.= "<input type=\"number\" id=\"$defaultName\" name=\"$defaultName\" class=\"form-control $defaultClass\" min=\"0\" value=\"0\" step=\"0.01\" title=\"$defaultName\" pattern=\"^\d+(?:\.\d{1,2})?$\" onblur=\"this.parentNode.parentNode.style.backgroundColor=/^\d+(?:\.\d{1,2})?$/.test(this.value)?'inherit':'red'\" $isPlaceholder $readonly $isRequired>";
			$result 	.= "</div>\n";
		}
		if ($inType == 'date' || $inType == 'datetime-local' || $inType == 'time') {
			switch ($inType) {
				case 'date':
					$defValue = date('Y-m-d');
					break;
				case 'datetime-local':
					$defValue = date('Y-m-d H:i:s');
					break;
				case 'time':
					$defValue = date('H:i');
					break;
				default:
					$defValue = date('Y-m-d');
					break;
			}
			$defaultDate = (array_key_exists('value', $arr_data)) ? $arr_data['value'] : $defValue;
			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result 	.= "<label class=\"control-label\" for=\"$defaultName\">$arr_data[label]</label>\n";
			$result 	.= "<input type=\"$inType\" id=\"$defaultName\" name=\"$defaultName\" class=\"form-control $defaultClass\" value=\"$defaultDate\" $readonly $isRequired>";
			$result 	.= "</div>\n";
		} else 
			if ($inType == 'option' || $inType == 'multiple') {
			$n_selected  = (array_key_exists('selected', $arr_data)) ? $arr_data['selected'] : 0;
			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result .= "<label class=\"control-label\" for=\"$defaultName\">$arr_data[label]</label>\n";
			if ($inType != 'multiple') {
				$result .= "<select id=\"$defaultName\" name=\"$defaultName\" class=\"form-control\" $readonly $isRequired >\n";
			} else {
				$result .= "<select id=\"$defaultName\" name=\"" . $defaultName . "[]\" class=\"select2_multiple form-control\" multiple=\"multiple\" $readonly $isRequired >\n";
			}
			foreach ($arr_data['option'] as $key => $value) {
				if ($n_selected == $key || $n_selected == $value) {
					$result .= "<option value=\"$key\" selected>$value</option>\n";
				} else {
					$result .= "<option value=\"$key\">$value</option>\n";
				}
			}
			$result .= "</select>\n";
			$result .= "</div>\n";
		} else
			if ($inType == 'file') {
			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result 	.= "<label class=\"control-label\" for=\"$defaultName\">$arr_data[label]</label>\n";
			$result 	.= "<input type=\"$inType\" id=\"$defaultName\" accept=\"$arr_data[value]\" name=\"$defaultName\" class=\"form-control $defaultClass\" $readonly $isRequired>\n";
			$result 	.= "<img src=\"\" id=\"pict_detail_img\" width=\"400px\" style=\"display: none;\">";
			$result 	.= "</div>\n";
		} else 
			if ($inType == 'textarea') {
			$t_rows		 = (array_key_exists('rows', $arr_data)) ? "rows=\"$arr_data[rows]\"" : "rows=\"3\"";
			//$t_cols		 = (array_key_exists('cols',$arr_data)) ? "cols=\"$arr_data[cols]\"" : "";
			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result 	.= "<label class=\"control-label\" for=\"$defaultName\">$arr_data[label]</label>\n";
			$result 	.= "<textarea id=\"$defaultName\" name=\"$defaultName\" $t_rows class=\"form-control $defaultClass\" $isPlaceholder $readonly $isRequired>$defaultValue</textarea>";
			$result 	.= "</div>\n";
		} else 
			if ($inType == 'checkbox' || $inType == 'radio') {
			/**
			 * this is how you should define $option variable
			 * $options = array(
			 *	'Ops1'	=> array('desc'=>'ini keterangan label 1'),
			 *	'Ops2'	=> array('desc'=>'ini keterangan label 2','checked'=>true),
			 *	);
			 * -> Ops1 (key) will be value of checkbox
			 * -> Ops1 (key) will be value of radio
			 */
			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result 	.= "<label class=\"control-label\" for=\"$defaultName\">$arr_data[label]</label>\n";
			foreach ($arr_data['option'] as $key => $value) {
				$isCheckbox	 = ($inType == 'checkbox') ? $arr_key . "[]" : $arr_key;
				$isChecked	 = (array_key_exists('checked', $value)) ? "checked" : "";
				$result .= "<div class=\"$inType\">\n";
				$result .= "<label>\n";
				$result .= "<input type=\"$inType\" id=\"$isCheckbox$key\" name=\"$isCheckbox\" value=\"$key\" $isChecked> $value[desc]\n";
				$result .= "</label>\n";
				$result .= "</div>\n";
			}
			$result 	.= "</div>\n";
		} else
			if ($inType == 'btn_addon') {
			// default value 
			$btn_id	 	 = (array_key_exists('btn_id', $arr_data)) ? "$arr_data[btn_id]" : "btn_aksi";
			$btn_label = (array_key_exists('btn_label', $arr_data)) ? "$arr_data[btn_label]" : "Aksi";
			$btn_icon	 = (array_key_exists('btn_icon', $arr_data)) ? "fa $arr_data[btn_icon]" : "fa fa-info";
			$btn_class = (array_key_exists('btn_class', $arr_data)) ? "$arr_data[btn_class]" : "btn-primary";

			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result 	.= "<label class=\"control-label\" for=\"$defaultName\">$arr_data[label]</label>\n";
			$result 	.= "<div class=\"input-group\">\n";
			$result 	.= "<input type=\"text\" id=\"$defaultName\" name=\"$defaultName\" class=\"form-control\" value=\"$defaultValue\" $isPlaceholder $readonly $isRequired>";
			$result 	.= "<span class=\"input-group-btn\">";
			$result 	.= "<button type=\"button\" id=\"$btn_id\" class=\"btn $btn_class\"><i class=\"$btn_icon\"></i> $btn_label</button>";
			$result 	.= "</span>\n";
			$result 	.= "</div>\n";
			$result 	.= "</div>\n";
		} else
			if ($inType == 'btn_action') {
			/**
			 * this sample how to define $option variable
			 * $options = array(
			 *	 'Ops1'	=> array('url'=>'home','label'=>'ini keterangan label 1'),
			 *	 'Ops2'	=> array('url'=>'mutasi','label'=>'ini keterangan label 2'),
			 *	 'Ops3'	=> array('url'=>'kartustock','label'=>'ini keterangan label 3'),
			 *	);
			 */
			$btn_id	 	 = (array_key_exists('btn_id', $arr_data)) ? "$arr_data[btn_id]" : "btn_aksi";
			$btn_label	 = (array_key_exists('btn_label', $arr_data)) ? "$arr_data[btn_label]" : "Action";

			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result 	.= "<label class=\"control-label \" for=\"$defaultName\">$arr_data[label]</label>\n";
			$result 	.= "<div class=\"input-group\">";
			$result 	.= "<input type=\"text\" id=\"$defaultName\" name=\"$defaultName\" class=\"form-control\" aria-label=\"Text input with dropdown button\" value=\"$defaultValue\" $isPlaceholder $readonly $isRequired>";
			$result 	.= "<div class=\"input-group-btn\">";
			$result 	.= "<button type=\"button\" id=\"$btn_id\" class=\"btn btn-default dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\">$btn_label <span class=\"caret\"></span></button>";
			$result 	.= "<ul class=\"dropdown-menu dropdown-menu-right\" role=\"menu\">\n";
			foreach ($arr_data['option'] as $list_key => $list_data) {
				$result .= "<li><a href=\"$list_data[url]\">$list_data[label]</a></li>\n";
			}
			$result 	.= "</ul>\n";
			$result 	.= "</div>\n";
			$result 	.= "</div>\n";
			$result 	.= "</div>\n";
		} else 
			if ($inType == 'search') {
			// default value 
			$btn_id	 	 = (array_key_exists('btn_id', $arr_data)) ? "$arr_data[btn_id]" : "btn_cari";
			$btn_label	 = (array_key_exists('btn_label', $arr_data)) ? "$arr_data[btn_label]" : "Cari";
			$btn_icon	 = (array_key_exists('btn_icon', $arr_data)) ? "fa $arr_data[btn_icon]" : "fa fa-search";
			$btn_class	 = (array_key_exists('btn_class', $arr_data)) ? "$arr_data[btn_class]" : "btn-primary";
			$modal_class = (array_key_exists('modal_class', $arr_data)) ? ".$arr_data[modal_class]" : ".bs-example-modal-lg";

			$result 	.= "<div class=\"form-group $c_width\">\n";
			$result 	.= "<label class=\"control-label\" for=\"$defaultName\">$arr_data[label]</label>\n";
			$result 	.= "<div class=\"input-group\">\n";
			$result 	.= "<input type=\"text\" id=\"$defaultName\" name=\"$defaultName\" class=\"form-control\" value=\"$defaultValue\" $isPlaceholder $readonly $isRequired >";
			$result 	.= "<span class=\"input-group-btn\">\n";
			$result 	.= "<button type=\"button\" id=\"$btn_id\" data-toggle=\"modal\" data-backdrop=\"static\" data-keyboard=\"false\" data-target=\"$modal_class\" class=\"btn $btn_class\"><i class=\"$btn_icon\"></i> $btn_label</button>\n";
			$result 	.= "</span>\n";
			$result 	.= "</div>\n";
			$result 	.= "</div>\n";
		}
	}
	// end row
	$result 		.= "</div>\n";
	// make default if no input array button
	if (!is_null(@$buttons)) {
		// memberi garis di awal tombol
		$result 		.= "<div class=\"ln_solid\"></div>\n";
		$result 		.= "<div class=\"row\">\n";
		$result 		.= "<div class=\"form-group col-md-$n_width_max col-sm-$n_width_max col-xs-$n_width_max\">\n";
		foreach ($buttons as $btn_key => $btn_data) {
			//$idbtn 		 = (array_key_exists('name',$btn_data)) ?  "id=\"$btn_key\"" : "id=\"$btn_data[name]\"";
			if ($n_col > 1) {
				$state 		 = (@$btn_data['state'] == '') ? "right" : "left";
			} else {
				$state		 = 'left';
			}
			$result 	.= "<button id=\"$btn_key\" type=\"" . $btn_data['type'] . "\" class=\"" . $btn_data['class'] . " pull-$state\">" . $btn_data['label'] . "</button>&nbsp; \n";
		}
		$result 		.= "</div>\n";
		$result 		.= "</div>\n";
		// memberi garis di akhir tombol
		$result 		.= "<div class=\"ln_solid\"></div>\n";
	}
	// close form syntax
	if (!is_null(@$form_attr)) {
		$result 		.= "</form> <!-- akhir dari form -->\n\n";
		if ($isPure) {
			$result 		.= '</div>';
			$result 		.= "<!-- akhir dari form container -->\n";
		}
	}
	echo $result;
}

/**
 * khusus template limitless
 */
function create_form($fields, $form_attr, $buttons=[], $n_col=1){
	
	date_default_timezone_set('Asia/Jakarta');

	$result 		= ""; 
	$spacing 		= "\n";
	$n_width_max	= 12; 																			// default max width based on column bootstrap
	$n_width		= round($n_width_max / $n_col);
	if ($n_col == 1) {
		$c_width		= "col-md-" . $n_width_max . " col-sm-" . $n_width_max . " col-xs-$n_width_max";
	} else {
		$c_width		= "col-md-$n_width col-sm-$n_width col-xs-$n_width_max";					// for wide until max 
	}												

	// form attribute deploy
	if ( !is_null($form_attr) ) {
		$form_id 		= (array_key_exists('name', $form_attr)) ? $form_attr['name'] : "form-1";
		$form_action 	= (array_key_exists('action', $form_attr)) ? "action=\"$form_attr[action]\"" : "action=\"\"";
		$form_class 	= (array_key_exists('class', $form_attr)) ? $form_attr['class'] : 'form-horizontal form-label-left';
		$isHide		 	= (array_key_exists('hide', $form_attr)) ? ($form_attr['hide']) ? 'hide' : '' : '';
		$isUpload	 	= (array_key_exists('upload', $form_attr)) ? ($form_attr['upload']) ? "enctype=\"multipart/form-data\"" : '' : '';
		//$form_legends	= (array_key_exists('legends', $form_attr)) ? ($form_attr['legends']) ? $form_attr['legends'] : false : false;

		$result 		.= $spacing . "<!-- awal dari form -->" . $spacing;
		$result			.= "<form id=\"$form_id\" name=\"$form_id\" $form_action class=\"$form_class\" method=\"post\" $isUpload>" . $spacing;
		$result			.= "<div class=\"row\">" . $spacing;
	}
	// jika kolom lebih dari 1 maka field dibagi sejumlah kolom tapi sementara max 2 kolom
	$jml_field 		= count($fields);
	$bagi_fields 	= array_split($fields, $n_col);	
	
	// membuat isi colom sesuai request
	for ($i=0; $i < $n_col ; $i++) { 		
		$result 	.= "<div class=\"$c_width\">" . $spacing;
		$result 	.= "<fieldset>" . $spacing;
		
		if (array_key_exists('legends', $form_attr)) {
			$result 		.= "<legend class=\"font-weight-semibold\"><i class=\"icon-reading mr-2\"></i> ". $form_attr['legends'][$i] ."</legend>";
		}
		//print_r($fields);		
		foreach ($bagi_fields[$i] as $arr_key => $arr_data) {
			// make some global variable
			$inType 		= strtolower($arr_data['type']);
			$defaultValue 	= (array_key_exists('value', $arr_data)) ? $arr_data['value'] : '';
			$readonly	 	= (array_key_exists('readonly', $arr_data)) ? 'readonly="readonly"' : '';
			$isRequired 	= (array_key_exists('required', $arr_data)) ? 'required="required"' : '';
			$placeholder 	= (array_key_exists('placeholder', $arr_data)) ? "placeholder=\"$arr_data[placeholder]\"" : "placeholder=\"$arr_data[label]\"";
			$defaultName 	= (array_key_exists('name', $arr_data)) ? $arr_data['name'] : $arr_key;
			$defaultClass 	= (array_key_exists('class', $arr_data)) ? 'form-control ' . $arr_data['class'] : 'form-control';
			$defaultInfo	= (array_key_exists('info', $arr_data)) ? '<span id="info-'.$arr_key.'" class="form-text text-muted">'.$arr_data['info'].'</span>' : '<span  id="info-'.$arr_key.'" class="form-text text-muted"></span>';
			$defaultMaxLen	= (array_key_exists('max', $arr_data)) ? 'maxlength="'.$arr_data['max'].'"' : '';
			if ($inType == 'empty') {
				$result 	.= "<div class=\"form-group\">" . $spacing;
				$result 	.= "</div>" . $spacing;
			} else 
			if ($inType == 'hidden') {
				$result 	.= "<input type=\"$inType\" id=\"$defaultName\" name=\"$defaultName\" class=\"$defaultClass\" value=\"$defaultValue\">";
			} else
			if ($inType == 'text' || $inType == 'password' || $inType == 'email' || $inType == 'tel' || $inType == 'url' || $inType == 'number') {
				$result 	.= "<div class=\"form-group\">" . $spacing;
				$result 	.= "<label for=\"$defaultName\">$arr_data[label]</label>" . $spacing;
				$result 	.= "<input type=\"$inType\" id=\"$defaultName\" name=\"$defaultName\" class=\"$defaultClass\" value=\"$defaultValue\" $defaultMaxLen $placeholder $readonly $isRequired>" . $spacing;
				$result 	.= $defaultInfo . $spacing;
				$result 	.= "</div>" . $spacing;
			} else
			if ($inType == 'date' || $inType == 'datetime-local' || $inType == 'week' || $inType == 'month' || $inType == 'time') {
				$defaultMaxDate	 = (array_key_exists('max', $arr_data)) ? 'max="'.$arr_data[max].'"' : 'max="'.date('Y-m-d').'"';
				$result 	.= "<div class=\"form-group\">" . $spacing;
				$result 	.= "<label for=\"$defaultName\">$arr_data[label]</label>" . $spacing;
				$result 	.= "<input type=\"$inType\" id=\"$defaultName\" name=\"$defaultName\" class=\"$defaultClass\" value=\"$defaultValue\" $defaultMaxDate $placeholder $readonly $isRequired>" . $spacing;
				$result 	.= $defaultInfo . $spacing;
				$result 	.= "</div>" . $spacing;
			} else 
			if ($inType == 'textarea') {
				$t_rows		 = (array_key_exists('rows', $arr_data)) ? "rows=\"$arr_data[rows]\"" : "rows=\"4\"";
				//$t_cols		 = (array_key_exists('cols',$arr_data)) ? "cols=\"$arr_data[cols]\"" : "";
				$result 	.= "<div class=\"form-group\">" . $spacing;
				$result 	.= "<label for=\"$defaultName\">$arr_data[label]</label>" . $spacing;
				$result 	.= "<textarea id=\"$defaultName\" name=\"$defaultName\" $t_rows class=\"$defaultClass\" $placeholder $readonly $isRequired>$defaultValue</textarea>" . $spacing;
				$result 	.= $defaultInfo . $spacing;
				$result 	.= "</div>" . $spacing;
			} else 
			if ($inType == 'option' || $inType == 'select2') {
				$n_selected  = (array_key_exists('selected', $arr_data)) ? $arr_data['selected'] : '';
				$result 	.= "<div class=\"form-group\">" . $spacing;
				$result 	.= "<label for=\"$defaultName\">$arr_data[label]</label>" . $spacing;				
				$result 	.= "<select id=\"$defaultName\" data-placeholder=\"$placeholder\" name=\"$defaultName\" class=\"form-control form-control-select2\" $readonly $isRequired data-fouc>" . $spacing;
				foreach ($arr_data['option'] as $key => $value) {
					if ($n_selected == $key || $n_selected == $value) {
						$result .= "<option value=\"$key\" selected>$value</option>\n";
					} else {
						$result .= "<option value=\"$key\">$value</option>\n";
					}
				}
				$result 	.= "</select>" . $spacing;
				$result 	.= $defaultInfo . $spacing;
				$result 	.= "</div>" . $spacing;
			} else 
			if ($inType == 'file') {
				$result 	.= "<div class=\"form-group\">" . $spacing;
				$result 	.= "<label for=\"$defaultName\">$arr_data[label]</label>" . $spacing;
				$result 	.= "<input type=\"$inType\" id=\"$defaultName\" accept=\"$arr_data[accept]\" name=\"$defaultName\" class=\"form-input-styled\" $readonly $isRequired data-fouc>" . $spacing;
				$result 	.= $defaultInfo . $spacing;
				$result 	.= "</div>" . $spacing;
			} 
		}
		$result 	.= "</fieldset>" . $spacing;
		$result 	.= "</div>" . $spacing;
	}	

	$result .= "</div>" . $spacing;			// menutup div row
	// button 
	if( !is_null($buttons) ){
		$btn_state	= (array_key_exists('align',$buttons)) ? $buttons['align'] : "text-right";
		$result .= "<div class=\"$btn_state\">" . $spacing;
		foreach ($buttons as $btn_key => $btn_data) {
			$btn_hide	= (array_key_exists('hide', $btn_data)) ? ( $btn_data['hide'] === true ) ? 'hidden' : "" : "";
			$btn_color	= (@$btn_data['color'] == '') ? "btn-primary" : $btn_data['color'];
			$btn_icon	= (@$btn_data['icon'] == '') ? "icon-paperplane" : $btn_data['icon'];
			$btn_reload	= (@$btn_data['type'] == 'reload') ? "data-action=\"reload\" hidden" : '';
			$result .= "<button id=\"$btn_key\" type=\"$btn_data[type]\" class=\"btn $btn_color\" $btn_reload $btn_hide>$btn_data[label] <i class=\"$btn_icon ml-2\"></i></button>" . $spacing;
		}
		$result .= "</div>" . $spacing;
	}
	$result 		.= "</form>" . $spacing;
	$result 		.= "<!-- akhir dari form -->" . $spacing;
	echo $result;
}

function create_card_form($fields, $buttons, $form_attr){
	date_default_timezone_set('Asia/Jakarta');
	$result 		= '';		 									// initialize output
	$form_id 		= (array_key_exists('name', $form_attr)) ? $form_attr['name'] : "form-1";
	$form_action 	= (array_key_exists('action', $form_attr)) ? "action=\"$form_attr[action]\"" : "action=\"\"";
	$form_class 	= (array_key_exists('class', $form_attr)) ? $form_attr['class'] : '';
	$isUpload	 	= (array_key_exists('upload', $form_attr)) ? ($form_attr['upload']) ? "enctype=\"multipart/form-data\"" : '' : '';


}
/**
 * meng-generate script table dengan berbagai options
 * sample $table_attr variable
 * $table_attr = array(
 *		'table_id'		 => 'tabel-karyawan',
 *		'columns'		 => array("No.","AKSI","NAMA LENGKAP","SEX","TP LAHIR","TGL LAHIR","HP","ALAMAT","JABATAN","TGL MASUK"),
 *		'header'		 => 'complex/simple',
 *		'header_options' => array(
 *			'row1'		 =>	array(
 *							'col1'	=> array('label'=>'NO.','mRow'=>2),
 *							'col2'	=> array('label'=>'AKSI','mRow'=>2),
 *							'col3'	=> array('label'=>'DATA PRIBADI','mCol'=>6),
 *							'col4'	=> array('label'=>'LAIN','mCol'=>2),
 *			),
 *			'row2'		 => array("NAMA LENGKAP","SEX","TP LAHIR","TGL LAHIR","HP","ALAMAT","JABATAN","TGL MASUK")
 *		),
 *		'footer'		 => false
 *	);
 */
function custom_table($table_attr = array(), $opt = 1)
{
	// make default 
	$table_id		  	= (array_key_exists('table_id', $table_attr)) ? $table_attr['table_id'] : "tabel-1";
	$table_head			= (array_key_exists('header', $table_attr)) ? $table_attr['header'] : "simple";
	$table_foot			= (array_key_exists('footer', $table_attr)) ? $table_attr['footer'] : true;
	$table_foot_custom	= (array_key_exists('footer_custom', $table_attr)) ? $table_attr['footer_custom'] : "";
	$table_class		= (array_key_exists('class', $table_attr)) ? $table_attr['class'] : "table-striped table-bordered table-responsive-md";
	$table_style		= (array_key_exists('style', $table_attr)) ? $table_attr['style'] : "width:100%;";
	$header_options		= (array_key_exists('header_options', $table_attr)) ? $table_attr['header_options'] : "";

	$result = "<table id='$table_id' class='table $table_class' style='$table_style'>\n";
	if ($table_head == 'simple') {
		$result .= "<thead>\n";
		$result .= "<tr>\n";
		foreach ($table_attr['columns'] as $column) {
			$result .= "<th>$column</th>\n";
		}
		$result .= "</tr>\n";
		$result .= "</thead>\n";
	} else 
		if ($table_head == 'complex') {
		// header yang lebih kompleks with row+col span
		// maximum 2 column to merge for now 
		$result .= "<thead>\n";
		foreach ($header_options as $rowKey => $columns) {
			$result .= "<tr>\n";
			if ($rowKey == 'row1') {
				foreach ($columns as $colKey => $col_attr) {
					$mRow	= (array_key_exists('mRow', $col_attr)) ? "rowspan=\"$col_attr[mRow]\"" : "";
					$mCol	= (array_key_exists('mCol', $col_attr)) ? "colspan=\"$col_attr[mCol]\"" : "";
					$result .= "<th class=\"align-middle\" $mRow$mCol>$col_attr[label]</th>\n";
				}
			} else
				if ($rowKey == 'row2') {
				foreach ($columns as $colKey => $col_attr) {
					$mRow	= (array_key_exists('mRow', $col_attr)) ? "rowspan='\"$col_attr[mRow]\"" : "";
					$mCol	= (array_key_exists('mCol', $col_attr)) ? "colspan='\"$col_attr[mCol]\"" : "";
					$label	= (array_key_exists('label', $col_attr)) ? $col_attr['label'] : $col_attr;
					$result .= "<th class=\"align-middle\" $mRow$mCol>$label</th>\n";
				}
			}
			$result .= "</tr>\n";
		}
		$result .= "</thead>\n";
	}
	if ($table_foot) {
		$result .= "<tfoot>\n";
		$result .= "<tr>\n";
		if ($table_foot_custom == '') {
			foreach ($table_attr['columns'] as $column) {
				$result .= "<th>$column</th>\n";
			}
		} else {
			$result .= $table_foot_custom;
		}
		$result .= "</tr>\n";
		$result .= "</tfoot>\n";
	}
	$result .= "</table>\n";

	if ($opt == 1) {
		// tampil langsung
		echo $result;
	} else 
		if ($opt == 2) {
		// agar bisa dimasukkan dalam variabel lain
		return $result;
	}
}
function getModalDialog($tableAttr = array(), $modalAttr = array())
{
	// make default 
	$modal_class		= (array_key_exists('class', $modalAttr)) ? "$modalAttr[class]" : "bs-example-modal-lg";
	$modal_title		= (array_key_exists('title', $modalAttr)) ? "$modalAttr[title]" : "Pencarian Data";
	$modal_title_id		= (array_key_exists('title_id', $modalAttr)) ? "$modalAttr[title_id]" : "title_id";
	$modal_id					= (array_key_exists('modal_id', $modalAttr)) ? "$modalAttr[modal_id]" : "";

	$result = "<div id=\"$modal_id\" class=\"modal fade $modal_class\" tabindex=\"-1\" role=\"dialog\" aria-hidden=\"true\">\n";
	$result .= "<div class=\"modal-dialog modal-lg\">\n";
	$result .= "<div class=\"modal-content\">\n";
	$result .= "<div class=\"modal-header\">\n";
	$result .= "<button type=\"button\" class=\"close\" data-dismiss=\"modal\"><span aria-hidden=\"true\">×</span></button>\n";
	$result .= "<h4 class=\"modal-title\" id=\"$modal_title_id\"><i class=\"fa fa-search\"></i> $modal_title</h4>\n";
	$result .= "</div>\n";
	$result .= "<div class=\"modal-body\">\n";
	$result .= custom_table($tableAttr, 2);
	$result .= "</div>\n";
	if (@$modalAttr['footer'] != '') {
		$result .= "<div class=\"modal-footer\">\n";
		$result .= "<small class=\"pull-left\"><b>Informasi: </b><i class=\"fa fa-info\"></i><br>$modalAttr[footer]</small>\n";
		$result .= "<button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">Close</button>\n";
		$result .= "</div>\n";
	}
	$result .= "</div>\n";
	$result .= "</div>\n";
	$result .= "</div>\n";

	echo $result;
}
function create_alert($options = array('id' => 'err-msg', 'msg' => '', 'show' => false, 'type' => 'success'), $output = 1)
{
	$isShow = ($options['show'] == false) ? "display:none;" : "";
	$dialog 		= "
		<div id=\"$options[id]\" style=\"$isShow\"  class=\"alert alert-$options[type] alert-dismissible fade in\" role=\"alert\">
			<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">×</span></button>
			<p>$options[msg]</p>
		</div>\n";
	if ($output == 1) {
		echo $dialog;		// directly show
	} else
		if ($output == 2) {
		return $dialog;	// can be stored on another variable
	}
}
// END FORM METHOD ---------------------------------------------------------------------
// START DATATABLE METHOD ---------------------------------------------------------------------
/**
 * generate table query untuk dipakai banyak datatable dalam satu halaman, pada penerapannya
 * disarankan untuk menduplikasi script ini di model agar bisa di custom / filter 
 * @table_name (string)   nama tabel 
 * @columnOrder (array)   list kolom yang ingin bisa di urutkan (defaultOrder)
 * @columnSearch (array)  list kolom yang ingin bisa di cari (searchable)
 * @defaultOrder (array)  kolom yang dijadikan standar pengurutan (default order)
 */
function _get_datatables_custom_table_query($table_name = '', $columnOrder = array(), $columnSearch = array(), $defaultOrder = array('fc_id' => 'asc'))
{
	$ci = &get_instance();
	$ci->load->database();

	// you can add custom filter here as many as needed but don't forget every table has different filter
	// if($ci->input->post('f_bpbno'))
	// {
	// 	$ci->db->where('fc_nobpb', $ci->input->post('f_bpbno'));
	// }

	$ci->db->from($table_name);

	$i = 0;  // for table numbering
	foreach ($columnSearch as $item) // loop column 
	{
		if ($_POST['search']['value']) // if datatable send POST for search
		{
			if ($i === 0) // first loop
			{
				$ci->db->group_start(); // open bracket. query Where with OR clause better with bracket. because maybe can combine with other WHERE with AND.
				$ci->db->like($item, $_POST['search']['value']);
			} else {
				$ci->db->or_like($item, $_POST['search']['value']);
			}

			if (count($columnSearch) - 1 == $i) //last loop
				$ci->db->group_end(); //close bracket
		}
		$i++;
	}
	// here order processing
	if (isset($_POST['order'])) {
		$ci->db->order_by($columnOrder[$_POST['order']['0']['column']], $_POST['order']['0']['dir']);
	} else if (isset($defaultOrder)) {
		$ci->db->order_by(key($defaultOrder), $defaultOrder[key($defaultOrder)]);
	}
}
function _get_datatables($tableName = '', $columnOrder = array(), $columnSearch = array(), $defaultOrder = array('fc_id' => 'asc'))
{
	$ci = &get_instance();
	$ci->load->database();
	_get_datatables_custom_table_query($tableName, $columnOrder, $columnSearch, $defaultOrder);
	if ($_POST['length'] != -1)
		$ci->db->limit($_POST['length'], $_POST['start']);
	$query = $ci->db->get();
	return $query->result();
}

function _count_filtered($tableName = '', $columnOrder = array(), $columnSearch = array(), $defaultOrder = array('fc_id' => 'asc'))
{
	$ci = &get_instance();
	$ci->load->database();
	_get_datatables_custom_table_query($tableName, $columnOrder, $columnSearch, $defaultOrder);
	$query = $ci->db->get($table_name);
	return $query->num_rows();
}

/**
 * count_all
 *
 * @param  mixed $table_name
 *
 * @return void
 */
function _count_all($table_name = '')
{
	$ci = &get_instance();
	$ci->load->database();
	$ci->db->from($table_name);
	return $ci->db->count_all_results();
}
// END DATATABLE METHOD ---------------------------------------------------------------------

// START FUNGSI UNTUK AKADEMIK --------------------------------------------------------------
/**
 * mengubah timestamp ('2018-05-16 03:21:00') 
 * @param  [datetime] $timestamp [description]
 * @return [string]            [description]
 */
function getTimeText($timestamp)
{
	$selisih = abs(time() - strtotime($timestamp));
	$detik = $selisih;
	$waktu = '';
	$menit = round($selisih / 60);
	$jam = round($selisih / 3600);
	$hari = round($selisih / 86400);
	$minggu = round($selisih / 604800);
	$bulan = round($selisih / 2419200);
	$tahun = round($selisih / 29030400);
	if ($detik <= 60) {
		$waktu = number_format($detik, 0, 0, '.') . ' detik yang lalu';
	} else if ($menit <= 60) {
		$waktu = $menit . ' menit yang lalu';
	} else if ($jam <= 24) {
		$waktu = $jam . ' jam yang lalu';
	} else if ($hari <= 7) {
		$waktu = $hari . ' hari yang lalu';
	} else if ($minggu <= 4) {
		$waktu = $minggu . ' minggu yang lalu';
	} else if ($bulan <= 12) {
		$waktu = $bulan . ' bulan yang lalu';
	} else {
		$waktu = $tahun . ' tahun yang lalu';
	}
	return $waktu;
}
/**
 * mengubah tanggal dari db ke format tertentu
 * mengacu pada : http://php.net/manual/en/function.date.php
 * @param  [date] $timestamp  [harus berformat Y-m-d]
 */
function getFormattedTime($datetime, $tipe = 11, $custom = '')
{	
	date_default_timezone_set('Asia/Jakarta');
	if ($custom == '') {
		switch ($tipe) {				
			case 11: 
				$datestring = "d/m/Y";	// output : 01/01/2019
				break;
			case 12:	
				$datestring = "d/M/Y";	// output : Mon/Jan/2019
				break;	
			case 13:	
				$datestring = "M/M/Y";	// output : Mon/Jan/2019
				break;				
			case 21:
				$datestring = "d/m/Y h:i:s";	// output : 01/01/2019 01:01:01 12-hour format
				break;				
			case 22:
				$datestring = "d/m/Y H:i:s";	// output : 01/01/2019 01:01:01 24-hour format
				break;				
			case 3:
				$datestring = "F, d/m/Y";	// output January, 01/01/2019
				break;
			case 31:
				$datestring = "d F Y";	// output 01 January 2019
		}
	} else {
		$datestring = $custom;
	}
	return date($datestring, strtotime($datetime));
}
/**
 * fungsi untuk memodifikasi waktu
 * $date formatnya harus YYYY-mm-dd
 * $modifier contoh : +30 days, 1 month, 1 year, 2 years
 * output => tanggal dengan format $dateformat
 */
function ModifyDate($date, $modifier="+30 days", $dateformat='d-m-Y'){
	return date($dateformat, strtotime($modifier, strtotime($date)));
}
/**
 * from Y-m-d to d-m-Y in Indonesian Format
 * ex : DateFormatIndo(date('Y-m-d'))
 */
function DateFormatIndo($tanggal)
{
	$bulan = array (
		1 =>   'Januari',
		'Februari',
		'Maret',
		'April',
		'Mei',
		'Juni',
		'Juli',
		'Agustus',
		'September',
		'Oktober',
		'November',
		'Desember'
	);
	$pecahkan = explode('-', $tanggal);
	return $pecahkan[2] . ' ' . $bulan[ (int)$pecahkan[1] ] . ' ' . $pecahkan[0];
}
/**
 * mendapatkan keterangan hak akses ditiap menu/halaman
 * @param  [string] $userid  [dari session]
 * @param  [string] $halaman [dari $this->uri->segment(1)]
 * @param  string $branch  [msih belum dipakai, tp entah kpn dipakai, jadi defaultnya kosong dulu]
 * @return [array]          [berisi 4 data, add, delete, edit, view]
 */
function getDataAkses($userid, $halaman, $branch = '')
{
	$ci = &get_instance();
	$ci->load->database();
	$akses = '';
	$query = "SELECT * FROM t_hakakses WHERE fc_branch = ? AND fc_userid=? AND (fc_idmenu IN (select ifnull(fc_idmenu,'') FROM t_menu WHERE fv_menu like '%$halaman%') OR fc_idsubmenu IN (select ifnull(fc_idsubmenu,'') FROM t_submenu WHERE fc_link like '%$halaman%')) ";
	$hasil = $ci->db->query($query, array($branch, $userid));
	foreach ($hasil->result() as $key) {
		$akses = array(
			'add' => $key->fc_add,
			'delete' => $key->fc_delete,
			'edit' => $key->fc_edit,
			'view' => $key->fc_view
		);
	}
	return $akses;
}
/**
 * mendapatkan daftar opsi untuk dropdown menu yang dinamis
 * @param  string $nilai [description]
 * @return [string]        [description]
 */
function getOptionList($nilai = 'PENILAIAN')
{
	$ci = &get_instance();
	$ci->load->database();
	$query = $ci->db->select('fc_kode, fv_value')->from('t_status')->where('fc_param', $nilai);
	$result = $ci->db->get();
	$hasil = '';
	foreach ($result->result() as $value) {
		$hasil .= "\t<option value=\"$value->fc_kode\">$value->fv_value</option> \n";
	}
	return $hasil;
}
/**
 * mendapatkan nilai dari tabel t_status
 * @search	(String)	kata apa akan dicari
 * @nilai	(String)	parameter
 * @output	(int)		hasil yang diinginkan
 */
function getStatus($search = '', $nilai = 'LVL_USER', $output = 0)
{
	$ci = &get_instance();
	$ci->load->database();
	$query = $ci->db->select('fc_kode, fv_value')->from('t_status')->where('fc_param', $nilai);
	$result = $ci->db->get();
	foreach ($result->result() as $value) {
		if ($value->fv_value == $search) {
			if ($output == 0) {
				$hasil[] = array('kode' => $value->fc_kode, 'deskripsi' => $value->fv_value);
				return $hasil;
			} else
				if ($output == 1) {
				return $value->fc_kode;
			} else
				if ($output == 2) {
				return $value->fv_value;
			}
		}
	}
}
/**
 * mendapatkan nilai dari t_setup
 * 
 */
function getSetup($search = '')
{
	$ci = &get_instance();
	$ci->load->database();
	$ci->db->select('value')->from('t_setup')->where('parameter', strtoupper($search))->limit(1);
	$result = $ci->db->get()->row();
	if ($result->value != '') {
		return $result->value;
	} else {
		return 0;
	}
}
function getSetingkuri()
{
	// count parameter given
	$n_param = func_num_args();
	// make different action for different parameter
	switch ($n_param) {
		case 3:
			list($prodi, $ta) 				= func_get_args();
			break;
		case 4:
			list($jenjang, $jurusan, $prodi, $ta) 	= func_get_args();
			break;
	}
	if ($n_param == 4) {
		// untuk proyek S1 yang tidak satu db dengan siakad
		$ci = &get_instance();
		//$ci->load->database();
		$db2 = $ci->load->database('siakad', true);
		$SQLkuri = " SELECT fc_kurikulum FROM t_setingkuri 
							WHERE fc_kdjenjang=? AND fc_kdjurusan=? AND fc_kdprodi=? AND fc_ta=? limit 1";
		$result = $db2->query($SQLkuri, array($jenjang, $jurusan, $prodi, $ta));
	} else
	if ($n_param == 2) {
		// untuk db yang baru di S2 pascasarjana
		$ci = &get_instance();
		$SQLkuri = " SELECT fc_kurikulum FROM tm_kurikulum WHERE fc_kdprodi=? AND fc_ta=? AND fc_status=? limit 1";
		$result = $ci->db->query($SQLkuri, array($prodi, $ta, 1));
	}
	return $result->row();
}

function getSemester($angkatan = '')
{
	$ci = &get_instance();	
	$ci->load->database();
	$SQLset = "
					SELECT 
						rtrim(a.fv_value) AS kdsem,
						rtrim(b.fv_value) AS semester,
						rtrim(d.fv_value) AS tahunakd 
					FROM t_setup a 
						LEFT OUTER JOIN t_setup b ON b.fc_param=?
						LEFT OUTER JOIN t_setup d ON d.fc_param=?
					WHERE a.fc_param=?
					";
	$result = $ci->db->query($SQLset, array('SEMESTER', 'TAHUNAKD', 'KODESEM'));
	$hasil = $result->row(); // {'GENAP','2017/2018','2'}
	if ($angkatan == '') {
		return $hasil;
	} else {
		// asumsi inputan berupa periode 20181 -> di sipasca 		
		$akademik = substr($hasil->tahunakd, 0, 4);
		$kodesem = substr($angkatan, 4, 1);
		$angkatan = substr($angkatan, 0, 4);
		if ($kodesem == '1') {
			return (($akademik - $angkatan) * 2) + $hasil->kdsem;
		} else 
		if ($kodesem == '2') {
			return (($akademik - $angkatan) * 2) + $hasil->kdsem - 1;
		} else {
			// untuk siakad S1
			return (($akademik - $angkatan) * 2) + $hasil->kdsem;
		}
	}
}
/**
 * mengetahui apakah website kita sedang online atau offline
 */
function is_connected()
{
	//system("ping -c 1 google.com", $response);
	$response = @fsockopen("www.google.com", 80); //website, port  (try 80 or 443)            
	if ($response) {
		fclose($response);
		return 1; //connected
	} else {
		return 0; //connection failure
	}
}
/**
 * trying to get IP address client
 */
function _getIP()
{
	if (isset($_SERVER)) {
		if (isset($_SERVER["HTTP_X_FORWARDED_FOR"]))
			return $_SERVER["HTTP_X_FORWARDED_FOR"];

		if (isset($_SERVER["HTTP_CLIENT_IP"]))
			return $_SERVER["HTTP_CLIENT_IP"];

		return $_SERVER["REMOTE_ADDR"];
	}

	if (getenv('HTTP_X_FORWARDED_FOR'))
		return getenv('HTTP_X_FORWARDED_FOR');

	if (getenv('HTTP_CLIENT_IP'))
		return getenv('HTTP_CLIENT_IP');

	return getenv('REMOTE_ADDR');
}
function _getUA()
{
	if (isset($_SERVER)) {
		return $_SERVER['HTTP_USER_AGENT'];
	} else {
		return getenv('HTTP_USER_AGENT');
	}
}
// this not working
function _getMAC(){
	$ci = &get_instance();
	$ci->load->library('user_agent');
	$os = $ci->agent->platform();
	if($os == 'Linux' || $os == 'Mac' || $os == 'Macintosh' || $os == 'Android'){
		ob_start();
		system('ifconfig -a');
		$mycom = ob_get_contents(); // Capture the output into a variable
		ob_clean(); // Clean (erase) the output buffer
		$findme = "Physical";
		//Find the position of Physical text 
		$pmac = strpos($mycom, $findme); 
		$mac = substr($mycom, ($pmac + 37), 18);
		// $ipaddress = _getIP();
		// $macCommandString   =   "arp " . $ipaddress . " | awk 'BEGIN{ i=1; } { i++; if(i==3) print $3 }'";
    	// $mac = exec($macCommandString);
	} else {
		ob_start();
		system('ipconfig-a');
		$mycom=ob_get_contents(); // Capture the output into a variable
		ob_clean(); // Clean (erase) the output buffer
		$findme = "Physical";
		$pmac = strpos($mycom, $findme); // Find the position of Physical text
		$mac=substr($mycom,($pmac+36),17); // Get Physical Address
	}
	return $mac;
}
// CHARTING  --------------------------------------------
/**
 * sebelum menggunakan fungsi ini, pastikan library eChart sudah di load
 * sample parameter : 
 * $data = array(
 *		'chart1'	=> array(
 *     		'title'     => 'Graph Title',
 *      	'subtitle' => 'Graph Sub-Text',
 *      	'legend'   => 'series1',
 *      	'data'     => array('program 1' => 2,'program 1' => 2,'program 1' => 2,'program 1' => 2,'program 1' => 2,)
 *    )
 * );
 */
function create_chart($data_chart = array())
{
	$setting = '
			var mychart_settings = {
				color: ["#26B99A", "#34495E", "#BDC3C7", "#3498DB", "#9B59B6", "#8abb6f", "#759c6a", "#bfd3b7"],
				title: { itemGap: 8, textStyle: { fontWeight: "normal", color: "#408829" }},
				dataRange: { color: ["#1f610a", "#97b58d"] },
				toolbox: { color: ["#408829", "#408829", "#408829", "#408829"] },
				tooltip: {   backgroundColor: "rgba(0,0,0,0.5)", axisPointer: { type: "line", lineStyle: { color: "#408829",type: "dashed"},crossStyle: {color: "#408829"},shadowStyle: { color: "rgba(200,200,200,0.3)"}}},
				dataZoom: {  dataBackgroundColor: "#eee", fillerColor: "rgba(64,136,41,0.2)", handleColor: "#408829" },
				grid: { borderWidth: 0 },
				categoryAxis: { axisLine: { lineStyle: { color: "#408829" }}, splitLine: { lineStyle: { color: ["#eee"] } }},
				valueAxis: { axisLine: { lineStyle: { color: "#408829" }}, splitArea: { show: !0, areaStyle: { color: ["rgba(250,250,250,0.1)", "rgba(200,200,200,0.1)"] }}, splitLine: { lineStyle: { color: ["#eee"] }}},
				timeline: { lineStyle: { color: "#408829" },controlStyle: { normal: { color: "#408829" },emphasis: { color: "#408829"}}},
				textStyle: { fontFamily: "Arial, Verdana, sans-serif" }
			};

		';
	if (count($data_chart) != 0) {
		foreach ($data_chart as $key => $arr_data) {
			// check if exists
			$defaultTitle 		= (array_key_exists('title', $arr_data)) ? $arr_data['title'] : 'Graph Title';
			$defaultSubtitle 	= (array_key_exists('subtitle', $arr_data)) ? $arr_data['subtitle'] : 'Graph Subtitle';
			$defaultLegend 		= (array_key_exists('legend', $arr_data)) ? $arr_data['legend'] : '';

			$listKategori = "[";
			$listNilai = "[";
			$i = ($arr_data['data']);
			// loop category and data
			foreach ($arr_data['data'] as $kategori => $nilai) {
				$listKategori .= '"' . $kategori . '",';
				$listNilai 		.= $nilai . ",";
			}
			$listKategori = substr($listKategori, 0, -1) . "]";
			$listNilai 		= substr($listNilai, 0, -1) . "]";

			$setting .= '
					if($("#' . $key . '").length) {
							console.log("init_mycharts_' . $key . '");
							var ' . $key . ' = echarts.init(document.getElementById("' . $key . '"), mychart_settings);
							' . $key . '.setOption({
									title: { text: "' . $defaultTitle . '",subtext: "' . $defaultSubtitle . '" },
									tooltip: { trigger: "axis" },
									legend: { data: ["' . $defaultLegend . '"] },
									toolbox: { show: 1 }, calculable: !1,
									xAxis: [{ type: "category", data: ' . $listKategori . ' }],
									yAxis: [{ type: "value" }],
									series: [{
											name: "' . $defaultLegend . '", type: "bar", data: ' . $listNilai . ',
											markPoint: { data: [{ type: "max", name: "Tertinggi" }, { type: "min", name: "Terendah" }]},
											markLine: { data: [{ type: "average", name: "Rata-Rata" }] }
									}]
							})
					}

				';
		}
		echo $setting;
	} else {
		return 'no chart found';
	}
}

/**
 * create list 
 */
function create_list()
{
	$ci = &get_instance();
	$ci->load->database();
	$qr = $ci->db->query("SELECT * from v_peserta where fc_periode=?", array($this->session->userdata('periode')));
	if ($qr->num_rows() > 0) {
		return '';
	} else {
		$hasil = '<ul class="list-unstyled top_profiles scroll-view">';
		foreach ($qr->result() as $key => $value) {
			$hasil .= '
					<li class="media event">
						<a class="pull-left border-aero profile_thumb">
							<i class="fa fa-user aero"></i>
						</a>
						<div class="media-body">
							<a class="title" href="#">' . $value->fv_nama . '</a>
							<p><strong>' . $value->fc_nim . '.</strong> ' . $value->fv_nmprodi . ' </p>
							<p> <small>' . $value->pilihan1 . ' / ' . $value->pilihan2 . '</small>
							<p> <small>' . $value->fd_daftar . '</small>
							</p>
						</div>
					</li>';
		}
	}

	$hasil .= '</ul>';
	echo $hasil;
}
// CHARTING  --------------------------------------------

//  PROSES CRUD  ----------------------------------------------------------------------------
/**
 * menyimpan data di database (lain)
 * jangan lupa sesuaikan parameter @nodb
 * return (int)	
 */
function _simpanData($tabel, $data, $nodb = 0)
{
	$ci = &get_instance();
	$ci->load->database();
	if ($nodb == 0) {
		$ci->db->insert($tabel, $data);
		return $ci->db->affected_rows();
	} else
		if ($nodb == 1) {
		$db2 = $ci->load->database('siakad', true);
		$db2->insert($tabel, $data);
		return $db2->affected_rows();
	}
}
/**
 * menghapus data di database (lain)
 * jangan lupa sesuaikan parameter @nodb
 * return (int)	
 */
function _hapusData($tabel, $where, $nodb = 0)
{
	$ci = &get_instance();
	$ci->load->database();
	if ($nodb == 0) {
		$ci->db->where($where);
		$ci->db->delete($tabel);
		return $ci->db->affected_rows();
	} else
		if ($nodb == 1) {
		$db2 = $ci->load->database('siakad', true);
		$db2->where($where);
		$db2->delete($tabel);
		return $db2->affected_rows();
	}
}
/**
 * mengupdate data di database lain
 * jangan lupa sesuaikan parameter @nodb
 * return (int)	
 */
function _updateData($tabel, $data, $where, $nodb = 0)
{
	$ci = &get_instance();
	$ci->load->database();
	if ($nodb == 0) {
		$query = $ci->db->update($tabel, $data, $where);
		return $ci->db->affected_rows();
	} else
		if ($nodb == 1) {
		$db2 = $ci->load->database('siakad', true);
		$query = $db2->update($tabel, $data, $where);
		return $db2->affected_rows();
	}
}
/**
 * mendapatkan list data di database lain
 * jangan lupa sesuaikan parameter @nodb
 * return (obj)	
 */
function _getDataList($table, $select, $where, $nodb = 0, $order = '')
{
	$ci = &get_instance();
	if ($nodb == 0) {
		$ci->load->database();
		$ci->db->select($select)->where($where);
		if ($order != '') {
			$ci->db->order_by($order, 'ASC');
		}
		$query = $ci->db->get($table);
	} else
		if ($nodb == 1) {
		$db2 = $ci->load->database('siakad', true);
		$db2->select($select)->where($where);
		if ($order != '') {
			$db2->order_by($order, 'ASC');
		}
		$query = $db2->get($table);
	}
	if ($query->num_rows() > 0) {
		return $query->result();   // list object
	} else {
		return null;
	}
}
/**
 * mendapatkan data di database lain
 * jangan lupa sesuaikan parameter @nodb
 * return (obj)	
 */
function _getData($table, $select, $where, $nodb = 0)
{
	$ci = &get_instance();
	if ($nodb == 0) {
		$ci->load->database();
		$query = $ci->db->select($select)->limit(1)->where($where)->get($table);
	} else
		if ($nodb == 1) {
		$db2 = $ci->load->database('siakad', true);
		$query = $db2->select($select)->where($where)->order_by($order, 'asc')->limit(1)->get($table);
	}
	if ($query->num_rows() > 0) {
		return $query->row();   // object
	} else {
		return null;
	}
}
/**
 * untuk mengecek data apakah sudah ada di database atau belum
 * return (bool)
 */
function _isExist($table, $select, $where, $nodb = 0)
{
	$ci = &get_instance();
	if ($nodb == 0) {
		$ci->load->database();
		$query = $ci->db->select($select)->where($where)->get($table);
	} else
		if ($nodb == 1) {
		$db2 = $ci->load->database('siakad', true);
		$query = $db2->select($select)->where($where)->get($table);
	}
	if ($query->num_rows() > 0) {
		return true;
	} else {
		return false;
	}
}
/**
 * untuk insert log 
 * return (int)
 */
function _insertlog($userid, $ket, $table = 't_logs')
{
	$ci = &get_instance();
	$ci->load->database();
	date_default_timezone_set('Asia/Jakarta');
	$data = array(
		'user'	=> $userid,
		'tgl_input'	=> date('Y-m-d H:i:s'),
		'ket'	=> $ket,
		'from'  	=> _getIP(),
		'ua'    	=> _getUA()
	);
	$ci->db->insert($table, $data);
	return $ci->db->affected_rows();
}
function _getLastLog($userid, $ket='BERHASIL LOGOUT',$table = 't_logs'){
	$ci = &get_instance();
	$ci->load->database();
	date_default_timezone_set('Asia/Jakarta');
	$where = array(
		'user'	=> $userid,
		'ket'	=> $ket,
	);
	$result = $ci->db->select('tgl_input')->where($where)->get($table)->row();
	return $result->tgl_input;
}
/*
 * fungsi untuk mengubah angka menjadi huruf romawi
 */
function toRomawi($angka){
    $hsl = "";
    if($angka<1||$angka>3999){
        $hsl = "Batas Angka 1 s/d 3999";
    }else{
         while($angka>=1000){
             $hsl .= "M";
             $angka -= 1000;
         }
         if($angka>=500){
             if($angka>500){
                 if($angka>=900){
                     $hsl .= "M";
                     $angka-=900;
                 }else{
                     $hsl .= "D";
                     $angka-=500;
                 }
             }
         }
         while($angka>=100){
             if($angka>=400){
                 $hsl .= "CD";
                 $angka-=400;
             }else{
                 $angka-=100;
             }
         }
         if($angka>=50){
             if($angka>=90){
                 $hsl .= "XC";
                  $angka-=90;
             }else{
                $hsl .= "L";
                $angka-=50;
             }
         }
         while($angka>=10){
             if($angka>=40){
                $hsl .= "XL";
                $angka-=40;
             }else{
                $hsl .= "X";
                $angka-=10;
             }
         }
         if($angka>=5){
             if($angka==9){
                 $hsl .= "IX";
                 $angka-=9;
             }else{
                $hsl .= "V";
                $angka-=5;
             }
         }
         while($angka>=1){
             if($angka==4){
                $hsl .= "IV";
                $angka-=4;
             }else{
                $hsl .= "I";
                $angka-=1;
             }
         }
    }
    return ($hsl);
}
/*
 * fungsi untuk mengubah angka menjadi huruf terbilang
 */
function toHuruf($nilai) {
	$nilai = abs($nilai);
	$huruf = array("", "satu", "dua", "tiga", "empat", "lima", "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
	$temp = "";
	if ($nilai < 12) {
		$temp = " ". $huruf[$nilai];
	} else if ($nilai <20) {
		$temp = toHuruf($nilai - 10). " belas";
	} else if ($nilai < 100) {
		$temp = toHuruf($nilai/10)." puluh". toHuruf($nilai % 10);
	} else if ($nilai < 200) {
		$temp = " seratus" . toHuruf($nilai - 100);
	} else if ($nilai < 1000) {
		$temp = toHuruf($nilai/100) . " ratus" . toHuruf($nilai % 100);
	} else if ($nilai < 2000) {
		$temp = " seribu" . toHuruf($nilai - 1000);
	} else if ($nilai < 1000000) {
		$temp = toHuruf($nilai/1000) . " ribu" . toHuruf($nilai % 1000);
	} else if ($nilai < 1000000000) {
		$temp = toHuruf($nilai/1000000) . " juta" . toHuruf($nilai % 1000000);
	} else if ($nilai < 1000000000000) {
		$temp = toHuruf($nilai/1000000000) . " milyar" . toHuruf(fmod($nilai,1000000000));
	} else if ($nilai < 1000000000000000) {
		$temp = toHuruf($nilai/1000000000000) . " trilyun" . toHuruf(fmod($nilai,1000000000000));
	}     
	return $temp;
}
/*
 * fungsi untuk merubah 20181 menjadi 2018/2019 Ganjil
 */
function toAkademik($angka, $opt=1){
	$tmp='';
	$ta = substr($angka,0,4);
	$kdsem = substr($angka,4,1);
	$semester = ($kdsem % 2 == 0) ? 'Genap' : 'Ganjil';
	$nextYear = $ta + 1;
	if($opt == 1){
		$tmp = $ta.'/'.$nextYear.' '.$semester;
	} else 
	if ($opt == 2){
		$tmp = $ta.'/'.$nextYear;
	}
	return $tmp;
}
