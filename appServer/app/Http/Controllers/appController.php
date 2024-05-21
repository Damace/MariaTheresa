<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Intervention\Image\Facades\Image;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\View\View;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class appController extends Controller
{
    //

    public function index(): View
    {
        // $doners = Donation::All();
        // return view('FrontEnd.donate')->with('student', $doners);       
     return view('FrontEnd.app');
    }

    public function topbanner(Request $request){

        $file = $request->file('myImage');
        $filename = time() . '_' . $file->getClientOriginalName();
        $path = $file->storeAs('uploads', $filename, 'public');
        $url = $request->root();
        $directory =$url.'/storage/'. $path;
        //$input_data = array('path' => $directory, 'description' => $file);
        $input_data = array('path' => $directory);
        DB::table('topbanner')->insert($input_data);
        return redirect('/')->with('flash_message', 'Thank you for your donation');

    }











}
