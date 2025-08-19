<div class="container my-5">
    <div class="card shadow-lg border-0 rounded-4 overflow-hidden">
        <div class="row g-0 flex-column flex-md-row">
            
            <!-- Gambar Buku -->
            <div class="col-md-5">
                <img src="<?= base_url('assets/uploads/' . $detail_books->gambar) ?>" 
                     class="img-fluid" 
                     alt="Cover Buku <?= $detail_books->judul ?>">
            </div>

            <!-- Detail Buku -->
            <div class="col-md-7">
                <div class="card-body p-4">
                    <div class="mb-3">
                        <label class="fw-semibold text-secondary d-block">Judul :</label>
                        <h3 class="fw-bold text-primary mb-0"><?= $detail_books->judul ?></h3>
                    </div>

                    <div class="mb-3">
                        <label class="fw-semibold text-secondary d-block">Pengarang :</label>
                        <h5 class="text-dark mb-0"><?= $detail_books->pengarang ?></h5>
                    </div>

                    <div class="mb-3">
                        <label class="fw-semibold text-secondary d-block">Penerbit :</label>
                        <h6 class="text-muted mb-0"><?= $detail_books->penerbit ?></h6>
                    </div>

                    <div class="mt-4">
                        <label class="fw-semibold text-secondary d-block">Ulasan :</label>
                        <p class="text-justify mb-0"><?= $detail_books->ulasan ?></p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<style>
    .object-fit-cover {
        object-fit: cover;
    }
    @media (max-width: 768px) {
        .card-body {
            padding: 1.5rem;
        }
        img.object-fit-cover {
            max-height: 300px;
        }
    }
</style>
