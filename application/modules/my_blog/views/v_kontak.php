<div class="container my-5">
    <div class="row justify-content-center">
        <?php foreach($kontak as $key => $ktk): ?>
            <div class="col-md-8">
                <div class="card shadow-lg border-0 rounded-4 p-4">
                    <!-- Judul -->
                    <h2 class="text-center mb-4"><?= $ktk->title ?></h2>

                    <!-- Gambar -->
                    <div class="text-center mb-4">
                        <img src="<?= base_url('assets/uploads/'.$ktk->gambar) ?>" 
                             class="img-fluid rounded-3 shadow-sm"
                             style="max-width: 300px; height: auto;">
                    </div>

                    <!-- Sosial Media -->
                    <div class="row row-cols-1 row-cols-md-3 g-3 mb-4 text-center">
  <!-- Instagram -->
  <div class="col">
    <div class="d-flex align-items-center justify-content-center gap-2 p-3 border rounded-3 shadow-sm h-100">
      <i class="fa-brands fa-instagram fa-2x fa-fw text-danger"></i>
      <span class="fw-semibold text-truncate" style="max-width:220px;">
        <?= html_escape($ktk->instagram ?? '-') ?>
      </span>
    </div>
  </div>

  <!-- Facebook -->
  <div class="col">
    <div class="d-flex align-items-center justify-content-center gap-2 p-3 border rounded-3 shadow-sm h-100">
      <i class="fa-brands fa-square-facebook fa-2x fa-fw text-primary"></i>
      <span class="fw-semibold text-truncate" style="max-width:220px;">
        <?= html_escape($ktk->facebook ?? '-') ?>
      </span>
    </div>
  </div>

  <!-- Email -->
  <div class="col">
    <div class="d-flex align-items-center justify-content-center gap-2 p-3 border rounded-3 shadow-sm h-100">
      <i class="fa-solid fa-envelope fa-2x fa-fw"></i>
      <span class="fw-semibold text-truncate" style="max-width:220px;">
        <?= html_escape($ktk->email ?? '-') ?>
      </span>
    </div>
  </div>
</div>


                    <!-- Kalimat -->
                    <p class="text-center fst-italic text-muted">
                        "<?= $ktk->kalimat ?>"
                    </p>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>
