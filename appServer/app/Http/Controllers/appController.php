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


    public function fomu_za_huduma(Request $request){
        $jina_la_form = $request->input('jina_la_fomu');
        $file = $request->file('fomu_file');
        $filename = time() . '_' . $file->getClientOriginalName();
        $path = $file->storeAs('uploads', $filename, 'public');
        $url = $request->root();
        $directory =$url.'/storage/'. $path;
        $input_data = array('file_path' => $directory, 'jina' => $jina_la_form);
        //$input_data = array('path' => $directory);
        DB::table('fomu_za_huduma')->insert($input_data);

        $fields['include_player_ids'] = ['9e22b8ae-dc11-48e3-8c00-b17379ce6e2e'];
        //$fields['id'] = ['3656d49b-1eca-4b1a-b54f-d97ed9c410d2'];
        $fields['contents'] = array(
                          "en" => 'Alex Mwakalikamo',
                          "es" => 'Alex Mwakalikamo', 
                        );
    
        OneSignal::sendPush($fields);

        return redirect('/')->with('flash_message', 'Thank you for your donation');

    }

    public function mahudhurio(Request $request){
        $tarehe = $request->input('tarehe');
        $jumuiya = $request->input('jumuiya');
        $mwanajumuiya = $request->input('mwanajumuiya');
        $mahudhurio = $request->input('mahudhurio');

        $input_data = array('tarehe' => $tarehe, 'jumuiya' =>$jumuiya,'mwanajumuiya' => $mwanajumuiya, 'mahudhurio' => $mahudhurio);
        $saved = DB::table('mahudhulio')->insert($input_data);

        if($saved)
        {
              return response()->json(['success' => true]);

        }
        else

        {

            return response()->json(['success' => false]);
        }
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
