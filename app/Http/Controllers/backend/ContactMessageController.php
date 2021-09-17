<?php

namespace App\Http\Controllers\backend;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Redirect,Response;
use App\Models\ContactMessage;

class ContactMessageController extends Controller
{
  
    public function index()
    {
		$this->checkpermission(2);
        $allData=ContactMessage::latest()->get();
		return view('backend.contactmessage.index',compact('allData'));
    }

    public function create()
    {
        //
    }
	
	public function search(Request $request)
	{
		$query = $request->get('query');
		$allData = ContactMessage::
          where('email', 'LIKE', "%{$query}%")
        ->latest()->get();			
		
		return view('backend.contactmessage.search',compact('allData'));	
	}	

    public function store(Request $request)
    {
		if($request->data_id == null)
		{  
        $data = new ContactMessage();
        $data ->name = $request->name;
        $data ->email = $request->email;
        $data ->subject = $request->subject;
        $data ->message = $request->message;
        $data ->notified = $request->notified;
        $save = $data->save();

		}
		else
		{
        $data = ContactMessage::find($request->data_id);
        $data ->name = $request->name;
        $data ->email = $request->email;
        $data ->subject = $request->subject;
        $data ->message = $request->message;
        $data ->notified = $request->notified;
        $save = $data->update();
        
		}
		return Response::json($data);
    }

    public function show()
    {
        //
    }

    public function edit($id)
    {
	    $singleData=ContactMessage::find($id);
        $singleData->notified =1;
        $singleData->update();
		return Response::json($singleData);
    }

    public function update(Request $request,$id)
    {

    }

    public function destroy($id)
    {
        $findiT=ContactMessage::findOrFail($id);
		$data=$findiT->delete();
        return Response::json($data);
    }   

	  
}
