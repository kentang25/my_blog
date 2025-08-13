<div class="container py-4">

    <!-- Section Cerita -->
    <div class="mb-5">
        <h3 class="mb-4 border-bottom pb-2">Cerita</h3>

        <div class="card shadow-sm border-0">
            <h4 class="card-title mb-3 text-center"><strong><?= $get_blog->title ?></strong></h4>
            <img src="<?= base_url('assets/uploads/' . $get_blog->gambar) ?>" 
                 class="card-img-top img-fluid rounded-top" 
                 alt="<?= $get_blog->title ?>">

            <div class="card-body">
                
                <p class="card-text" style="text-align: justify;">
                    <?= $get_blog->cerita ?>
                </p>
            </div>
        </div>
        
    </div>

</div>
