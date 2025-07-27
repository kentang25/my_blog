<?php
defined('BASEPATH') OR exit('No direct script access allowed');
function cek_aktif() {
	$CI 	=& get_instance();
	$sesspre = $CI->config->item('session_name_prefix');
	$aktif 		= $CI->session->userdata($sesspre."valid");
	$username 	= $CI->session->userdata($sesspre."id_santri");
	if ($aktif != TRUE || $username == "") {
		redirect('santri/login');
	}
}
function cek_hak_akses($user_level, $list_hak_akses) {
	if (!in_array($user_level, $list_hak_akses)) {
		return false;
	} else {
		return true;
	}
}
function nilai_huruf($nilai) {
	$CI 	=& get_instance();
	$kkm 	= intval($CI->config->item('kkm'));

	$rentang = round(((100-$kkm)/3),0);

	$d_min = 0;
	$d_max = round(($kkm - 1),0);
	$c_min = $kkm;
	$c_max = round(($kkm + $rentang), 0);
	$b_min = round(($kkm + ($rentang * 1) + 1),0);
	$b_max = round(($kkm + ($rentang * 2)));
	$a_min = round(($kkm + ($rentang * 2) + 1),0);
	$a_max = 100;


	$ret = "";
	if ($nilai >= $d_min && $nilai <= $d_max) {
		$ret = "D";
	} else if ($nilai >= $c_min && $nilai <= $c_max) {
		$ret = "C";
	} else if ($nilai >= $b_min && $nilai <= $b_max) {
		$ret = "B";
	} else if ($nilai >= $a_min && $nilai <= $a_max) {
		$ret = "A";
	} else {
		$ret = "-";
	}
	return $ret;
}
function nilai_pre($nilai) {
	$CI 	=& get_instance();
	$kkm 	= intval($CI->config->item('kkm'));

	$rentang = round(((100-$kkm)/3),0);

	$d_min = 0;
	$d_max = round(($kkm - 1),0);
	$c_min = $kkm;
	$c_max = round(($kkm + $rentang), 0);
	$b_min = round(($kkm + ($rentang * 1) + 1),0);
	$b_max = round(($kkm + ($rentang * 2)),0);
	$a_min = round(($kkm + ($rentang * 2) + 1),0);
	$a_max = 100;

	$ret = "";
	if ($nilai >= $d_min && $nilai <= $d_max) {
		$ret = "Kurang";
	} else if ($nilai >= $c_min && $nilai <= $c_max) {
		$ret = "Cukup";
	} else if ($nilai >= $b_min && $nilai <= $b_max) {
		$ret = "Baik";
	} else if ($nilai >= $a_min && $nilai <= $a_max) {
		$ret = "Sangat Baik";
	} else {
		$ret = "Undefined";
	}
	return $ret;
}
function generate_menu($level, $is_wali=false) {
	$CI 	=& get_instance();
	$sesspre = $CI->config->item('session_name_prefix');
	$aktif 		= $CI->session->userdata($sesspre."valid");
	// <li><a href="'.base_url('santri/').'berkas"><i class="pe-7s-display2"></i><p>Tulisan Santri</p></a></li>
	$menu = '<li><a href="'.base_url('santri/').'"><i class="pe-7s-home"></i><p>Beranda</p></a></li>';
	if($aktif){
		if($CI->session->userdata("status") == "santri"){
			$menu .= 	'
						
						<li><a href="'.base_url('santri/').'berkas"><i class="pe-7s-cloud-upload"></i><p>Upload Berkas</p></a></li>
						<li><a href="'.base_url('santri/').'pembayaran"><i class="pe-7s-upload"></i><p>Upload Pembayaran</p></a></li>
						<li><a href="'.base_url('santri/').'tulisan"><i class="pe-7s-pen"></i><p>Tulisan Santri</p></a></li>
						<li><a href="'.base_url('santri/').'profil"><i class="pe-7s-users"></i><p>Profil Santri</p></a></li>
						<li><a href="'.base_url('santri/').'prestasi"><i class="pe-7s-graph1"></i><p>Prestasi Santri</p></a></li>
						<li><a href="'.base_url('santri/').'pelanggaran"><i class="pe-7s-anchor"></i><p>Pelanggaran</p></a></li>
						<li><a href="'.base_url('santri/').'kamar"><i class="pe-7s-culture"></i><p>Kamar</p></a></li>
						<li><a href="'.base_url('santri/').'spp"><i class="pe-7s-credit"></i><p>SPP</p></a></li>
						<li><a href="'.base_url('santri/').'home/ubah_password"><i class="pe-7s-user"></i><p>Ubah Password</p></a></li>
						';
		}else{
			$menu .= 	'
						<li><a href="'.base_url('santri/').'berkas"><i class="pe-7s-cloud-upload"></i><p>Upload Berkas</p></a></li>
						<li><a href="'.base_url('santri/').'pembayaran"><i class="pe-7s-upload"></i><p>Upload Pembayaran</p></a></li>
						<li><a href="'.base_url('santri/').'home/ubah_password"><i class="pe-7s-user"></i><p>Ubah Password</p></a></li>
						';
		}
	}else{
		$menu .= '<li><a href="'.base_url('santri/').'login"><i class="pe-7s-unlock"></i><p>Anda belum login..!</p></a></li>';
	}
	return $menu;
}
function j($data) {
	header('Content-Type: application/json');
	echo json_encode($data);
}
function tjs ($tgl, $tipe) {
	$pc_satu	= explode(" ", $tgl);
	if (count($pc_satu) < 2) {	
		$tgl1		= $pc_satu[0];
		$jam1		= "";
	} else {
		$jam1		= $pc_satu[1];
		$tgl1		= $pc_satu[0];
	}
	
	$pc_dua		= explode("-", $tgl1);
	$tgl		= $pc_dua[2];
	$bln		= $pc_dua[1];
	$thn		= $pc_dua[0];
	
	$bln_pendek		= array("Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Ags", "Sep", "Okt", "Nov", "Des");
	$bln_panjang	= array("Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember");
	
	$bln_angka		= intval($bln) - 1;
	
	if ($tipe == "l") {
		$bln_txt = $bln_panjang[$bln_angka];
	} else if ($tipe == "s") {
		$bln_txt = $bln_pendek[$bln_angka];
	}
	
	return $tgl." ".$bln_txt." ".$thn."  ".$jam1;
}
function jk($jk) {
	if ($jk == "P") {
		return "Perempuan";
	} else {
		return "Laki-laki";
	}
}
function status_anak($data) {
	if ($data == "AK") {
		return "Anak Kandung";
	} else if ($data == "AT") {
		return "Anak Tiri";
	} else if ($data == "AA") {
		return "Anak Angkat";
	} else {
		return "";
	}
}

function kekata($x) {
    $x = abs($x);
    $angka = array("", "satu", "dua", "tiga", "empat", "lima",
    "enam", "tujuh", "delapan", "sembilan", "sepuluh", "sebelas");
    $temp = "";
    if ($x <12) {
        $temp = " ". $angka[$x];
    } else if ($x <20) {
        $temp = kekata($x - 10). " belas";
    } else if ($x <100) {
        $temp = kekata($x/10)." puluh". kekata($x % 10);
    } else if ($x <200) {
        $temp = " seratus" . kekata($x - 100);
    } else if ($x <1000) {
        $temp = kekata($x/100) . " ratus" . kekata($x % 100);
    } else if ($x <2000) {
        $temp = " seribu" . kekata($x - 1000);
    } else if ($x <1000000) {
        $temp = kekata($x/1000) . " ribu" . kekata($x % 1000);
    } else if ($x <1000000000) {
        $temp = kekata($x/1000000) . " juta" . kekata($x % 1000000);
    } else if ($x <1000000000000) {
        $temp = kekata($x/1000000000) . " milyar" . kekata(fmod($x,1000000000));
    } else if ($x <1000000000000000) {
        $temp = kekata($x/1000000000000) . " trilyun" . kekata(fmod($x,1000000000000));
    }     
        return $temp;
}
 
 
function terbilang2($x, $style=4) {
    if($x<0) {
        $hasil = "minus ". trim(kekata($x));
    } else {
        $hasil = trim(kekata($x));
    }     
    switch ($style) {
        case 1:
            $hasil = strtoupper($hasil);
            break;
        case 2:
            $hasil = strtolower($hasil);
            break;
        case 3:
            $hasil = ucwords($hasil);
            break;
        default:
            $hasil = ucfirst($hasil);
            break;
    }     
    return $hasil;
}

function potong($teks) {
	$pc_spasi = explode(" ", $teks);

	$terakhir = $pc_spasi[(sizeof($pc_spasi)-1)];
	$huruf_pertama_terakhir = substr($terakhir,0,1).".";
	
	$tekss = '';
	if ((strlen($teks)) > 30) {

		$tekss = '';
		for ($i = 0; $i < (sizeof($pc_spasi) - 1); $i++) {
			$tekss .= $pc_spasi[$i]." ";
		}

		$tekss .= " ".$huruf_pertama_terakhir;
	} else {
		$tekss = $teks;
	}

	return $tekss;
}