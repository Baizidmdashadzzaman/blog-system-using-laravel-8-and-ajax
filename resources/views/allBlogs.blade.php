@extends('layouts.app')
@section('title')
    All Blog
@endsection
@section('css')
    
@endsection
@section('content')
<nav id="breadcrumbs" class="breadcrumbs">
    <div class="container page-wrapper">
      <a href="{{route('front.home')}}">Home</a> / <span class="breadcrumb_last" aria-current="page">Blog</span>
    </div>
</nav>

<div class="w3l-searchblock w3l-homeblock1 py-5">
    <div class="container py-lg-4 py-md-3">
        <!-- block -->
        <div class="row">
            <div class="col-lg-12 most-recent">
                <h3 class="section-title-left">All blogs</h3>
               
                <div class="row">
                    @foreach($allblog as $singleBlog)
                    <div class="col-lg-4 col-md-6 item mt-5 pt-lg-3">
                        <div class="card">
                            <div class="card-header p-0 position-relative">
                                <a href="{{route('front.blog.view',$singleBlog->id)}}">
                                    <img class="card-img-bottom d-block radius-image" 
                                    src="{{asset('BlogFolder/'.$singleBlog->blog_thumnail)}}" alt="Card image cap">
                                </a>
                            </div>
                            <div class="card-body p-0 blog-details">
                                <a href="{{route('front.blog.view',$singleBlog->id)}}" class="blog-desc">
                                    {{$singleBlog->blog_title}}
                                </a>
                                <p>{{$singleBlog->blog_short_description}}</p>
                                
                                <ul class="blog-meta">
                                    <li class="meta-item blog-lesson">
                                        <span class="meta-value">{{$singleBlog->created_at}}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    @endforeach
                    
                </div>

                <!-- pagination -->
                <div class="pagination-wrapper mt-5">
                    <ul class="page-pagination">
                        
                    </ul>
                </div>
                <!-- //pagination -->
            </div>
            
        </div>
        <!-- //block-->


    </div>
</div>

  
@endsection
@section('js')
    
@endsection