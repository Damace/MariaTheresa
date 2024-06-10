  <!-- ======= Sidebar ======= -->
  <aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

      <li class="nav-item">
        <a class="nav-link " href="{{ url('home') }}">
          <i class="bi bi-grid"></i>
          <span>Dashboard</span>
        </a>
      </li><!-- End Dashboard Nav -->

      <li class="nav-item">
        <a class="nav-link collapsed"  href="{{ url('matangazo') }}">
        <i class="bi bi-megaphone-fill"></i>
          <span>Matangazo</span>
        </a>
      </li><!-- End Blank Page Nav -->

      
      <li class="nav-item">
        <a class="nav-link collapsed" href="{{ url('maoni') }}">
          
        <i class="bi bi-list"></i>
          <span>Maoni / Msaada  <span style="color:red">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="badge bg-danger badge-number"><?php echo Session::get('maoni');?></span></span></span>
          
        </a>
      </li><!-- End Blank Page Nav -->



      <li class="nav-item">
        <a class="nav-link collapsed"  href="{{ url('fomu_huduma') }}">
        <i class="bi bi-file-earmark-pdf" style="color:red"></i>
          <span>Fomu za huduma</span>
        </a>
      </li><!-- End Blank Page Nav -->
      


      <li class="nav-item">
        <a class="nav-link collapsed" href="{{ url('matukio') }}">
        <i class="bi bi-camera-video"></i>
          <span>Matukio ya Parokia</span>
        </a>
      </li><!-- End Blank Page Nav -->

  

      <li class="nav-item">
        <a class="nav-link collapsed" href="/mapadri">
        <i class="bi bi-people"></i>
          <span>Mapadri</span>
        </a>
      </li>

      <!-- <li class="nav-item">
        <a class="nav-link collapsed" href="/sensa">
        <i class="bi bi-people"></i>
          <span>Wageni</span>
        </a>
      </li>
       <li class="nav-item">
        <a class="nav-link collapsed" href="/sensa">
        <i class="bi bi-people"></i>
          <span>Sensa</span>
        </a>
      </li> -->


      
 

      <li class="nav-heading">Pages</li>

 


      <li class="nav-item">
        <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-menu-button-wide"></i><span>Components</span><i class="bi bi-chevron-down ms-auto"></i>
        </a>
        <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
          <li>
            <a href="components-alerts.html">
              <i class="bi bi-circle"></i><span>Change password</span>
            </a>
          </li>
          <li>
            <a  href="{{ url('/') }}">
              <i class="bi bi-circle"></i><span>Log Out</span>
            </a>
          </li>
     
        </ul>
      </li><!-- End Components Nav -->
  
    </ul>


    
  </aside><!-- End Sidebar-->
