@extends('layouts.app')
@section('title')
    Blog view
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
            <div class="col-lg-8 most-recent">
                <h3 class="section-title-left">Blog on : {{$category->category_name}}</h3>
               
                <div class="row">
                    <div class="col-md-12 item">
                        <div class="card">
                            <div class="card-header p-0 position-relative">
                                <a href="#">
                                    <img class="card-img-bottom d-block radius-image" 
                                    src="{{asset('BlogFolder/'.$blog->blog_thumnail)}}" alt="Card image cap">
                                </a>
                            </div>
                            <div class="card-body p-0 blog-details">
                                <a href="#" class="blog-desc">{{$blog->blog_title}}
                                </a>
                                @if($blog->blog_type == 1)
                                 <p>{!! $blog->wistia_link !!}</p>
                                @endif
                                <p>{!! $blog->blog_description !!}</p>
                                
                                <ul class="blog-meta">
                                    <li class="meta-item blog-lesson">
                                        <span class="meta-value"> {{$blog->created_at}}</span>
                                    </li>
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                   
                </div>

                <!-- pagination -->
                <div class="pagination-wrapper mt-5">
                    <ul class="page-pagination">
                       
                    </ul>
                </div>
                <!-- //pagination -->
            </div>
            <div class="col-lg-4 trending mt-lg-0 mt-5 mb-lg-5">
                <div class="pos-sticky">
                    <h3 class="section-title-left">Most read blog post </h3>
                    @php
                    $sl=01;    
                    @endphp
                    @foreach($mostReadBlog as $singleBlog2)
                    <div class="grids5-info">
                        <h4>{{$sl++}}.</h4>
                        <div class="blog-info">
                            <a href="{{route('front.blog.view',$singleBlog2->id)}}" class="blog-desc1">
                                {{$singleBlog2->blog_title}}
                            </a>
                            
                            <ul class="blog-meta">
                                <li class="meta-item blog-lesson">
                                    <span class="meta-value">{{$singleBlog2->created_at}}</span>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
        <!-- //block-->

        <!-- ad block -->
        <div class="ad-block text-center mt-5">
            
        </div>
        <!-- //ad block -->
    </div>
</div>

  
@endsection
@section('js')
    
@endsection