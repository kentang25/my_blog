<div class="container">
	<div class="main">
    <div class="row justify-content-center">
        <?php foreach ($dashboard_blog as $dsh) : ?>
            <div class="col-md-8 col-10 mb-4">
                <div class="d-flex flex-column flex-md-row border rounded p-3 bg-white shadow-sm">
                    
                    <!-- Gambar -->
                    <div class="mb-3 mb-md-0 me-md-4 text-center">
                        <img src="<?= base_url('assets/uploads/' . $dsh->gambar) ?>" 
                             width="300" height="400" 
                             class="rounded" alt="Gambar Blog">
                    </div>

                    <!-- Deskripsi -->
                    <div class="">
                        <p class="mb-0"><?= $dsh->about_blog ?></p>
                    </div>
                    
                </div>
            </div>
        <?php endforeach; ?>
        </div>
    </div>
</div>
