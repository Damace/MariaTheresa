<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>K/ndege CPanel</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <link href="/assets/img/favicon.ico" rel="icon">
  <link href="/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

 
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">


  <link href="/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <link href="/assets/css/style.css" rel="stylesheet">

</head>

<body>


@include('frontEnd.header')
@include('frontEnd.sidebar')


  <main id="main" class="main">



  <div class="card">
            <div class="card-body">


             

              <div class="row">
  <div class="col"> <h5 class="card-title">{!! $jina !!}</h5></div>
  <div class="col"> 
    
  <br>
  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <a href=""><button class="btn btn-success me-md-2" type="button"><i class="bi bi-pencil-square"></i> Edit</button></a>
  <a href="{{ url('delete/'.$jina) }}"><button class="btn btn-danger" type="button"><i class="bi bi-trash"></i> Delete</button></a>
</div>
</br>







</div></div>
             




              <!-- Default Tabs -->
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Viongozi</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Wanajumuiya</button>
                </li>


                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Mahudhulio</button>
                </li>

            

              </ul>





              <div class="tab-content pt-2" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                
                
               

                <div class="row">
                @if(!empty($viongozi))
                @foreach($viongozi as $viongozi_jumuiya)

                <div class="col"> 
                <div class="card" style="width: 15rem;">
                <img src="/assets/img/user.png" alt="" width="100",height="100">

  <ul class="list-group list-group-flush">
    <li class="list-group-item"><h5><small><b>{{$viongozi_jumuiya -> majina_kamili}}</b></small><h5></li>
    <li class="list-group-item">{{$viongozi_jumuiya -> cheo}}</li>
    <li class="list-group-item"><i class="bi bi-phone"></i>{{$viongozi_jumuiya -> namba_sim}}</li>
    <li class="list-group-item"></li>
  </ul>

</div>
</div>



@endforeach

@else

<div align="center">

<span style="color:gray;padding-top:120px"><small>No Entry found </small></span>
</div>

@endif



</div>

                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                
              

                
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th><small>
                      Jina Kamili </small>
                    </th>
                  
                    <th><small>
                     Jinsia </small>
                    </th>
                    <th><small>
                   Chama cha Kitume
                  </small></th>
                 
                    <th><small>
                      Ubatizo
                       </small>
                    </th>

                    <th><small>
                      Ekarist
                       </small>
                    </th>

                    <th><small>
                      Kipaimara
                       </small>
                    </th>
                    <th><small>
                      Ndoa
                       </small>
                    </th>
                  </tr>
                </thead>
                <tbody>
                
                @foreach($wanajumuiya as $data)
                  <tr>
                    <td>{{ $data->jina}}</td>
                    <td>{{ $data->jinsia}}</td>
                    <td>{{ $data->umli}}</td>
                    <td>{{ $data->ubatizo}}</td>
                    <td>{{ $data->ekarist}}</td>
                    <td>{{ $data->kipaimara}}</td>
                    <td>{{ $data->ndoa}}</td>
                </td>
                 </tr>
                  @endforeach
                
                </tbody>
              </table>
              <!-- End Table with stripped rows -->






                </div>


                <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
                 
                
                
                              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th><small>
                      Jumamosi / Tarehe </small>
                    </th>
                  
                    <th><small>
                     Jina kamili </small>
                    </th>
                    <th><small>
                   Jinsia
                  </small></th>
                 
                    <th><small>
                      Umli
                       </small>
                    </th>
                   

                  </tr>
                </thead>
                <tbody>
                
                @foreach($wanajumuiya as $data)
                  <tr>
                    <td>{{ $data->jina}}</td>
                    <td>{{ $data->jinsia}}</td>
                    <td>{{ $data->umli}}</td>
                    <td>{{ $data->ubatizo}}</td>
           
                </td>
                 </tr>
                  @endforeach
                
                </tbody>
              </table>
              <!-- End Table with stripped rows -->

                
                
                
                
                
                </div>

              

              </div><!-- End Default Tabs -->

            </div>
          </div>
  </main><!-- End #main -->



  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="/assets/vendor/echarts/echarts.min.js"></script>
  <script src="/assets/vendor/quill/quill.min.js"></script>
  <script src="/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="/assets/js/main.js"></script>

</body>

</html>