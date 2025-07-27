/**
 *
 * You can write your JS code here, DO NOT touch the default style file
 * because it will make it harder for you to update.
 * 
 */

"use strict";
let base_url = window.location.origin + '/' + window.location.pathname.split ('/') [1] + '/';
var spinner = "<p align='center'><br><br><br><br><i class='icon-spinner9 spinner mr-2' style='width: auto;margin-right: 10px;'></i><br><br><br></p>";
var spinner_bg_1 = "<p align='center'><br><br><br><br><img alt='' src='"+base_url+"assets/images/loaders/loader6.gif'><br><br><br><br></p>";

var habiscuy;
$(document).on({
    ajaxStart: function() { 
        habiscuy = setTimeout(function(){
            $("#LoadingAjax").html("<div class='LoadingContent'><i class='icon-spinner9 spinner mr-2'></i> Please Wait ....</div>");
            $("#LoadingAjax").show();
        }, 500);
    },
    ajaxStop: function() { 
        clearTimeout(habiscuy);
        $("#LoadingAjax").hide();
    }
});

$(document).ready(function(){
    $('.refreshCaptcha').on('click', function(){
        reloadCapctha();
    });
    
    $(".toggle-password").click(function() {
        $(this).toggleClass("fa-eye fa-eye-slash");
        var input = $($(this).attr("toggle"));
        if (input.attr("type") == "password") {
            input.attr("type", "text");
        } else {
            input.attr("type", "password");
        }
    }); 

});



function reloadCapctha(){
    

    $('#loader').fadeIn('fast');
    $('#captImg').html("<font class='ml-3' style='min-height:10rem'>&nbsp; &nbsp; &nbsp;<i class='fa fa-spinner fa-3x fa-spin'></i>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</font>"); 
    setTimeout(function(){
            $('#loader').fadeOut('slow');
            $('#captImg').fadeIn('slow');
    }, 1500);

    $.ajax({
        type:"GET",
        dataType:'json',
        url: base_url+'auth/refresh_captcha',
        success: function(json){
            $('#captImg').html("<img src='"+json.path+"' width='"+json.width+"'  height='"+json.height+"' >");
            $('#captcha_kode').val(json.word);
        }
    })
    $('#txt_captcha').val('');
    
}

function modalDialogRemoveClass(){
    $('.modal-dialog').removeClass('modal-xs modal-sm modal-md modal-lg');
    $('.modal-header').removeClass('bg-warning bg-success bg-danger bg-info');
    $('#ModalContent').html("");
    $('#ModalFooter').html("");
}

function cek_required(id_elm){
    var res = id_elm.split(",");
    var i;
    for (i = 0; i < res.length; i++) { 
        var txt_input = $(res[i]).val();
        var idne = $(res[i]).attr('id');
        $("#"+idne+"_error").remove();
        $("#"+idne).after("<label id='"+idne+"_error' class='error'></label>");
        
        if (txt_input == ""){
            $($(res[i]).attr('toggle')).html("<font color='red'> this field is required ! </font>");
        } else {
            $("#"+idne+"_error").remove();
            $($(res[i]).attr('toggle')).html("");
        }  
    }
}

function enableBtn(btn_list, btn_add, btn_edit, btn_del, btn_pdf, btn_exl){
    $('#btn_list').fadeInOrOut(btn_list); 
    $('#btn_add').fadeInOrOut(btn_add); 
    $('#btn_edit').fadeInOrOut(btn_edit); 
    $('#btn_del').fadeInOrOut(btn_del); 
    $('#btn_pdf').fadeInOrOut(btn_pdf); 
    $('#btn_exl').fadeInOrOut(btn_exl); 
}
        
function growlWarning(pesan) {
    jQuery.gritter.add({
        title: 'Warning !',
        text: pesan,
        class_name: 'growl-warning',
        sticky: false,
        time: 5000
    });
    return false;
}

function growlError(pesan) {
    jQuery.gritter.add({
        title: 'Attention !',
        text: pesan,
        class_name: 'growl-danger',
        sticky: false,
        time: 5000
    });
    return false;
}

function growlSuccess(pesan) {
    jQuery.gritter.add({
        title: 'Success !',
        text: pesan,
        class_name: 'growl-success',
        sticky: false,
        time: 5000
    });
    return false;
}

function growlInfo(pesan) {
    jQuery.gritter.add({
        title: 'Information !',
        text: pesan,
        class_name: 'growl-info',
        sticky: false,
        time: 5000
    });
    return false;
}

function growlSuccessOverlay(pesan) {
    new Noty({
        theme: ' success bg-success text-white alert-styled-left p-0',
        text: 'Success !! \n ' + pesan,
        type: 'success',
        modal: true,
        closeWith: ['button']
    }).show();
}


function notyConfirmDelete() {
    var notyConfirm = new Noty({
        text: '<h6 class="mb-3">Yakin hapus data </h6><label> akan dihapus</label>',
        timeout: false,
        modal: true,
        layout: 'center',
        closeWith: 'button',
        type: 'confirm',
        buttons: [
            Noty.button('Cancel', 'btn btn-link', function () {
                notyConfirm.close();
            }),

            Noty.button('Submit <i class="icon-trash ml-2"></i>', 'btn bg-blue ml-1', function () {
                alert('Submitted!');
                notyConfirm.close();
            },
                { id: 'button1', 'data-status': 'ok' }
            )
        ]
    }).show();
}

function notyLoading(pesan) {
    new Noty({
        theme: ' bg-warning text-white alert-styled-left p-0',
        text: pesan,
        modal: true,
        layout: 'center',
        type: 'warning',
        callback: {
            onShow: function () { },
            afterShow: function () { },
            onClose: function () { },
            afterClose: function () { },
            onCloseClick: function () { },
        },

        buttons: false
    }).show();
}

function jGrowlLoading(pesan) {
    $('body').find('.jGrowl').attr('class', '').attr('id', '').hide();
    $.jGrowl(pesan, {
        position: 'center',
        theme: 'bg-danger',
        modal: true,
    });
}

function responSuccessLogin(status, pesan, url_direct, token) {

    if (status == 0) { //input false
        reloadCapctha();
        growlWarning(pesan);
    }

    if (status == 1) { //Captcha false
        reloadCapctha();
        growlError(pesan);
    }

    if (status == 2) { //Query Error
        reloadCapctha();
        growlError(pesan);
        $('#txt_username, #txt_userpass').val('');
    }

    if (status == 3) { //Captcha false
        reloadCapctha();
        growlError(pesan);
        window.location.href = url_direct;
    }

    if (status == 4) { //Success Login
        growlSuccess(pesan);
        window.location.href = url_direct;
    }

    $('input[name=csrf_test_name]').val(token);
}

function alertRespon(status, pesan) {
    if (status == "success") {
        var bgcolor = "alert-success";
        var title = "Sukses !! ";
    } else if (status == "warning") {
        var bgcolor = "alert-warning";
        var title = "Peringatan !! ";
    } else if (status == "error") {
        var bgcolor = "alert-danger";
        var title = "Gagal !! ";
    } else {
        var bgcolor = "alert-info";
        var title = "Informasi !!";
    }

    $("#alertRespon").remove();
    $('#responProses').fadeIn('slow');
    $("#responProses").append("<div id='alertRespon' class='alert " + bgcolor + "' ><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button><strong>" + title + "</strong>" + pesan + "</div>");

    setTimeout(function () {
        $('#responProses').fadeOut('slow');
    }, 2500);
}

function responSuccessLoginAlert(status, pesan, url_direct, token) {

    if (status == 0) { //input false
        reloadCapctha();
        alertRespon("warning", pesan);
    }

    if (status == 1) { //Captcha false
        reloadCapctha();
        alertRespon("error", pesan);
    }

    if (status == 2) { //Query Error
        reloadCapctha();
        alertRespon("error", pesan);
        $('#txt_username, #txt_userpass').val('');
    }

    if (status == 3) { //Captcha false
        reloadCapctha();
        alertRespon("error", pesan);
        window.location.href = url_direct;
    }

    if (status == 4) { //Success Login
        alertRespon("success", pesan);

        // swal({
        //     title: "Login Success",
        //     text: pesan,
        //     type: "success"
        // }).then(function () {
        //     window.location.href = url_direct;
        // });
        window.location.href = url_direct;

    }

    $('input[name=csrf_test_name]').val(token);
}


function responSuccessAlert(status, pesan, url_direct, token) {

    if (status == 0) { //input false
        reloadCapctha();
        alertRespon("warning", pesan);
    }

    if (status == 1) { //Captcha false
        reloadCapctha();
        alertRespon("error", pesan);
    }

    if (status == 2) { //Query Error
        reloadCapctha();
        alertRespon("error", pesan);
        $('#txt_username, #txt_userpass').val('');
    }

    if (status == 3) { //Captcha false
        reloadCapctha();
        alertRespon("error", pesan);
        window.location.href = url_direct;
    }

    if (status == 4) { //Success
        alertRespon("success", pesan);

        // swal({
        //     title: "Success",
        //     text: pesan,
        //     type: "success"
        // }).then(function () {
        //     window.location.href = url_direct;
        // });
        window.location.href = url_direct;

    }

    $('input[name=csrf_test_name]').val(token);
}

function responProses(status, pesan, token, captcha, url_direct) {
    if (captcha == 1) {
        reloadCapctha();
    }

    if (status == 0) { //input false
        growlWarning(pesan);
    }

    if (status == 1) { //Captcha false
        growlError(pesan);
    }

    if (status == 2) { //Query Error
        growlError(pesan);
    }

    if (status == 3) { //Captcha false
        growlError(pesan);
    }

    if (status == 4) { //Success
        if (url_direct == "") {
            // swal({
            //     title: "Thank You",
            //     text: pesan,
            //     type: "success"
            // });
        } else {
            // swal({
            //     title: "Thank You",
            //     text: pesan,
            //     type: "success"
            // }).then(function () {
            //     window.location.href = url_direct;
            // });
            window.location.href = url_direct;

        }
    }
    //growlSuccess(pesan);

    $('input[name=csrf_test_name]').val(token);
}


function responseGrowl(status, pesan, token, captcha, url_direct) {
    if (captcha == 1) {
        reloadCapctha();
    }

    if (status == 0) { //input false
        growlWarning(pesan);
    }

    if (status == 1) { //Captcha false
        growlError(pesan);
    }

    if (status == 2) { //Query Error
        growlError(pesan);
    }

    if (status == 3) { //Captcha false
        growlError(pesan);
    }

    if (status == 4) { //Success
        if (url_direct == ""){
            growlSuccess(pesan);
        } else {
            growlSuccess(pesan);
            window.location.href = url_direct;
        }
    }
    //growlSuccess(pesan);

    $('input[name=csrf_test_name]').val(token);
}