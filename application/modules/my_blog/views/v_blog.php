<div class="container py-4">

    <!-- Section Cerita -->
    <div class="mb-5">
        <h3 class="mb-4">Cerita</h3>
        <div class="row">
            <?php foreach($cerita as $crt): ?>
                <div class="col-md-4 mb-4">
                    <a href="<?= base_url('blog/'. $crt->id_cerita) ?>">
                        <img src="<?= base_url('assets/uploads/' . $crt->gambar) ?>" width="300" height="200" class="img-fluid rounded mb-2">
                    </a>
                    <p><?= $crt->title ?></p>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <!-- Section Daily Life -->
    <div class="mb-5">
        <h3 class="mb-4">Daily Life</h3>
        <div class="row">
            <?php foreach($daily_life as $dlf): ?>
                <div class="col-md-4 mb-4">
                    <a href="#">
                        <img src="<?= base_url('assets/uploads/' . $dlf->gambar) ?>" width="300" height="200" class="img-fluid rounded mb-2">
                    </a>
                    <p><?= $dlf->title ?></p>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

    <!-- Section Jalan-jalan -->
    <div class="mb-5">
        <h3 class="mb-4">Jalan-jalan</h3>
        <div class="row">
            <?php foreach($jalan_jalan as $jln): ?>
                <div class="col-md-4 mb-4">
                    <a href="#">
                        <img src="<?= base_url('assets/uploads/' . $jln->gambar) ?>" width="300" height="200" class="img-fluid rounded mb-2">
                    </a>
                    <p><?= $jln->title ?></p>
                </div>
            <?php endforeach; ?>
        </div>
    </div>

</div>
