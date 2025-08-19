<div class="container my-4">
    <div class="row g-4">
        <?php foreach($books as $key => $bks): ?>
        <div class="col-md-4 col-sm-6">
            <div class="card shadow-sm h-100 border-0 rounded-3">
                <div class="card-header bg-dark text-white">
                    <strong><?= $bks->title ?></strong>
                </div>
                <div class="card-body text-center">
                    <a href="<?= base_url('books/'. $bks->id_book) ?>"><img
                            src="<?= base_url('assets/uploads/' . $bks->gambar) ?>" class="img-fluid rounded mb-3"
                            style="max-height: 250px; object-fit: cover;"></a>
                    <div class="mb-2">
                        <label class="fw-bold text-dark">Judul:</label>
                        <h5 class="mb-1 text-muted d-inline"><?= $bks->judul ?></h5>
                    </div>

                    <div class="mb-2">
                        <label class="fw-bold text-dark">Pengarang:</label>
                        <h5 class="mb-1 text-primary d-inline"><?= $bks->pengarang ?></h5>
                    </div>

                    <div class="mb-2">
                        <label class="fw-bold text-dark">Penerbit:</label>
                        <h6 class="text-muted d-inline"><?= $bks->penerbit ?></h6>
                    </div>

                    <div class="mb-2">
                        <label class="fw-bold text-dark">Tahun:</label>
                        <span class="badge bg-secondary"><?= $bks->tahun ?></span>
                    </div>


                    <!--  -->
                </div>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
</div>