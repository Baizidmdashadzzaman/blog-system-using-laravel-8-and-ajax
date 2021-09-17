<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Redirect,Response;
use App\Models\Blog;
use App\Models\Category;

class BlogController extends Controller
{

    public function index()
    {
		$this->checkpermission(3);
        $allData=Blog::latest()->get();
        $allData2=Category::latest()->get();
		return view('backend.blog.index',compact('allData','allData2'));
    }

    public function create()
    {
        //
    }
	
	public function search(Request $request)
	{
		$query = $request->get('query');
		$allData = Blog::
          where('blog_title', 'LIKE', "%{$query}%")
        ->latest()->get();			
		
		return view('backend.blog.search',compact('allData'));	
	}	

    public function store(Request $request)
    {
        //dd($request->all());
		if($request->data_id == null)
		{  
        $data = new Blog();
        $data ->category_id = $request->category_id;
        $data ->blog_title = $request->blog_title;
        $data ->blog_thumnail = time(). $_FILES["blog_thumnail"]["name"];
        $data ->blog_short_description = $request->blog_short_description;
        $data ->blog_description = $request->blog_description_hid;
        $data ->status = $request->status;
        $data ->blog_type = $request->blog_type;
        $data ->wistia_link = $request->wistia_link;
        $save = $data->save();

        $source= $_FILES['blog_thumnail']['tmp_name'];
        @mkdir("BlogFolder");
        $destination="BlogFolder/".$data->blog_thumnail;
        $saveimage = move_uploaded_file($source,$destination);        
		
		
		}
		else
		{
        $data = Blog::find($request->data_id);
        $data ->category_id = $request->category_id;
        $data ->blog_title = $request->blog_title;
        if($request->blog_thumnail != null)
        {
            $data ->blog_thumnail = time(). $_FILES["blog_thumnail"]["name"];
        }
        $data ->blog_short_description = $request->blog_short_description;
        $data ->blog_description = $request->blog_description_hid;
        $data ->status = $request->status;
        $data ->blog_type = $request->blog_type;
        $data ->wistia_link = $request->wistia_link;
        $save = $data->update();
        if($request->blog_thumnail != null)
        {
        $source= $_FILES['blog_thumnail']['tmp_name'];
        @mkdir("BlogFolder");
        $destination="BlogFolder/".$data->blog_thumnail;
        $saveimage = move_uploaded_file($source,$destination);  
        }   
		}
		return Response::json($data);
    }

    public function show()
    {
        //
    }

    public function edit($id)
    {
	    $singleData=Blog::find($id);
		return Response::json($singleData);
    }

    public function update(Request $request,$id)
    {

    }

    public function destroy($id)
    {
        $findiT=Blog::findOrFail($id);
		$data=$findiT->delete();
        return Response::json($data);
    }
	    

}
