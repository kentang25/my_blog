<div class="main-content">
    <section class="section">
      <div class="section-header">
        <h1><a href="<?= base_url("admin/master/unit") ?>" class="btn btn-danger btn-sm">
                     <i class="fa fa-arrow-left" aria-hidden="true"></i>
                  </a> Sub Unit <?= $unit->nama_unit ?></h1>
        <div class="section-header-breadcrumb">
          <div class="breadcrumb-item active"><a href="<?= base_url("admin") ?>">Dashboard</a></div>
          <div class="breadcrumb-item">Master</div>
          <div class="breadcrumb-item">Sub Unit</div>
        </div>
      </div>

      <div class="section-body">
        <p class="section-lead">
          Data List Sub Unit.
        </p>

        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
              	<a style="display:none" id="massDelete" href="#" class="btn btn-icon icon-left btn-danger mr-1"><i class="fa fa-trash"></i> Delete Selected</a>
                <a  id="addData" href="#" class="btn btn-icon icon-left btn-primary"><i class="far fa-edit"></i> Add Data</a>
              </div>
              <div class="card-body">
                <div class="table-responsive">
                  <table class="table table-striped" id="table-1" width="100%">
                    <thead>                                 
                      <tr>
                        <th width="5%"><input type="checkbox" name="select_all" value="1" id="select-all"></th>
                        <th width="5%">No</th>
                        <th>Nama Sub Unit</th>
                        <th>Nama  Unit</th>
                        <th>Deskripsi</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody></tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
       
      </div>
    </section>
</div>

<!-- Form Modal Add -->
<div class="modal fade" tabindex="-1" role="dialog" id="addModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form id="formAdd" >
      <input type="hidden" name="id_unit" value="<?= $unit->id_unit ?>">
      <div class="modal-header">
        <h5 class="modal-title">Tambah Sub Unit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		    <div class="alert alert-danger alert-dismissible show fade print-error-msg" style="display:none">
            <!-- <div class="alert-icon"><i class="far fa-lightbulb"></i></div> -->
            <div class="alert-body">
              <button class="close" data-dismiss="alert">
                  <span>&times;</span>
              </button>
              <span class="err"></span>
            </div>
          </div>      
			<div class="form-group">
			<label>Nama Sub Unit</label>
				<div class="input-group">
				  <div class="input-group-prepend">
				    <div class="input-group-text">
				      <i class="fas fa-font"></i>
				    </div>
				  </div>
				  <input type="text" class="form-control" placeholder="Nama Sub Unit" name="nama_subunit" required>
				</div>
			</div>
			<div class="form-group">
			<label>Deskripsi</label>
			<div class="input-group">
			  <div class="input-group-prepend">
			    <div class="input-group-text">
			      <i class="fas fa-info"></i>
			    </div>
			  </div>
			  <textarea class="form-control" placeholder="Deskripsi" name="deskripsi"></textarea>
			</div>
			</div>

      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary loadingSave">Simpan</button>
      </div>
	</form>
    </div>
  </div>
</div>


<!-- Form Edit  -->
<div class="modal fade" tabindex="-1" role="dialog" id="editModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    <form id="formEdit" >
      <input type="hidden" name="id_subunit">
      <div class="modal-header">
        <h5 class="modal-title">Edit Sub Unit</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="alert alert-danger alert-dismissible show fade print-error-msg-edit" style="display:none">
        <!-- <div class="alert-icon"><i class="far fa-lightbulb"></i></div> -->
        <div class="alert-body">
          <button class="close" data-dismiss="alert">
              <span>&times;</span>
          </button>
          <span class="err-edit"></span>
        </div>
      </div>
			<div class="form-group">
			<label>Nama Sub Unit</label>
			<div class="input-group">
			  <div class="input-group-prepend">
			    <div class="input-group-text">
			      <i class="fas fa-font"></i>
			    </div>
			  </div>
			  <input type="text" class="form-control" placeholder="Nama Sub Unit" name="nama_subunit">
			</div>
			</div>
			<div class="form-group">
			<label>Deskripsi</label>
			<div class="input-group">
			  <div class="input-group-prepend">
			    <div class="input-group-text">
			      <i class="fas fa-info"></i>
			    </div>
			  </div>
			  <textarea class="form-control" placeholder="Deskripsi" name="deskripsi"></textarea>
			</div>
			</div>
      </div>
      <div class="modal-footer bg-whitesmoke br">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary loadingSave">Simpan</button>
      </div>
	</form>
    </div>
  </div>
</div>


<script>
    let url = "<?= base_url('admin/master/unit/get_data_subunit/').$unit->id_unit;?>";
    var table = null;
    var token = "<?= $this->security->get_csrf_hash();?>";
	  var csrf = $("input[name=<?php echo $this->security->get_csrf_token_name();?>]");
    let centang = $(".centang:checked");
    $(document).ready(function() {
          function showMassDelete(){
              var data_pk = [];
              $(".centang:checked").each(function(i) {
                  data_pk[i] = $(this).val();
              });

              if(data_pk.length > 0){
                $("#massDelete").fadeIn();
              }else{
                $("#massDelete").fadeOut();
              }
          }

         $('#select-all').on('click', function(){
            var rows = table.rows({ 'search': 'applied' }).nodes();
            $('input[type="checkbox"]', rows).prop('checked', this.checked);

            showMassDelete();
         });

         $('table tbody').on('change', 'input[type="checkbox"]', function(){
            if(!this.checked){
               var el = $('#select-all').get(0);
               if(el && el.checked && ('indeterminate' in el)){
                  el.indeterminate = true;
               }
            }
            showMassDelete();
         });

        table = $('table').DataTable({
            processing: true,
            responsive:false,
            serverSide: true,
            ordering: true, 
            order: [[ 1, 'desc' ]], 
            ajax: {
                "url": url,
                "type": "POST",
                "data": function ( d ) {
                    d.<?= $this->security->get_csrf_token_name();?> = token;
                },
                dataSrc: function(response){
                    token=response.csrf_test_name;
                    csrf.val(response.csrf_test_name);
                	return response.data;
                }
            },
            'columnDefs': [{
               'targets': 0,
               'searchable': false,
               'orderable': false,
               'className': 'dt-body-center',
               'render': function (data, type, full, meta){
                   return `<input class="form-input centang" type="checkbox" name="id[]" value="${data}">`;
               }
            }],
            select: {
                style: 'os',
                selector: 'td:first-child',
                className: 'row-selected'
            },
            deferRender: true,
            aLengthMenu: [[5, 10, 50],[ 5, 10, 50]], 
            columns: [
                {data: "id_subunit" },  
                {data: 'id_subunit',"sortable": false, 
                    render: function (data, type, row, meta) {
                        return meta.row + meta.settings._iDisplayStart + 1;
                    }  
                },
                { data: "nama_subunit" },  
                { data: "nama_unit"},  
                { data: "deskripsi",
                  sortable: false,
                  render: function( data, type, row, meta ) {
                    if(data){
                      return data;
                    }else{
                      return "-";
                    }
                  } 
                },  
                { data: "id_subunit",
                  sortable: false,
                  render: function( data, type, row, meta ) {
	                	let str =`<a href="#" class="btn btn-sm btn-icon btn-primary" id="editData" data-row='${JSON.stringify(row)}'><i class="far fa-edit"></i></a>`;
	                	str += ` `;
	                	str += `<a href="#" class="btn btn-sm btn-icon btn-danger" id="hapusData" data-id='${data}'><i class="fas fa-trash"></i></a>`;
	                	return str;
	                }
                },
            ],
        });
        // csrf datatable
        table.on('xhr.dt', function ( e, settings, json, xhr ) {
            token = json.<?=$this->security->get_csrf_token_name();?>;
        } );



        //ADD AJAX
        $('#addData').on('click', function (e) {
          $(".print-error-msg").hide(); 
          $('#addModal').modal('show');  
          	//SELECT2
				$('#formAdd .select2').select2({
					dropdownParent: $('#addModal'),
			        // placeholder: "Pilih Fakultas",
			        // allowClear: true,
			        // delay: 200,
			        // ajax: {
			        //     url: '<?= base_url().'admin/master/unit/selectFakultas' ?>',
			        //     dataType: 'json',
			        //     cache: true,
			        //     data: function(params) {
			        //     	console.log(params.page)
			        //         return { 
			        //             term: params.term || '',
			        //             page: params.page || 1,
			        //             <?= $this->security->get_csrf_token_name(); ?>:token
			        //         }
			        //     },
			        //     processResults: function(data, params) {
			        //     	console.log(params)
           //          		token=data.csrfToken.csrfHash;
			        //         params.page = params.page || 1;
			        //         var result = $.map(data.results, function (item) { return { id: item.id_unit, text: item.text }});
			        //         return { 
			        //         	results: result,
			        //             pagination: {
			        //                  more:data.count > data.endCount
			        //             } 
			        //         };
			        //     },
			        //     error: function (request, status, error) {
		         //            swal('Gagal', 'Terjadi Kesalahan!', 'error');
		         //        }
			        // }
			    });
        });

        $('#formAdd').submit(function (e) {
          e.preventDefault();
          $(".loadingSave").attr('disabled', true); 
          $(".loadingSave").html('<i class="fa fa-spinner fa-spin"></i> &nbsp; Proses ... ');

          let formData = $(this).serializeArray();
          formData.push({ name: '<?= $this->security->get_csrf_token_name(); ?>', value: token });
            $.ajax({
                  url: "<?= base_url('admin/master/unit/save_subunit')?>",
                  type: "POST",
                  dataType:'json',
                  data:formData,
                  success: function(json){
                    token=json.csrfToken.csrfHash;
                    if(json.statusCode == 200){
                      $("table").DataTable().ajax.reload();
                      $("[data-dismiss=modal]").trigger({ type: "click" });
                      $("#formAdd")[0].reset();
                      swal('Success', 'Berhasil!', 'success');
                    }else if(json.statusCode == 500){
                      swal('Gagal', 'Terjadi Kesalahan!', 'error');
                    }else if(json.statusCode == 505){
                      $(".print-error-msg").show();
                      $(".err").html(json.error);
                    }        

                    $(".loadingSave").html("Simpan ");
                    $(".loadingSave").attr('disabled', false); 
                  },
                  error: function (request, status, error) {
                      $(".loadingSave").html("Simpan ");
                      $(".loadingSave").attr('disabled', false); 
                  }
              });
        });

        //EDIT AJAX

        $('table').on('click', '#editData', function (e) {
		  $(".print-error-msg-edit").hide();
          let row = JSON.parse($(this).attr('data-row'));
           $('#editModal').modal('show');  
          	//SELECT2
			$('#formEdit .select2').select2({
				dropdownParent: $('#editModal'),
		    });
          // console.log(row)
          $("#formEdit input[name=id_subunit]").val(row.id_subunit);
          $("#formEdit input[name=nama_subunit]").val(row.nama_subunit);
          $("#formEdit textarea[name=deskripsi]").val(row.deskripsi);
          $("#formEdit .select2").val(row.id_unit).trigger('change');

          // let newOption = new Option(data.text, data.id, false, false);
	        // $('#formEdit .page_barang_select2').append(newOption).trigger('change');
	        // $('#formEdit .page_barang_select2').prop('disabled', true);
          $('#editModal').modal('show');    
        });

        $('#formEdit').submit(function (e) {
          e.preventDefault();
          $(".loadingSave").attr('disabled', true); 
          $(".loadingSave").html('<i class="fa fa-spinner fa-spin"></i> &nbsp; Proses ... ');

          let formData = $(this).serializeArray();
          formData.push({ name: '<?= $this->security->get_csrf_token_name(); ?>', value: token });
            $.ajax({
                  url: "<?= base_url('admin/master/unit/update_subunit')?>",
                  type: "POST",
                  dataType:'json',
                  data:formData,
                  success: function(json){
                    token=json.csrfToken.csrfHash;
                    if(json.statusCode == 200){
                      $('table').DataTable().ajax.reload();
                      $("[data-dismiss=modal]").trigger({ type: "click" });
                      document.getElementById('formEdit').reset();
                      swal('Success', 'Berhasil!', 'success');
                    }else if(json.statusCode == 500){
                      swal('Gagal', 'Terjadi Kesalahan!', 'error');
                    }else if(json.statusCode == 505){
                      $(".print-error-msg-edit").show();
                      $(".err-edit").html(json.error);
                    }                

                    $(".loadingSave").html("Simpan ");
                    $(".loadingSave").attr('disabled', false); 
                  },
                  error: function (request, status, error) {
                      $(".loadingSave").html("Simpan ");
                      $(".loadingSave").attr('disabled', false); 
                  }
              });
        });

        //HAPUS
        $('table').on('click', '#hapusData', function (e) {
          let id = $(this).attr('data-id');
          swal({
            title: 'Are you sure?',
            text: 'Once deleted, you will not be able to recover !',
            icon: 'warning',
            buttons: true,
            dangerMode: true,
          })
          .then((willDelete) => {
            if (willDelete) {
              $.ajax({
                  url: "<?= base_url('admin/master/unit/destroy_subunit')?>",
                  type: "POST",
                  dataType:'json',
                  data:{id:id,<?= $this->security->get_csrf_token_name(); ?>:token},
                  success: function(json){
                    token=json.csrfToken.csrfHash;
                    if(json.statusCode == 200){
                      $('table').DataTable().ajax.reload();
                       swal('Success', {
                          icon: 'success',
                        });
                    }else if(json.statusCode == 500){
                        swal('Gagal', 'Terjadi Kesalahan!', 'error');
                    }              
                  },
                  error: function (request, status, error) {
                      swal('Gagal', 'Terjadi Kesalahan!', 'error');
                  }
              });
            } 
          });
        });
        
        //DELETE SELCTED
        $("#massDelete").on("click",function(){
            var idDelete = [];
            $("input[type=checkbox]:checked").each(function(i) {
                idDelete[i] = $(this).val();
            });
            
            swal({
              title: 'Are you sure?',
              text: 'Once deleted, you will not be able to recover !',
              icon: 'warning',
              buttons: true,
              dangerMode: true,
            })
            .then((willDelete) => {
              if (willDelete) {
                $.ajax({
                    url: "<?= base_url('admin/master/unit/mass_delete_subunit')?>",
                    type: "POST",
                    dataType:'json',
                    data:{id:idDelete,<?= $this->security->get_csrf_token_name(); ?>:token},
                    success: function(json){
                      token=json.csrfToken.csrfHash;
                      if(json.statusCode == 200){
                        $('#select-all').prop('checked', false);
                        $("#massDelete").fadeOut();
                        $('table').DataTable().ajax.reload();
                         swal('Success', {
                            icon: 'success',
                          });
                      }else if(json.statusCode == 500){
                          swal('Gagal', 'Terjadi Kesalahan!', 'error');
                      }              
                    },
                    error: function (request, status, error) {
                        swal('Gagal', 'Terjadi Kesalahan!', 'error');
                    }
                });
              } 
            });
        })

    });//end document ready

	

</script>
   