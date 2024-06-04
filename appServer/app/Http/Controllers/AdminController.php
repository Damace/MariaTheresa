<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input;
use Intervention\Image\Facades\Image;
use Illuminate\Http\Response;
use Illuminate\View\View;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use OneSignal;
use Illuminate\Support\Facades\Session;


class AdminController extends Controller
{
    public function index(): View
    {
     
     return view('FrontEnd.index');
    }


    public function home(): View
    {

      
     return view('FrontEnd.home');
    }


    public function login(Request $request){

        $username = $request->input('username');
        $password = $request->input('password');
        
        $data = DB::select("select * from admin where username = '$username' and password = '$password'");
        $data2 = count($data);

        if($data2 > 0 ){
             Session::put('user', $username);
             return redirect('/home')->with('flash_message','Welcome '. $username);
             }
        else{
           
            return redirect('/')->with('flash_message', 'Wrong Username or Password');
        }
        

    }


}
