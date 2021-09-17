@extends('backend.layout.layout')

@section('title')
     Blog
@endsection

@section('css')
<style>
  .box{
     display: none;
      
  }


 </style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
  $("#blog_type").change(function(){
      $(this).find("option:selected").each(function(){
          var optionValue = $(this).attr("value");
          if(optionValue){
              $(".box").not("." + optionValue).hide();
              $("." + optionValue).show();
          } else{
              $(".box").hide();
          }
      });
  }).change();
});
</script>
@endsection



@section('content')


  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">Blog</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Blog list</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->
    
    <section class="content">
      
        <div class="container-fluid">
          @include('backend.layout.alert')
          <div class="row">
            
            <div class="col-12">
              
              <div class="card">
                
                <div class="card-header">
                  
                  <h3 class="card-title">Blog list</h3>
                  
                  <div class="card-tools">
                    <div class="input-group input-group-sm" style="width: 150px;">
                      <input type="text" id="search_title" name="search_title"  class="form-control float-right" placeholder="Search">
  
                      <div class="input-group-append">
                        <button type="submit" class="btn btn-default">
                          <i class="fas fa-search"></i>
                        </button>
                      </div>
                    </div>
                    <br>
                    <a href="javascript:void(0)" id="create-new-user" class="btn btn-md bg-gradient-primary" 
                    style="float:right">Add blog</a>
                  </div>
                  
                </div>
                <!-- /.card-header -->
                
                <div class="card-body table-responsive p-0">
                  
                  <table class="table table-hover text-nowrap">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Image</th>
                        <th>Title</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    <tbody id="data_crud" >
                      @foreach($allData as $singleData)
                      <tr id="table_id_{{ $singleData->id }}" >
                        <td>{{$singleData->id}}</td>
                        <td><img src="{{asset('BlogFolder/'.$singleData->blog_thumnail)}}" style="width:100px"></td>
                        <td>{{$singleData->blog_title}}</td>
                        
                        <td><div class="btn-group">
                            <a href="javascript:void(0)" id="edit-user" data-id="{{ $singleData->id }}" class="btn btn-primary" >
                                Edit
                            </a>
                            <a href="javascript:void(0)" id="delete-user" data-id="{{ $singleData->id }}" class="btn btn-danger">
                              Delete
                            </a>
                          </div>
                        </td>
                      </tr>
                      @endforeach
                     
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
          </div>
        
         
        </div><!-- /.container-fluid -->
      </section>
    
    <form id="dataForm" name="dataForm" enctype="multipart/form-data" >	
      <div class="modal fade" id="exampleModalScrollable" style="display: none;" aria-hidden="true">
        <div class="modal-dialog  modal-xl">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title" id="exampleModalScrollableTitle" ></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">×</span>
              </button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="data_id" id="data_id">
                <label>Category: </label>
                <div class="form-group">
                      <select class="custom-select form-control" id="category_id" 
                      data-placeholder="Type to search cities" name="category_id" required>
                         @foreach($allData2 as $singleData)
                         <option value="{{$singleData->id}}">{{$singleData->category_name}}</option>
                         @endforeach
                      </select>
                </div>
                <label>Title: </label>
                <div class="form-group">
                        <input type="text" placeholder="Enter Blog Title" class="form-control" id="blog_title" name="blog_title" required >
                </div>
                
                
                <label>Thumbnail: </label>
                <div class="form-group">
                <center>
                <img id="image_preview_container" src="{{asset('asadImage/image-preview.png')}}"
                     alt="preview image" style="max-height: 150px;">
                 </center>
                        <input type="file" placeholder="Enter Image" class="form-control" id="blog_thumnail" name="blog_thumnail" required >
                </div>
                
                <label>Short Description: </label>
                <div class="form-group">
                        <textarea  placeholder="Enter Short Description" class="form-control" id="blog_short_description" name="blog_short_description" ></textarea>
                </div>

                <label>Description: </label>
                <div class="form-group">
                        <textarea  placeholder="Enter Description" class="form-control" id="blog_description" name="blog_description" ></textarea>
                </div>
                <label>Type: </label>
                <div class="form-group">
                  <select class="custom-select form-control" id="blog_type" data-placeholder="Type to search cities" name="blog_type">
                     <option value="0">Default</option>
                     <option value="1">Wistia</option>
                  </select>
                </div>
                <div class="1 box">
                  <label>Wistia Code: </label>
                      <div class="form-group">
                        <textarea  placeholder="Enter Embeded link" class="form-control" id="wistia_link" name="wistia_link" ></textarea>
                      </div>
                 </div>
                <label>Status: </label>
                <div class="form-group">
                      <select class="custom-select form-control" id="status" data-placeholder="Type to search cities" name="status">
                         <option value="0">Inactive</option>
                         <option value="1" selected>Active</option>
                      </select>
                </div>
                
                
                <input type="hidden" name="blog_description_hid" id="blog_description_hid" >

            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary" id="btn-save" value="create" >Save</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
    </form>


@endsection


@section('js')
<script src="//cdn.ckeditor.com/4.6.2/standard/ckeditor.js"></script>
<script>
  var options = {
    filebrowserImageBrowseUrl: '/laravel-filemanager?type=Images',
    filebrowserImageUploadUrl: '/laravel-filemanager/upload?type=Images&_token=',
    filebrowserBrowseUrl: '/laravel-filemanager?type=Files',
    filebrowserUploadUrl: '/laravel-filemanager/upload?type=Files&_token='
  };
</script>
<script>
  CKEDITOR.replace('blog_description', options);
  CKEDITOR.dtd.a.div = 1;
</script>
  
  
<script>
   $(document).ready(function () {
     $.ajaxSetup({
         headers: {
             'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
         }
     });
	 

		$('#blog_thumnail').change(function(){
          
            let reader = new FileReader();
            reader.onload = (e) => { 
              $('#image_preview_container').attr('src', e.target.result); 
            }
            reader.readAsDataURL(this.files[0]); 
 
        });	  

	 
	   
	 
         /*  When user click add user button */
         $('#create-new-user').click(function () {
         $('#btn-save').val("create-user");
		     $('#data_id').val("");
         $('#dataForm').trigger("reset");
         $('#exampleModalScrollableTitle').html("Add New Blog Information");
         $('#btn-save').html("Save");
         $('#exampleModalScrollable').modal('show');
		     $('#blog_thumnail').attr('required', true);
		     $('#image_preview_container').attr('src', '/asadImage/image-preview.png');
         CKEDITOR.instances.blog_description.setData( 'write here ... ...' );
		     });
   
    /* When click edit user */
     $('body').on('click', '#edit-user', function () {
       var data_id = $(this).data('id');
           $.get('/admin-dashboard/blog-edit/'+ data_id , function (data) {
           $('#exampleModalScrollableTitle').html("Edit Blog Information");
		       $('#btn-save').html("Update");
           $('#btn-save').val("edit-user");
           $('#exampleModalScrollable').modal('show');
           $('#data_id').val(data.id);
           $('#category_id').val(data.category_id);
           $('#blog_title').val(data.blog_title);
           $('#blog_thumnail').attr('required', false);
		       $('#image_preview_container').attr('src', '/BlogFolder/'+data.blog_thumnail);
		       $('#blog_short_description').val(data.blog_short_description);
           $('#blog_description').val(data.blog_description);
		       $('#status').val(data.status);
           $('#wistia_link').val(data.wistia_link);
           $('#blog_type').val(data.blog_type);
           CKEDITOR.instances.blog_description.setData( data.blog_description );
		       var datta = CKEDITOR.instances.blog_description.getData();
           $('#blog_description').val(datta);
       })
    });
	
	


	
	
    //delete user login
     $('body').on('click', '#delete-user', function () {
         var data_id = $(this).data("id");

	
  Swal.fire({
    title: 'Are you sure?',
    text: "You won't be able to revert this!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonText: 'Yes, delete it!',
    customClass: {
      confirmButton: 'btn btn-primary',
      cancelButton: 'btn btn-outline-danger ml-1'
    },
    buttonsStyling: false
  }).then(function(result) {
    if (result.value) {
      
         $.ajax({
             type: "DELETE",
             url: "{{ url('/admin-dashboard/blog-delete')}}"+'/'+data_id,
             success: function (data) {
                 $("#table_id_" + data_id).remove();

  Swal.fire({
    title: 'Success!',
    text: 'You Data Deleted Successfully!',
    icon: 'success',
    customClass: {
      confirmButton: 'btn btn-primary'
    },
    buttonsStyling: false
  });				 
				 
             },
             error: function (data) {
                 console.log('Error:', data);
             }
         }); 	  
	  

    } else if (result.dismiss === Swal.DismissReason.cancel) {
      
  Swal.fire({
    title: 'Cancel!',
    text: ' Your Data Safe!',
    icon: 'error',
    customClass: {
      confirmButton: 'btn btn-primary'
    },
    buttonsStyling: false
  });
	  
    }
  });
	
	
	 

     }); 


	 
   });
  


             $('#dataForm').on('submit', function(event){
                var datta = CKEDITOR.instances.blog_description.getData();
				        $('#blog_description_hid').val(datta);

                event.preventDefault();
                var id  = $('#table_id_').val();
                if(id){
                    var method = 'update';
                    var url    = "{{route('admin.blog.store')}}";
                }else{
                    var method = 'add';
                    var url    = "{{route('admin.blog.store')}}";
                }

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
				var host = "{{request()->getHttpHost()}}";
				
			var actionType = $('#btn-save').val();
            $('#btn-save').html('Sending..');
	   
                $.ajax({
                    url:url,
                    type: "POST",
                    data: new FormData(this),
                    dataType: "JSON",
                    contentType:false,
                    cache:false,
                    processData:false,

           success: function (data) {
              
			   var datavalue = '<tr id="table_id_' 
			   + data.id + '"><td >' 
			   + data.id + '</td><td><img src="http://'+host+'/BlogFolder/' 
			   + data.blog_thumnail + '"alt="image" style="width:100px;"></td><td>'
			   + data.blog_title + '</td>';
			   
			   datavalue += '<td><div class="btn-group" role="group" aria-label="Basic example">';
			   
			   datavalue += ' <a href="javascript:void(0)" id="edit-user" data-id="' 
			   + data.id + '" class="btn btn-primary waves-effect waves-float waves-light">Edit</a>';
			   
			   
               datavalue += '<a href="javascript:void(0)" id="delete-user" data-id="' 
			   + data.id + '" class="btn btn-danger waves-effect waves-float waves-light" >Delete</a>';
			   
			   datavalue += '</div></td></tr>';
                
               
               if (actionType == "create-user") {
                   $('#data_crud').prepend(datavalue);
               } else {
                   $("#table_id_" + data.id).replaceWith(datavalue);
               }
			  
			  
               $('#dataForm').trigger("reset");
               $('#exampleModalScrollable').modal('hide');
               $('#btn-save').html('Save Changes');
               $('#btn-save').html('Save');
  Swal.fire({
    title: 'Success!',
    text: 'Your Data Saved Successfully!',
    icon: 'success',
    customClass: {
      confirmButton: 'btn btn-primary'
    },
    buttonsStyling: false
  });

           },
           error: function (data) {
			   console.log('Error:', data);
               $('#btn-save').html('Save Changes');
           }

                });

            });

  
   	$('#search_title').keyup(function(){ 
        var query = $(this).val();
        var _token = $('input[name="_token"]').val();
         $.ajax({
          url:"{{ route('admin.blog.search') }}",
          method:"POST",
          data:{query:query, _token:_token},
          success:function(data){
           $('#data_crud').html(data);
          }
         });
       
    });   

   
</script>


@endsection