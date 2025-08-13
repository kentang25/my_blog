<div class="container py-4">

    <!-- Section Cerita -->
    <div class="mb-5">
        <h3 class="mb-4 border-bottom pb-2">Cerita</h3>
        <div class="row">
            <?php foreach($cerita as $crt): ?>
                <div class="col-md-4 mb-4">
                    <div class="card h-100 shadow-sm border-0">
                        <a href="<?= base_url('blog/'. $crt->id_cerita) ?>">
                            <img src="<?= base_url('assets/uploads/' . $crt->gambar) ?>" class="card-img-top img-fluid rounded-top" alt="<?= $crt->title ?>">
                        </a>
                        <div class="card-body">
                            <h6 class="card-title mb-0"><?= $crt->title ?></h6>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <!-- Section Daily Life -->
    <div class="mb-5">
        <h3 class="mb-4 border-bottom pb-2">Daily Life</h3>
        <div class="row">
            <?php foreach($daily_life as $dlf): ?>
                <div class="col-md-4 mb-4">
                    <div class="card h-100 shadow-sm border-0">
                        <a href="#">
                            <img src="<?= base_url('assets/uploads/' . $dlf->gambar) ?>" class="card-img-top img-fluid rounded-top" alt="<?= $dlf->title ?>">
                        </a>
                        <div class="card-body">
                            <h6 class="card-title mb-0"><?= $dlf->title ?></h6>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <!-- Section Jalan-jalan -->
    <div class="mb-5">
        <h3 class="mb-4 border-bottom pb-2">Jalan-jalan</h3>
        <div class="row">
            <?php foreach($jalan_jalan as $jln): ?>
                <div class="col-md-4 mb-4">
                    <div class="card h-100 shadow-sm border-0">
                        <a href="#">
                            <img src="<?= base_url('assets/uploads/' . $jln->gambar) ?>" class="card-img-top img-fluid rounded-top" alt="<?= $jln->title ?>">
                        </a>
                        <div class="card-body">
                            <h6 class="card-title mb-0"><?= $jln->title ?></h6>
                        </div>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

</div>
