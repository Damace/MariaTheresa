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
              <h5 class="card-title">Matukio ya Parokia</h5>

              <!-- General Form Elements -->
              <form class="row g-3 needs-validation" novalidate action="{{ url('matukio_parokia') }}" method="POST">
                  @csrf
                  @method('post')

                <div class="row mb-3" style="width:800px">
                  <label for="inputText" class="col-sm-2 col-form-label">Jina la video</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="video_title">
                  </div>
                </div>


                <div class="row mb-3" style="width:800px">
                  <label for="inputPassword" class="col-sm-2 col-form-label">Maelezo</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" style="height: 100px"  name="video_description"></textarea>
                  </div>
                </div>


                <div class="row mb-3" style="width:800px">
                  <label for="inputText" class="col-sm-2 col-form-label">Video Link</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="video_link">
                  </div>
                </div>


                <div class="row mb-3" align="right" style="width:800px">
                  <label class="col-sm-2 col-form-label"></label>
                  <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Submit</button>
                  </div>
                </div>





              
              </form><!-- End General Form Elements -->

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