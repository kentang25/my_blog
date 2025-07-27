<?php 
    defined('BASEPATH') or exit( 'No direct script access allowed' );

class Mysession
{
    public function __construct()
    {
        if (version_compare(phpversion(), '5.4.0', '<')) {
             if(session_id() == '') {
                if (!isset($_SESSION)) { session_start(); }
             }
         } else {
            if (session_status() == PHP_SESSION_NONE) {
                session_start(); 
            }
         }
    }

    public function set_userdata( $value, $key='')
    {
        // jika $value adalah array maka dibedakan perlakuannya
        if (is_array($value)) {
            foreach ($value as $kunci => $nilai) {
                $_SESSION[$kunci] = $nilai;
            }
        } else {
            $_SESSION[$key] = $value; 
        }
    }

    public function userdata( $key )
    {        
        return isset( $_SESSION[$key] ) ? $_SESSION[$key] : null;           
    }

    public function regenerateId( $delOld = false )
    {
        session_regenerate_id( $delOld );
    }

    public function unset_userdata( $key , $array = null)
    {
        if ($array != null) {
            foreach ($array as $kunci => $nilai) {
                unset( $_SESSION[$key] );
            }
        } else {
            unset( $_SESSION[$key] );
        }        
    }

    public function unset_all(){
        session_unset();
    }
}