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
  <div class="col"> <h5 class="card-title">Matangazo</h5></div>
  <div class="col"> 
    


  <br>
  <div class="d-grid gap-2 d-md-flex justify-content-md-end">

</div>
</br>
</div></div>
<?php echo Session::get('success');?>
<?php Session::forget('success');?>
              <!-- Default Tabs -->
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Matangazo</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Attachment</button>
                </li>
              </ul>
               <div class="tab-content pt-2" id="myTabContent">
                <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                
                <div class="card">
            <div class="card-body">
              <h5 class="card-title"></h5>

              <!-- General Form Elements -->
              <form class="row g-3 needs-validation" novalidate action="{{ url('tangazo') }}" method="POST">
                  @csrf
                  @method('post')


              <div class="row mb-3" style="width:800px">
                  <label for="inputDate" class="col-sm-2 col-form-label"><small>Jumapili ya Tarehe</small></label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control"  name= "tarehe" >
                </div>
                </div>



                <div class="row mb-3" style="width:800px">
                  <label for="inputText" class="col-sm-2 col-form-label">Dominika</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="dominika" placeholder="Dominika ya pili ya Pasaka" value="">
                    
                  </div>
                </div>



                <div class="row mb-3" style="width:800px">
                  <label class="col-sm-2 col-form-label"><small>Aina ya  tangazo</small></label>
                  <div class="col-sm-10">
                    <select class="form-select" aria-label="Default select example" name="category">
                      <option selected>Chagua aina ya tangazo</option>
                      <option value="Sadaka">Sadaka</option>
                      <option value="Ndoa">Ndoa</option>
                      <option value="Usafi">Usafi</option>
                      <option value="Jumuiya">Jumuiya</option>
                      <option value="Vyama vya Kitume">Vyama vya Kitume</option>
                      <option value="Kwaya">Kwaya</option>
                    </select>
                  </div>
                </div>



                <div class="row mb-3" style="width:800px">
                  <label for="inputPassword" class="col-sm-2 col-form-label"><small>Maelezo</small></label>
                  <div class="col-sm-10">
                    <textarea class="form-control" style="height: 100px" name="maelezo"></textarea>
                  </div>
              </div>


            
                  
              

              

                <div class="row mb-3" style="width:800px" align="right">
                  <label class="col-sm-2 col-form-label"></label>
                  <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Submit</button>
                  </div>
                </div>

              </form><!-- End General Form Elements -->

            </div>
          </div>


          </fieldset>
            

            </div>
          </div>







                </div>
                <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                
              
                 
                <form class="row g-3 needs-validation" novalidate action="{{ url('tangazo_atachments') }}" method="POST" enctype="multipart/form-data">
                  @csrf
                  @method('post')
                  

                 <div class="row mb-3" style="width:600px">
                  <label for="inputPassword" class="col-sm-2 col-form-label"><small></small></label>
                  <div class="col-sm-10">
                    <textarea class="form-control" style="height: 100px" name="taarifa_muhimu" placeholder="Taarifa muhimu" required></textarea>
                  </div>
              </div>

           
                 <div class="row mb-3" style="width:600px">
                  <label for="inputNumber" class="col-sm-2 col-form-label"></label>
                  <div class="col-sm-10">
                    <input class="form-control" type="file" id="formFile"  name="tangazo_pdf" required>
                  </div>
                </div>
              
                
                <div class="row mb-3" style="width:600px" align="right">
                  <label class="col-sm-2 col-form-label"></label>
                  <div class="col-sm-10">
                    <button type="submit" class="btn btn-primary">Submit</button>
                  </div>
                </div>



                 </form>


                
          


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