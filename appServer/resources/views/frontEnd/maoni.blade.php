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





  <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Maoni ya Wana Parokia</h5>
             
              <!-- Table with stripped rows -->
              <?php echo Session::get('success');?>
              <?php Session::forget('success');?>
              <table class="table datatable">
                <thead>
                  <tr>
                    <th>
                     Majina Kamili
                    </th>
                    <th>Jumuiya</th>
                    <th>Namba ya Simu</th>
                     <th>Maoni yake</th>
                     <th>Action</th>
                  </tr>
                </thead>
                
                <tbody>
                @if(!empty($maoni))
                @foreach($maoni as $data)
                  <tr>
                    
                    <td>{{$data->majina_kamili}}</td>
                    <td>{{$data->jumuiya}}</td>
                    <td>{{$data->namba_ya_simu}}</td>
                   <td align="center"><i class="bi bi-eye me-1" style="color:blue" title="Pre View" data-bs-toggle="modal" data-bs-target="#basicModal{{$data->id}}"></i></a> &nbsp&nbsp&nbsp </td>
                   <td><a href="{{ url('delete_maoni/'.$data->id) }}"><i class="bi bi-trash me-1" style="font-weight:bold,color:red" title="Delete"></i></a></td>
                  
                   
              <div class="modal fade" id="basicModal{{$data->id}}" tabindex="-1">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">{{$data->majina_kamili}} 
                       </h5>
                       <small style="color:gray">{{$data->jumuiya}}</small>
                    </div>
                    <div class="modal-body">
                    
                

                    {{$data->contents}}
                    
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                   
                    </div>
                  </div>
                </div>
              </div><!-- End Basic Modal-->












                  </tr>
                  @endforeach
                @else

                <tr>
               
                  <td></td>
                   <td></td>
                    <td style="color:gray">No entries found</td>
                   <td></td>
                   <td></td>
                  
                </tr>

                @endif
                
                </tbody>
              </table>
              <!-- End Table with stripped rows -->

            </div>
          </div>

        </div>
      </div>
    </section>



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