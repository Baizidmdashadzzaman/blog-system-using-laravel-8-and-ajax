@extends('layouts.app')
@section('title')
    Contact
@endsection
@section('css')
<meta name="csrf-token" content="{{ csrf_token() }}">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>  
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.js"></script>	
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>   
@endsection
@section('content')
<nav id="breadcrumbs" class="breadcrumbs">
    <div class="container page-wrapper">
      <a href="{{route('front.home')}}">Home</a> / <span class="breadcrumb_last" aria-current="page">Contact</span>
    </div>
</nav>

<section class="w3l-contact-2 py-5">
    <div class="container py-lg-5 py-md-4">
      <h3 class="section-title-left">Leave Us a message </h3>
      <div class="contact-grids d-grid">
        <div class="contact-left">
          <h3 class="mb-3">Contact Details</h3>
          <p>Everything start with a Hello! We’re here to answer any questions you may have and create an effective
            solution for your instructional needs.</p>

          <p>We have a dedicated support center for all of your support needs. We usually get back to you within 12-24
            hours.</p>
          <div class="cont-details">
            <div class="cont-top margin-up">
              <div class="cont-left text-center">
                <span class="fa fa-map-marker"></span>
              </div>
              <div class="cont-right">
                <h6>Address</h6>
                <p>{{$setting->website_address}}</p>
              </div>
            </div>
            <div class="cont-top margin-up">
              <div class="cont-left text-center">
                <span class="fa fa-phone"></span>
              </div>
              <div class="cont-right">
                <h6>Call Us</h6>
                <p><a href="tel:{{$setting->website_mobilenumber}}">{{$setting->website_mobilenumber}}</a>
                  </p>
              </div>
            </div>
            <div class="cont-top margin-up">
              <div class="cont-left text-center">
                <span class="fa fa-envelope-o"></span>
              </div>
              <div class="cont-right">
                <h6>Email Us</h6>
                <p><a href="mailto:{{$setting->website_email}}" class="mail">{{$setting->website_email}}</a></p>
              </div>
            </div>
          </div>
        </div>
        <div class="contact-right">
          <form id="dataForm" name="dataForm" enctype="multipart/form-data" >
            <div class="input-grids">
              <input type="text" id="name" name="name" placeholder="Your Name*" class="contact-input" required="">
              <input type="email" id="email" name="email" placeholder="Your Email*" class="contact-input" required="">
              <input type="text" id="subject" name="subject" placeholder="Subject*" class="contact-input" required="">
            </div>
            <div class="form-input">
              <textarea id="message" name="message" placeholder="Type your message here*" required=""></textarea>
            </div>
            <input type="hidden" name="notified" value="0">
            <button type="submit" class="btn btn-style btn-outline" id="btn-save" value="create" >Send Message</button>
          </form>
        </div>
      </div>
  </div></section>
  
@endsection
@section('js')
<script>
  $(document).ready(function () {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
  

  });
 


            $('#dataForm').on('submit', function(event){
               event.preventDefault();
               var id  = $('#table_id_').val();
               if(id){
                   var method = 'update';
                   var url    = "{{route('admin.contactmessage.store')}}";
               }else{
                   var method = 'add';
                   var url    = "{{route('admin.contactmessage.store')}}";
               }

               $.ajaxSetup({
                   headers: {
                       'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                   }
               });
       
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
        + data.id + '</td><td>' 
        + data.name + '</td><td>' 
        + data.email + '</td>';
        
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
   text: 'Your message sent successfully ,we will contact with you as soon as possible.',
   icon: 'success',
   customClass: {
     confirmButton: 'btn btn-primary'
   },
   buttonsStyling: false
 });

          },
          error: function (data) {
        console.log('Error:', data);
              $('#btn-save').html('Save');
              $('#dataForm').trigger("reset");
              $('#exampleModalScrollable').modal('hide');

Swal.fire({
   title: 'Error!',
   text: 'Somthing went wrong,please try again.',
   icon: 'error',
   customClass: {
     confirmButton: 'btn btn-primary'
   },
   buttonsStyling: false
 });

          }

               });

           });


  
</script>
@endsection