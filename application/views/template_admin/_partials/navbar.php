<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
<div id="content">

    <!-- Topbar -->
    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

        <!-- Sidebar Toggle (Topbar) -->
        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
        </button>

        <!-- Topbar Search -->
        <!-- <?= form_open('dg_admin/data_barang/search') ?>
            <input type="" name="keyword" placeholder="Cari">
            <input type="submit" value="cari">
        <?= form_close(); ?> -->

        <!-- <form
            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="<?= site_url('fa_admin/data_barang/search') ?>"  method="GET">
            <div class="input-group">
                <input type="text" name="keyword" id="search-bar" class="form-control bg-light border-0 small" placeholder="Search for..."
                    aria-label="Search" aria-describedby="basic-addon2">
                <div class="input-group-append">
                    <button class="btn btn-primary" id="btn-search" type="button">
                        <i class="fas fa-search fa-sm"></i>
                    </button>
                </div>
            </div>
        </form> -->

        <!-- Topbar Navbar -->
        <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-search fa-fw"></i>
                </a>
                <!-- Dropdown - Messages -->
                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                    aria-labelledby="searchDropdown">
                    <?= form_open('dg_admin/data_barang/search'); ?>
                        <div class="input-group">
                            <input type="" name="keyword" class="form-control bg-light border-0 small"
                                placeholder="Search for..." aria-label="Search"
                                aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    <?= form_close() ?>
                </div>
            </li>

            <div class="navbar">
                
                <div class="topbar-divider d-none d-sm-block"></div>

                <!-- Nav Item - User Information -->
                <ul class="nav navbar-nav navbar-right">
                    <div><a href="<?= base_url('admin/logout') ?>"><i class="fa-solid fa-right-from-bracket"></i></a></div>
                </ul>

            </div>

        </ul>

    </nav>
    <!-- End of Topbar -->

    <!-- search data -->

    <!-- <script>
        $document().ready(function(){
            $('#search-bar').on('input',function{
                let keyword = $(this).val();

                .ajax({
                    url: "<?= site_url('fa_admin/data_barang/search') ?>",
                    type: "GET",
                    data: {keyword: keyword}
                    success : function(response){
                        $('#search-result').html(response);
                    },

                    error: function(xhr,status,error){
                        console.error("AJAX Error: ", status, error);
                    }
                })
            })
        });
    </script> -->