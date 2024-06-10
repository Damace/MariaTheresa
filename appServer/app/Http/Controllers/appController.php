<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Intervention\Image\Facades\Image;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\View\View;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use OneSignal;

class appController extends Controller
{
    //

    
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


    public function jumuiya_login(Request $request){

             $jumuiya = $request->input('jumuiya');
             $jumuiya_password = $request->input('jumuiya_password');
             
             $data = DB::select("select * from jumuiya where jina = '$jumuiya' and password = '$jumuiya_password'");
             $data2 = count($data);

             if($data2 > 0 ){
                 return response()->json(['status' => true]);
                }
             else{
                 return response()->json(['status' => false]);
             }
             
      
    
    }





    public function mahudhurio(Request $request){
        $tarehe = $request->input('tarehe');
        $jumuiya = $request->input('jumuiya');
        $mwanajumuiya = $request->input('mwanajumuiya');
        $mahudhurio = $request->input('mahudhurio');

        $input_data = array('tarehe' => $tarehe, 'jumuiya' =>$jumuiya,'mwanajumuiya' => $mwanajumuiya, 'isChecked' => $mahudhurio);
        DB::table('mahudhulio')->insert($input_data);

        return response()->json(['status' => true]);

    
    }



    public function maoni(Request $request){
        $namba_ya_simu = $request->input('namba_ya_simu');
        $majina_kamili = $request->input('majina_kamili');
        $contents = $request->input('contents');

        $input_data = array('namba_ya_simu' => $namba_ya_simu,'majina_kamili' =>$majina_kamili,'contents' => $contents);
        DB::table('maoni')->insert($input_data);

        return response()->json(['status' => true]);

    
    }


    public function fom_download($file_name){

      $file = public_path('storage/uploads/'.$file_name);
   
      return response()->download($file);

    }




   








    
    

    public function get_mahudhurio(){
        // $users = DB::select('select * from users where active = ?', [1]);

        $d = array();
        $data = DB::select('select * from mahudhulio');

        foreach($data as $row)
        {
            $p = array(
                'id' => $row -> id,
                'tarehe' => $row -> tarehe,
                'jumuiya' => $row -> jumuiya,
                'mwanajumuiya' => $row -> mwanajumuiya,
                'isChecked'   => false
               // 'isChecked'   => trim($row -> isChecked,"\r\n")
             );

              array_push($d,$p);

        }

        return response()->json($d);

   }
    


    public function get_fomu(){
         // $users = DB::select('select * from users where active = ?', [1]);
         $users = DB::select('select * from fomu_za_huduma');
         return json_encode($users,JSON_PRETTY_PRINT);

    }






    


}
