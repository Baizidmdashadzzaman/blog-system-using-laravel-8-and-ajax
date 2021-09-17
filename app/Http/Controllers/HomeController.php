<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Blog;
use App\Models\Category;
use App\Models\Setting;
class HomeController extends Controller
{


    public function index()
    {
        $allblog=Blog::join('categories','blogs.category_id','categories.id')
        ->select('blogs.*','categories.category_name as category_name')
        ->latest()->get()->take(20);
        $mostReadBlog=Blog::orderBy('read_count')->get()->take(5);
        return view('home',compact('allblog','mostReadBlog'));
    }
    public function contact()
    {
        $setting=Setting::first();
        return view('contact',compact('setting'));
    }
    public function blogs()
    {    
         $allblog=Blog::join('categories','blogs.category_id','categories.id')
        ->select('blogs.*','categories.category_name as category_name')
        ->latest()->get();
        return view('allBlogs',compact('allblog'));
    }
    public function blog_view($id)
    {
        $blog=Blog::find($id);
        $blog->read_count = $blog->read_count+1;
        $blog->update();
        $mostReadBlog=Blog::orderBy('read_count')->get()->take(5);
        $category=Category::find($blog->category_id);
        return view('blogView',compact('blog','mostReadBlog','category'));
    }

}
