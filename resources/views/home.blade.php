@extends('layouts.app')
@section('title')
    Home
@endsection
@section('css')
    
@endsection
@section('content')
<div class="w3l-homeblock1 py-1">
    <div class="container pt-lg-1 pt-md-4">


        <!-- block -->
        <div class="row mt-5 pt-5">
            <div class="col-lg-9 most-recent">
                <h3 class="section-title-left">All latest blog posts</h3>
                <div class="list-view ">
                    
                    @foreach($allblog as $singleBlog)
                    <div class="grids5-info img-block-mobile">
                        <div class="blog-info align-self">
                            <span class="category">{{$singleBlog->category_name}}</span>
                            <a href="{{route('front.blog.view',$singleBlog->id)}}" class="blog-desc mt-0">
                                {{$singleBlog->blog_title}}
                            </a>
                            <p>{{$singleBlog->blog_short_description}}</p>
                            <div class="author align-items-center mt-3 mb-1">
                                <ul class="blog-meta">
                                    <li class="meta-item blog-lesson">
                                        <span class="meta-value">{{$singleBlog->created_at}}</span>
                                    </li>
                                   
                                </ul>
                            </div>
                            <ul class="blog-meta">
                                <li class="meta-item blog-lesson">
                                    <span class="meta-value"> {{$singleBlog->create_at}}</span>
                                </li>
                                
                            </ul>
                        </div>
                        <a href="{{route('front.blog.view',$singleBlog->id)}}" class="d-block zoom mt-md-0 mt-3">
                            <img src="{{asset('BlogFolder/'.$singleBlog->blog_thumnail)}}"
                                alt="" class="img-fluid radius-image news-image"></a>
                    </div>
                    @endforeach

                   
                    
                   
                    

                </div>
                <!-- pagination -->
                <div class="pagination-wrapper mt-5">
                    <ul class="page-pagination">
                        <a href="{{route('front.blog')}}" class="btn btn-info btn-block"><font color="white">View all</font></a>
                    </ul>
                </div>
                <!-- //pagination -->
            </div>
            <div class="col-lg-3 trending mt-lg-0 mt-5 mb-lg-5">
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
            <a href="#url"><img src="{{asset('assets/images/ad.gif')}}" class="img-fluid" alt="ad image" /></a>
        </div>
        <!-- //ad block -->

    </div>
</div>   
@endsection
@section('js')
    
@endsection