 <!-- Page Wrapper -->
 <div id="wrapper">

<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
        <div class="sidebar-brand-icon">
            <i class="fas fa-store"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Admin Blog</div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    <li class="nav-item active">
        <a class="nav-link" href="<?= base_url('admin') ?>">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Admin - Dashboard</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('admin/dashboard-blog') ?>">
             <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard-blog</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('admin/about-blog') ?>">
            <i class="fa-solid fa-address-card"></i>
            <span>About</span></a>
    </li>

     <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                   <i class="fa-solid fa-file"></i>
                    <span>Blog</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Kategori Blog:</h6>
                        <a class="collapse-item" href="<?= base_url('admin/blog/cerita') ?>">Cerita</a>
                        <a class="collapse-item" href="<?= base_url('admin/blog/daily-life') ?>">Daily Life</a>
                        <a class="collapse-item" href="<?= base_url('admin/blog/jalan-jalan') ?>">Jalan-jalan</a>
                    </div>
                </div>
            </li>


    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('admin/books') ?>">
            <i class="fa-solid fa-book"></i>
            <span>Books</span></a>
    </li>

    <li class="nav-item">
        <a class="nav-link" href="<?= base_url('admin/kontak') ?>">
            <i class="fa-solid fa-address-card"></i>
            <span>Kontak</span></a>
    </li>

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

    

</ul>
<!-- End of Sidebar -->
