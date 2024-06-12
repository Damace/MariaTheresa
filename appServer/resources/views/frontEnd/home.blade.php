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
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">


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



        <?php echo Session::get('success'); ?>
        <?php Session::forget('success'); ?>



        <div class="pagetitle">
            <h1>Dashboard</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="/home">Home</a></li>
                    <li class="breadcrumb-item active">Dashboard</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->



        <div>

            @if (session('flash_message'))
                <div class="alert alert-success" role="alert">
                    <a href="#" class="alert-link">
                        {{ session('flash_message') }}

                    </a>
                </div>
            @endif
        </div>
        </div>

        @if (session('flash_message2'))
            <div class="alert alert-success" role="alert">
                <a href="#" class="alert-link">
                    {{ session('flash_message2') }}

                </a>
            </div>
        @endif
        </div>
        </div>


        <section class="section dashboard">
            <div class="row">

                <!-- Left side columns -->
                <div class="col-lg-12">
                    <div class="row">

                        <!-- Sales Card -->
                        <div class="col-xxl-4 col-md-4">
                            <div class="card info-card sales-card">
                                <div class="filter">
                                    <a class="icon" href="#" data-bs-toggle="dropdown"><i
                                            class="bi bi-three-dots"></i></a>
                                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                        <li class="dropdown-header text-start">
                                        </li>
                                        <li><a class="dropdown-item" href="#"> <i class="bi bi-person-add"></i><b>
                                                    <span data-bs-toggle="modal"
                                                        data-bs-target="#basicModal">Jumuiya</span></b></a></li>
                                    </ul>
                                </div>






                                <div class="card-body">
                                    <h5 class="card-title"><small>Jumuya za Parokia </small><span>| Zilizo
                                            sajiliwa</span></h5>

                                    <div class="d-flex align-items-center">
                                        <div
                                            class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="bi bi-people"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6> {!! $idadi_jumuiya !!}</h6>


                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div><!-- End Sales Card -->

                        <!-- Revenue Card -->
                        <div class="col-xxl-4 col-md-4">
                            <div class="card info-card revenue-card">

                                <div class="filter">
                                    <a class="icon" href="#" data-bs-toggle="dropdown"><i
                                            class="bi bi-three-dots"></i></a>
                                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                        <li class="dropdown-header text-start">
                                        </li>
                                        <li><a class="dropdown-item" href="#"> <i class="bi bi-person-add"></i><b>
                                                    <span data-bs-toggle="modal"
                                                        data-bs-target="#basicModal">Jumuiya</span></b></a></li>
                                    </ul>
                                </div>







                                <div class="card-body">
                                    <h5 class="card-title"><small>Vyama vya Kitume </small><span></span></h5>

                                    <div class="d-flex align-items-center">
                                        <div
                                            class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="bi bi-people"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>0</h6>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div><!-- End Revenue Card -->

                        <!-- Customers Card -->
                        <div class="col-xxl-4 col-xl-4">

                            <div class="card info-card customers-card">


                                <div class="card-body">
                                    <h5 class="card-title"><small>Jumla ya Waumini wote </small></h5>

                                    <div class="d-flex align-items-center">
                                        <div
                                            class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                            <i class="bi bi-people"></i>
                                        </div>
                                        <div class="ps-3">
                                            <h6>0</h6>


                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div><!-- End Customers Card -->









                        <div class="modal fade" id="basicModal" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title"> <i class="bi bi-person-add"></i> Jumuiya</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">



                                        <form class="row g-3 needs-validation" novalidate
                                            action="{{ url('jumuiya_mpya') }}" method="POST">
                                            @csrf
                                            @method('post')

                                            <div class="col-12">
                                                <label for="yourPassword" class="form-label">Jina</label>
                                                <input type="text" name="jina" class="form-control"
                                                    id="yourPassword" required>
                                                <div class="invalid-feedback">Jina la Jumuiya ni lazima</div>
                                            </div>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>

                                    </form>
                                </div>
                            </div>
                        </div><!-- End Basic Modal-->


                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"></h5>

                                <!-- Bordered Tabs -->
                                <ul class="nav nav-tabs" id="myTab" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="home-tab" data-bs-toggle="tab"
                                            data-bs-target="#bordered-home" type="button" role="tab"
                                            aria-controls="home" aria-selected="true"> <i class="bi bi-people"></i>
                                            <small>Jumuiya</small></button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="profile-tab" data-bs-toggle="tab"
                                            data-bs-target="#bordered-profile" type="button" role="tab"
                                            aria-controls="profile" aria-selected="false"> <i
                                                class="bi bi-megaphone-fill"></i><small> Matangazo </small></button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab"
                                            data-bs-target="#bordered-contact" type="button" role="tab"
                                            aria-controls="contact" aria-selected="false"> <i
                                                class="bi bi-list"></i><small> Fomu za huduma</small></button>
                                    </li>

                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab"
                                            data-bs-target="#bordered-matukio" type="button" role="tab"
                                            aria-controls="matukio" aria-selected="false"> <i
                                                class="bi bi-camera-video"></i> <small> Matukio ya
                                                parokia</small></button>
                                    </li>


                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="contact-tab" data-bs-toggle="tab"
                                            data-bs-target="#bordered-mapadri" type="button" role="tab"
                                            aria-controls="mapadri" aria-selected="false"> <i
                                                class="bi bi-people"></i> <small> Mapadri</small></button>
                                    </li>


                                </ul>
                                <div class="tab-content pt-2" id="borderedTabContent">
                                    <div class="tab-pane fade show active" id="bordered-home" role="tabpanel"
                                        aria-labelledby="home-tab">

                                        <!--  Tab Contentttttttttttttttttttttttttttttttttttttttttt -->


                                        <section class="section">
                                            <div class="row">
                                                <div class="col-lg-12">

                                                    <div class="card">
                                                        <div class="card-body">


                                                            <h5 class="card-title"><small>Jumuiya za Parokia</small>
                                                            </h5>

                                                            <div align="right">
                                                                <p>
                                                                    <button type="button btn-success"
                                                                        class="btn btn-outline-dark"
                                                                        data-bs-toggle="modal"
                                                                        data-bs-target="#basicModal">
                                                                        <i class="bi bi-person-add"></i>
                                                                        <small>Jumuiya</small>
                                                                    </button>

                                                            </div>



                                                            <!-- Table with stripped rows -->
                                                            <table class="table datatable">
                                                                <thead>
                                                                    <tr>
                                                                        <th><small>
                                                                                Jina </small>
                                                                        </th>
                                                                        <th><small>
                                                                                Kanda / Mtaa </small></th>
                                                                        <th><small>
                                                                                Idadi ya wanajumuiya </small>
                                                                        </th>
                                                                        <th><small>
                                                                                Kiongozi ( Mwenyekiti )
                                                                            </small></th>

                                                                        <th><small>
                                                                                Namba ya Simu
                                                                            </small>
                                                                        </th>

                                                                        <th><small>
                                                                                Action
                                                                            </small>
                                                                        </th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    @foreach ($name as $data)
                                                                        <tr>

                                                                            <td>{{ $data->jina }}</td>
                                                                            <td>{{ $data->kanda }}</td>
                                                                            <td>{{ $data->Idadi_ya_wanajumuiya }}</td>
                                                                            <td>{{ $data->kiongozi }}</td>
                                                                            <td>{{ $data->namba_ya_sim }}</td>
                                                                            <td style="cursor:pointer"><a
                                                                                    href="{{ url('jumuiya/' . $data->id . '/' . $data->jina) }}"><i
                                                                                        class="bi bi-eye-fill me-1 text-primary"></i>
                                                                            </td>
                                                                        </tr>
                                                                    @endforeach

                                                                </tbody>
                                                            </table>
                                                            <!-- End Table with stripped rows -->

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </section>


                                        <!--  End of Tab Contentsssssssssssssssssssssssssss -->

                                    </div>
                                    <div class="tab-pane fade" id="bordered-profile" role="tabpanel"
                                        aria-labelledby="profile-tab">


                                        <!--  Tab Contentttttttttttttttttttttttttttttttttttttttttt -->
                                        <section class="section">
                                            <div class="row">
                                                <div class="col-lg-12">

                                                    <div class="card">
                                                        <div class="card-body">
                                                            <h5 class="card-title"></h5>

                                                            <!-- Table with stripped rows -->
                                                            <table class="table datatable">
                                                                <thead>
                                                                    <tr>
                                                                        <th><small>
                                                                                Tarehe </small>
                                                                        </th>
                                                                        <th><small>
                                                                                Dominika</small></th>

                                                                        <th><small>
                                                                                Action
                                                                            </small>
                                                                        </th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    @if (!empty($matangazo))
                                                                        @foreach ($matangazo as $data)
                                                                            <tr>

                                                                                <td>{{ $data->tarehe }}</td>
                                                                                <td>{{ $data->dominika }}</td>
                                                                                <td><a href="{{ $data->file }}"
                                                                                        target="_blank"><i
                                                                                            class="bi bi-eye me-1"
                                                                                            style="color:blue"
                                                                                            title="Pre View"></i></a>
                                                                                    &nbsp&nbsp&nbsp <a
                                                                                        href="{{ $data->file2 }}"><i
                                                                                            class="bi bi-download me-1"
                                                                                            style="color:green"
                                                                                            title="Download"></i></a>
                                                                                    &nbsp&nbsp&nbsp <a
                                                                                        href="{{ url('delete_tangazo/' . $data->tarehe) }}"><i
                                                                                            class="bi bi-trash me-1"
                                                                                            style="font-weight:bold,color:red"></i></a>
                                                                                </td>
                                                                            </tr>
                                                                        @endforeach
                                                                    @else
                                                                        <tr>
                                                                            <td></td>
                                                                            <td style="color:gray">No entries found
                                                                            </td>
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


                                        <!--  End of Tab Contentsssssssssssssssssssssssssss -->

                                    </div>


                                    <div class="tab-pane fade" id="bordered-contact" role="tabpanel"
                                        aria-labelledby="contact-tab">

                                        <!--  Tab Contentttttttttttttttttttttttttttttttttttttttttt -->


                                        <section class="section">
                                            <div class="row">
                                                <div class="col-lg-12">

                                                    <div class="card">
                                                        <div class="card-body">
                                                            <h5 class="card-title"></h5>


                                                            <!-- Table with stripped rows -->
                                                            <table class="table datatable">
                                                                <thead>
                                                                    <tr>

                                                                        <th><small>
                                                                                Jina
                                                                            </small>
                                                                        </th>
                                                                        <!--
                    <th><small>
                      Action
                       </small>
                    </th> -->
                                                                        <th><small>
                                                                                Action
                                                                            </small>
                                                                        </th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    @if (!empty($fomu_za_huduma))
                                                                        @foreach ($fomu_za_huduma as $data3)
                                                                            <tr>
                                                                                <td><i class="bi bi-file-earmark-pdf"
                                                                                        style="color:red"></i>
                                                                                    {{ $data3->jina }}</td>
                                                                                <td><a href="{{ $data3->preview }}"
                                                                                        target="_blank"><i
                                                                                            class="bi bi-eye me-1"
                                                                                            style="color:blue"
                                                                                            title="Pre View"></i></a>
                                                                                    &nbsp&nbsp&nbsp <a
                                                                                        href="{{ $data3->file_path }}"><i
                                                                                            class="bi bi-download me-1"
                                                                                            style="color:green"
                                                                                            title="Download"></i></a>
                                                                                    &nbsp&nbsp&nbsp <a
                                                                                        href="{{ url('delete_file/' . $data3->id) }}"><i
                                                                                            class="bi bi-trash me-1"
                                                                                            style="font-weight:bold,color:red"></i></a>
                                                                                </td>
                                                                            </tr>
                                                                        @endforeach
                                                                    @else
                                                                        <tr>
                                                                            <td></td>
                                                                            <td style="color:gray">No entries found
                                                                            </td>
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


                                        <!--  End of Tab Contentsssssssssssssssssssssssssss -->


                                    </div>




                                    <div class="tab-pane fade" id="bordered-matukio" role="tabpanel"
                                        aria-labelledby="matukio">


                                        <!--  Tab Contentttttttttttttttttttttttttttttttttttttttttt -->
                                        <section class="section">
                                            <div class="row">
                                                <div class="col-lg-12">

                                                    <div class="card">
                                                        <div class="card-body">
                                                            <h5 class="card-title"></h5>

                                                            <!-- Table with stripped rows -->
                                                            <table class="table datatable">
                                                                <thead>
                                                                    <tr>
                                                                        <th><small>
                                                                                JIna </small>
                                                                        </th>
                                                                        <th><small>
                                                                                Maelezo</small></th>

                                                                        <th><small>
                                                                                Action
                                                                            </small>
                                                                        </th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    @if (!empty($matukio))
                                                                        @foreach ($matukio as $data)
                                                                            <tr>

                                                                                <td>{{ $data->video_title }}</td>
                                                                                <td>{{ $data->video_description }}</td>
                                                                                <td><a
                                                                                        href="{{ url('delete_matukio/' . $data->id) }}"><i
                                                                                            class="bi bi-trash me-1"
                                                                                            style="font-weight:bold,color:red"></i></a>
                                                                                </td>
                                                                            </tr>
                                                                        @endforeach
                                                                    @else
                                                                        <tr>
                                                                            <td></td>
                                                                            <td style="color:gray">No entries found
                                                                            </td>
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


                                        <!--  End of Tab Contentsssssssssssssssssssssssssss -->

                                    </div>





                                    <div class="tab-pane fade" id="bordered-mapadri" role="tabpanel"
                                        aria-labelledby="mapadri">


                                        <!--  Tab Contentttttttttttttttttttttttttttttttttttttttttt -->
                                        <section class="section">
                                            <div class="row">
                                                <div class="col-lg-12">

                                                    <div class="card">
                                                        <div class="card-body">
                                                            <h5 class="card-title"></h5>

                                                            <!-- Table with stripped rows -->
                                                            <table class="table datatable">
                                                                <thead>
                                                                    <tr>
                                                                        <th><small>
                                                                                Majina Kamili </small>
                                                                        </th>
                                                                        <th><small>
                                                                                Cheo</small></th>

                                                                        <th><small>
                                                                                Namba ya simu
                                                                            </small>
                                                                        </th>
                                                                        <th><small>
                                                                                Action
                                                                            </small>
                                                                        </th>

                                                                    </tr>
                                                                </thead>
                                                                <tbody>

                                                                    @if (!empty($mapadre))
                                                                        @foreach ($mapadre as $data)
                                                                            <tr>

                                                                                <td>{{ $data->majina_kamili }}</td>
                                                                                <td>{{ $data->cheo }}</td>
                                                                                <td>{{ $data->namba_ya_simu }}</td>
                                                                                <td><a
                                                                                        href="{{ url('delete_padri/' . $data->id) }}"><i
                                                                                            class="bi bi-trash me-1"
                                                                                            style="font-weight:bold,color:red"></i></a>
                                                                                </td>


                                                                            </tr>
                                                                        @endforeach
                                                                    @else
                                                                        <tr>
                                                                            <td></td>
                                                                            <td style="color:gray">No entries found
                                                                            </td>
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


                                        <!--  End of Tab Contentsssssssssssssssssssssssssss -->

                                    </div>



                                </div><!-- End Bordered Tabs -->

                            </div>
                        </div>

















                    </div>
                </div><!-- End Left side columns -->






            </div>
        </section>

    </main><!-- End #main -->



    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

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
