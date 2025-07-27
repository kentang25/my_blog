<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

   function getReferer() {
        $ci =& get_instance();
        $refer = isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : base_url().$ci->uri->segment(1);
        echo($refer);
   }
	function _getDistanceBetweenPoints($lokasi) {
	// function _getDistanceBetweenPoints($lat1, $lon1, $lat2, $lon2) {
		
		$lokasi = explode(",", $lokasi);
		$lat1=$lokasi[0];
		// return $lat1;
		$lon1=$lokasi[1];
		$lat2=$lokasi[2];
		$lon2=$lokasi[3];

	    $theta = $lon1 - $lon2;
	    $miles = (sin(deg2rad($lat1)) * sin(deg2rad($lat2))) + (cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta)));
	    $miles = acos($miles);
	    $miles = rad2deg($miles);
	    $miles = $miles * 60 * 1.1515;
	    $kilometers = $miles * 1.609344;
	    $meter = $kilometers*1000;
	    return $meter;
	}

	function _hitungJarak($lokasi) {
		$strJarak="<font color='black'>%jarak</font>";
		$jarak=_getDistanceBetweenPoints($lokasi);


        if($jarak > MAX_JARAK_METER){
          $strJarak = str_replace("black","red",$strJarak);
        }
        $satuan = " m";
        if ($jarak>999) {
          $jarak= $jarak/1000;
          $satuan = " km";
        }
        $jarak = number_format($jarak,2) .$satuan;

		$strJarak = str_replace("%jarak",$jarak,$strJarak);
	    return $strJarak;
	}

	function _levelOpd($level){
		switch ($level) {
			case '1':
				echo "topadmin";
				break;

			case '2':
				echo "admin";
				break;

			case '3':
				echo "PPKOM";
				break;

			case '4':
				echo "PPTK";
				break;

			case '5':
				echo "Pengurus Barang Pengguna";
				break;

			case '6':
				echo "Kuasa Pengguna Barang / Pejabat Penatausahaan Pengguna Barang ";
				break;

			case '7':
				echo "Kuasa Pengguna Barang / Pejabat Penatausahaan Pengguna Barang";
				break;
			
			default:
				echo "kosong";
				break;
		}
	}

