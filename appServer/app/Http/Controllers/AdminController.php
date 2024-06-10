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


    public function matangazo(): View
    {
     
     return view('FrontEnd.matangazo');
    }

    public function matukio(): View
    {
     
     return view('FrontEnd.matukio');
    }

    public function fomu_huduma(): View
    {
     
     return view('FrontEnd.fomu');
    }

    public function  maoni_kwa_parokia(): View
    {

   $maoni = DB::select("select * from maoni");
   
   return view('FrontEnd.maoni')->with(['maoni'=>$maoni]);
    
    }

    public function mapadri(): View
    {

   $maoni = DB::select("select * from maoni");
   
   return view('FrontEnd.mapadri')->with(['maoni'=>$maoni]);
    
    } 


   

    public function delete_maoni(Request $request,$id)

    {
         $deleted = DB::delete("Delete from maoni where id = '$id'");
        $maoni = DB::select("select * from maoni");
        $_maoni = count($maoni);
        Session::put('maoni', $_maoni);

        if($deleted)
        {
           $success = ' <div class="alert alert-danger alert-dismissible fade show" role="alert" align="right" style="width="300px">
         <i class="bi bi-check-circle me-1"></i> <small>Deleted  Successfully</small>
      </div>';
         
       Session::put('success', $success);
 
        }


        return view('FrontEnd.maoni')->with(['maoni'=>$maoni]);

   } 
   
   

   public function  delete_padri(Request $request,$id)

   {
       $deleted = DB::delete("Delete from mapadre where id = '$id'");

       if($deleted)
       {
          $success = ' <div class="alert alert-danger alert-dismissible fade show" role="alert" align="right" style="width="300px">
        <i class="bi bi-check-circle me-1"></i> <small>Deleted  Successfully</small>
     </div>';
        
      Session::put('success', $success);

       }
    

      //-----------------------------------------------------------------  Home Preview-------------------------------------------------------------------
      
      $jumuiya = DB::select("select * from jumuiya");
      $data2 = DB::select("select * from jumuiya");
      $fomu_za_huduma = DB::select("select * from  fomu_za_huduma");

      $matangazo = DB::select("select * from matangazo_attachments");
      $idaidi_ya_jumuiya = count($jumuiya);
      $matukio = DB::select("select * from matukio");
      $mapadre = DB::select("select * from mapadre");

      return view('FrontEnd.home')->with(['mapadre'=> $mapadre,'matukio'=> $matukio,'matangazo'=> $matangazo,'fomu_za_huduma'=> $fomu_za_huduma,'flash_message2','Welcome ','name'=> $jumuiya,'idadi_jumuiya'=>$idaidi_ya_jumuiya,'a'=>$data2]);
      
   }
  


    public function myform_huduma(Request $request){
        $jina_la_form = $request->input('jina_la_fomu');
        $file = $request->file('fomu_file');
        $filename = time() . '_' . $file->getClientOriginalName();
        $path = $file->storeAs('uploads', $filename, 'public');
        $url = $request->root();
        $directory =$url.'/fom_download/'.$filename;
        $pre_view =$url.'/storage/'. $path;

        $input_data = array('file_path' => $directory, 'jina' => $jina_la_form,'preview' => $pre_view);
        //$input_data = array('path' => $directory);
        DB::table('fomu_za_huduma')->updateOrInsert($input_data);

        $fields['include_player_ids'] = ['9e22b8ae-dc11-48e3-8c00-b17379ce6e2e'];
        //$fields['id'] = ['3656d49b-1eca-4b1a-b54f-d97ed9c410d2'];
        $fields['contents'] = array(
                          "en" => 'Alex Mwakalikamo',
                          "es" => 'Alex Mwakalikamo', 
                        );
    
        OneSignal::sendPush($fields);

        if($input_data)
        {
           $success = ' <div class="alert alert-success alert-dismissible fade show" role="alert" align="right" style="width="300px">
         <i class="bi bi-check-circle me-1"></i> <small>Submitted  Successfully</small>
      </div>';
         
       Session::put('success', $success);
 
        }

//-----------------------------------------------------------------  Home Preview-------------------------------------------------------------------
      
        $jumuiya = DB::select("select * from jumuiya");
        $data2 = DB::select("select * from jumuiya");
        $fomu_za_huduma = DB::select("select * from  fomu_za_huduma");
        $matangazo = DB::select("select * from matangazo_attachments");
        $idaidi_ya_jumuiya = count($jumuiya);
        $matukio = DB::select("select * from matukio");
        $mapadre = DB::select("select * from mapadre");

        return view('FrontEnd.home')->with(['mapadre'=> $mapadre,'matukio'=> $matukio,'matangazo'=> $matangazo,'fomu_za_huduma'=> $fomu_za_huduma,'flash_message2','Welcome ','name'=> $jumuiya,'idadi_jumuiya'=>$idaidi_ya_jumuiya,'a'=>$data2]);
        
    }


    public function mangazo(Request $request)
    {

       $tarehe = $request->input('tarehe');
       $dominika = $request->input('dominika');
    
       $category = $request->input('category');
       $maelezo = $request->input('maelezo');

       $tarehe_ya_tangazo = Session::put('tarehe', $tarehe);
       $jumapili_dominika = Session::put('dominika', $dominika);


       $input_data = array('tarehe' => $tarehe,'dominika' => $dominika,'category' => $category,'maelezo' => $maelezo);
       DB::table('matangazo')->updateOrInsert($input_data);
       if($input_data)
       {
          $success = ' <div class="alert alert-success alert-dismissible fade show" role="alert" align="right" style="width="300px">
        <i class="bi bi-check-circle me-1"></i> <small>Submitted  Successfully</small>
     </div>';
        
      Session::put('success', $success);

       }
       
       return view('FrontEnd.matangazo')->with(['tarehe'=> $tarehe_ya_tangazo,'dominika' => $jumapili_dominika]);

     

    }



    public function  mapadri_insert(Request $request)

    {

       $majina_kamili = $request->input('majina_kamili');
       $cheo = $request->input('cheo');
       $namba_ya_simu = $request->input('namba_ya_simu');
    
       $input_data = array('majina_kamili' => $majina_kamili,'cheo' => $cheo,'namba_ya_simu' => $namba_ya_simu);
       DB::table('mapadre')->updateOrInsert($input_data);
       if($input_data)
       {
          $success = ' <div class="alert alert-success alert-dismissible fade show" role="alert" align="right" style="width="300px">
        <i class="bi bi-check-circle me-1"></i> <small>Submitted  Successfully</small>
     </div>';
        
      Session::put('success', $success);

       }
       




      

      
     

//-----------------------------------------------------------------  Home Preview-------------------------------------------------------------------
      
$jumuiya = DB::select("select * from jumuiya");
$data2 = DB::select("select * from jumuiya");
$fomu_za_huduma = DB::select("select * from  fomu_za_huduma");

$matangazo = DB::select("select * from matangazo_attachments");
$idaidi_ya_jumuiya = count($jumuiya);
$matukio = DB::select("select * from matukio");
$mapadre = DB::select("select * from mapadre");

return view('FrontEnd.home')->with(['mapadre'=> $mapadre,'matukio'=> $matukio,'matangazo'=> $matangazo,'fomu_za_huduma'=> $fomu_za_huduma,'flash_message2','Welcome ','name'=> $jumuiya,'idadi_jumuiya'=>$idaidi_ya_jumuiya,'a'=>$data2]);


    }


   
    public function mangazo_atachments(Request $request)
    {


       $tarehe = Session::get('tarehe');
       $dominika = Session::get('dominika');
       $taarifa_muhimu = $request->input('taarifa_muhimu');

       $file = $request->file('tangazo_pdf');
       $filename = time() . '_' . $file->getClientOriginalName();
       $path = $file->storeAs('uploads', $filename, 'public');
       $url = $request->root();
       $directory =$url.'/fom_download/'.$filename;
       $pre_view =$url.'/storage/'. $path;

       $input_data = array('tarehe' => $tarehe,'dominika' => $dominika,'taarifa_muhimu' => $taarifa_muhimu,'file' => $pre_view,'file2' => $directory);
       DB::table('matangazo_attachments')->updateOrInsert($input_data);
       if($input_data)
       {
          $success = ' <div class="alert alert-success alert-dismissible fade show" role="alert" align="right" style="width="300px">
        <i class="bi bi-check-circle me-1"></i> <small>Submitted  Successfully</small>
     </div>';
        
      Session::put('success', $success);

       }
       
       return view('FrontEnd.matangazo');


    }



    

    public function  matukio_parokia(Request $request)
    {

       $video_title = $request->input('video_title');
       $video_description = $request->input('video_description');
       $video_link = $request->input('video_link');


       $input_data = array('video_title' => $video_title,'video_description' => $video_description,'video_link' => $video_link);
       DB::table('matukio')->updateOrInsert($input_data);
       if($input_data)
       {
          $success = ' <div class="alert alert-success alert-dismissible fade show" role="alert" align="right" style="width="300px">
        <i class="bi bi-check-circle me-1"></i> <small>Submitted  Successfully</small>
     </div>';
        
      Session::put('success', $success);

       }

//-----------------------------------------------------------------  Home Preview-------------------------------------------------------------------
      $matangazo = DB::select("select * from matangazo_attachments");
      $jumuiya = DB::select("select * from jumuiya");
      $data2 = DB::select("select * from jumuiya");
      $fomu_za_huduma = DB::select("select * from  fomu_za_huduma");
      $idaidi_ya_jumuiya = count($jumuiya);
      
      $matukio = DB::select("select * from matukio");
      $mapadre = DB::select("select * from mapadre");

      return view('FrontEnd.home')->with(['mapadre'=> $mapadre,'matukio'=> $matukio,'matangazo'=> $matangazo,'fomu_za_huduma'=> $fomu_za_huduma,'flash_message2','Welcome ','name'=> $jumuiya,'idadi_jumuiya'=>$idaidi_ya_jumuiya,'a'=>$data2]);
      
    }





    
    public function home(Request $request)
    {

        
//-----------------------------------------------------------------  Home Preview-------------------------------------------------------------------
      
$jumuiya = DB::select("select * from jumuiya");
$data2 = DB::select("select * from jumuiya");
$fomu_za_huduma = DB::select("select * from  fomu_za_huduma");
$matangazo = DB::select("select * from matangazo_attachments");
$idaidi_ya_jumuiya = count($jumuiya);

$maoni = DB::select("select * from maoni");
$_maoni = count($maoni);
Session::put('maoni', $_maoni);

$matukio = DB::select("select * from matukio");
$mapadre = DB::select("select * from mapadre");

return view('FrontEnd.home')->with(['mapadre'=> $mapadre,'matukio'=> $matukio,'matangazo'=> $matangazo,'fomu_za_huduma'=> $fomu_za_huduma,'flash_message2','Welcome ','name'=> $jumuiya,'idadi_jumuiya'=>$idaidi_ya_jumuiya,'a'=>$data2]);





    }


    public function jumuiya(Request $request,$id,$jina)

    {
         $jumuiya = DB::select("select * from jumuiya where id = '$id'");
         $viongozi = DB::select("select * from viongozi_jumuiya where jumuiya = '$jina'");
         $wanajumuiya = DB::select("select * from wanajumuiya where jumuiya = '$jina'");


        return view('FrontEnd.jumuiya',['viongozi'=> $viongozi,'wanajumuiya'=> $wanajumuiya,'jumuiya'=> $jumuiya,'jina'=>$jina]);

        


    }

    public function  delete_jumuiya(Request $request,$jina)

    {
        $deleted = DB::delete("Delete from jumuiya where jina = '$jina'");

         if($deleted)
         {
            $success = ' <div class="alert alert-danger alert-dismissible fade show" role="alert" align="right" style="width="300px">
          <i class="bi bi-check-circle me-1"></i> <small>Deleted  Successfully</small>
       </div>';
          
        Session::put('success', $success);
  
         }
//-----------------------------------------------------------------  Home Preview-------------------------------------------------------------------
      
$jumuiya = DB::select("select * from jumuiya");
$data2 = DB::select("select * from jumuiya");
$fomu_za_huduma = DB::select("select * from  fomu_za_huduma");
$idaidi_ya_jumuiya = count($jumuiya);
$matukio = DB::select("select * from matukio");
$mapadre = DB::select("select * from mapadre");
$matangazo = DB::select("select * from matangazo_attachments");

return view('FrontEnd.home')->with(['mapadre'=> $mapadre,'matukio'=> $matukio,'matangazo'=> $matangazo,'fomu_za_huduma'=> $fomu_za_huduma,'flash_message2','Welcome ','name'=> $jumuiya,'idadi_jumuiya'=>$idaidi_ya_jumuiya,'a'=>$data2]);


    }


    public function    delete_matukio(Request $request,$id)

    {
        $deleted =  DB::delete("Delete from matukio where id = '$id'");
         if($deleted)
         {
            $success = ' <div class="alert alert-danger alert-dismissible fade show" role="alert" align="right" style="width="300px">
          <i class="bi bi-check-circle me-1"></i> <small>Deleted  Successfully</small>
       </div>';
          
        Session::put('success', $success);
  
         }
//-----------------------------------------------------------------  Home Preview-------------------------------------------------------------------
      
$jumuiya = DB::select("select * from jumuiya");
$data2 = DB::select("select * from jumuiya");
$fomu_za_huduma = DB::select("select * from  fomu_za_huduma");
$idaidi_ya_jumuiya = count($jumuiya);

$matukio = DB::select("select * from matukio");
$mapadre = DB::select("select * from mapadre");
$matangazo = DB::select("select * from matangazo_attachments");

return view('FrontEnd.home')->with(['mapadre'=> $mapadre,'matukio'=> $matukio,'matangazo'=> $matangazo,'fomu_za_huduma'=> $fomu_za_huduma,'flash_message2','Welcome ','name'=> $jumuiya,'idadi_jumuiya'=>$idaidi_ya_jumuiya,'a'=>$data2]);
 
    }







  



    public function  delete_tangazo(Request $request,$tarehe)

    {
         DB::delete("Delete from matangazo where tarehe = '$tarehe'");
      $deleted =  DB::delete("Delete from matangazo_attachments where tarehe = '$tarehe'");
      if($deleted)
      {
         $success = ' <div class="alert alert-danger alert-dismissible fade show" role="alert" align="right" style="width="300px">
       <i class="bi bi-check-circle me-1"></i> <small>Deleted  Successfully</small>
    </div>';
       
     Session::put('success', $success);

      }
//-----------------------------------------------------------------  Home Preview-------------------------------------------------------------------
      
$jumuiya = DB::select("select * from jumuiya");
$data2 = DB::select("select * from jumuiya");
$idaidi_ya_jumuiya = count($jumuiya);

$matukio = DB::select("select * from matukio");
$matangazo = DB::select("select * from matangazo_attachments");
$fomu_za_huduma = DB::select("select * from  fomu_za_huduma");
$mapadre = DB::select("select * from mapadre");

return view('FrontEnd.home')->with(['mapadre'=> $mapadre,'matukio'=> $matukio,'matangazo'=> $matangazo,'fomu_za_huduma'=> $fomu_za_huduma,'flash_message2','Welcome ','name'=> $jumuiya,'idadi_jumuiya'=>$idaidi_ya_jumuiya,'a'=>$data2]);
     
    }

 
    

    public function  delete_file(Request $request,$id)

    {
         $deleted = DB::delete("Delete from fomu_za_huduma where id = '$id'");

         if($deleted)
         {
            $success = ' <div class="alert alert-danger alert-dismissible fade show" role="alert" align="right" style="width="300px">
          <i class="bi bi-check-circle me-1"></i> <small>Deleted  Successfully</small>
       </div>';
          
        Session::put('success', $success);
  
         }
//-----------------------------------------------------------------  Home Preview-------------------------------------------------------------------
      
$jumuiya = DB::select("select * from jumuiya");
$data2 = DB::select("select * from jumuiya");
$fomu_za_huduma = DB::select("select * from  fomu_za_huduma");
$idaidi_ya_jumuiya = count($jumuiya);
$matukio = DB::select("select * from matukio");
$mapadre = DB::select("select * from mapadre");
$matangazo = DB::select("select * from matangazo_attachments");

return view('FrontEnd.home')->with(['mapadre'=> $mapadre,'matukio'=> $matukio,'matangazo'=> $matangazo,'fomu_za_huduma'=> $fomu_za_huduma,'flash_message2','Welcome ','name'=> $jumuiya,'idadi_jumuiya'=>$idaidi_ya_jumuiya,'a'=>$data2]);

      
    }







    public function  jumuiya_mpya(Request $request)
    {

       $jumuiya = $request->input('jina');
       $input_data = array('jina' => $jumuiya);
       $input_data2 = array('jumuiya' => $jumuiya);
        DB::table('jumuiya')->updateOrInsert($input_data);
        DB::table('viongozi_jumuiya')->updateOrInsert($input_data2);
        if($input_data)
        {
           $success = ' <div class="alert alert-success alert-dismissible fade show" role="alert" align="right" style="width="300px">
         <i class="bi bi-check-circle me-1"></i> <small>Submitted  Successfully</small>
      </div>';
         
       Session::put('success', $success);
 
        }

  //-----------------------------------------------------------------  Home Preview-------------------------------------------------------------------
      
  $jumuiya = DB::select("select * from jumuiya");
  $data2 = DB::select("select * from jumuiya");
  $fomu_za_huduma = DB::select("select * from  fomu_za_huduma");
  $idaidi_ya_jumuiya = count($jumuiya);
  $matukio = DB::select("select * from matukio");

  $matangazo = DB::select("select * from matangazo_attachments");
  $mapadre = DB::select("select * from mapadre");

  return view('FrontEnd.home')->with(['mapadre'=> $mapadre,'matukio'=> $matukio,'matangazo'=> $matangazo,'fomu_za_huduma'=> $fomu_za_huduma,'flash_message2','Welcome ','name'=> $jumuiya,'idadi_jumuiya'=>$idaidi_ya_jumuiya,'a'=>$data2]);
  

    }



    public function login(Request $request){

        $username = $request->input('username');
        $password = $request->input('password');
        
        $data = DB::select("select * from admin where username = '$username' and password = '$password'");
        $data2 = count($data);

        if($data2 > 0 ){
             Session::put('user', $username);
            // return redirect('/home')->with('flash_message','Welcome '. $username);
               //-----------------------------------------------------------------  Home Preview-------------------------------------------------------------------
      
  $jumuiya = DB::select("select * from jumuiya");
  $data2 = DB::select("select * from jumuiya");
  $fomu_za_huduma = DB::select("select * from fomu_za_huduma");
  $idaidi_ya_jumuiya = count($jumuiya);
  $matukio = DB::select("select * from matukio");
  $matangazo = DB::select("select * from matangazo_attachments");

  $mapadre = DB::select("select * from mapadre");

  return view('FrontEnd.home')->with(['mapadre'=> $mapadre,'matukio'=> $matukio,'matangazo'=> $matangazo,'fomu_za_huduma'=> $fomu_za_huduma,'flash_message2','Welcome ','name'=> $jumuiya,'idadi_jumuiya'=>$idaidi_ya_jumuiya,'a'=>$data2]);
  



             }
        else{
           
            return redirect('/')->with('flash_message', 'Wrong Username or Password');
        }
        

    }


}
