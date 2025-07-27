<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class M_laporan extends CI_Model {

	function rekapTemuan($id_periode){
		return $this->db->query("SELECT
						    ami.id_ami,
						    m_unit.*,
						    count(case adt.kts when 'Minor' then 1 else null end) as Minor,
						    count(case adt.kts when 'Mayor' then 1 else null end) as Mayor,
						    count(case adt.kts when 'Observasi' then 1 else null end) as Observasi
						FROM
						    `m_unit`
						LEFT JOIN ami ON ami.id_unit = m_unit.id_unit
						LEFT JOIN unit ON unit.id_unit = m_unit.id_unit
						LEFT JOIN audit as adt ON adt.id_ami = ami.id_ami
						WHERE ami.id_periode='".$id_periode."'
						GROUP BY m_unit.id_unit");		
	}

	function rekapRangking($id_periode){
		return $this->db->query("SELECT
						    ami.id_ami,
						    m_unit.*,
						    sum(case adt.kts when 'Minor' then adt.nilai_kts else null end) as Minor,
						    sum(case adt.kts when 'Mayor' then adt.nilai_kts else null end) as Mayor,
						    sum(case adt.kts when 'Observasi' then adt.nilai_kts else null end) as Observasi
						FROM
						    `m_unit`
						LEFT JOIN ami ON ami.id_unit = m_unit.id_unit
						LEFT JOIN unit ON unit.id_unit = m_unit.id_unit
						LEFT JOIN audit as adt ON adt.id_ami = ami.id_ami
						WHERE ami.id_periode='".$id_periode."'
						GROUP BY m_unit.id_unit");		
	}
	
}
