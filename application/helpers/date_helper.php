<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
function _tglIndo($tgl){
  $arrBulan=array("","Januari","Febuari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","Nopember","Desember");
  $tglBaru=explode("-",$tgl);
  $tgl=$tglBaru[2];
  $bln=(int)$tglBaru[1];
  $thn=$tglBaru[0];
  $bln=$arrBulan[$bln];
  $ubahTanggal="$tgl $bln $thn";
  return $ubahTanggal;
}
function _tglEng($tgl){
  // 17-11-2018
  $tgl=explode("-", $tgl);
  $tanggal = $tgl[0];
  $bulan = $tgl[1];
  $tahun = $tgl[2];
  return $tahun.'-'.$bulan.'-'.$tanggal;
}
function _tglInd($tgl){
  $tgl=explode("-", $tgl);
  $tanggal = $tgl[2];
  $bulan = $tgl[1];
  $tahun = $tgl[0];
  return $tanggal.'-'.$bulan.'-'.$tahun;
}
function _getDayOfWeek($tgl){
  $arrHari=array("Minggu","Senin","Selasa","Rabu","Kamis","Jumat","Sabtu");
  if ($tgl=="") {
    return "";
  }
  return $arrHari[$tgl];
}
function _Bulan($val){
  $arrBulan=array("","Januari","Febuari","Maret","April","Mei","Juni","Juli","Agustus","September","Oktober","Nopember","Desember");
  $bln=$arrBulan[(int)$val];
  return $bln;
}