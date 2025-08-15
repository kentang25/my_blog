<div class="container my-5">
    <div class="card shadow-lg border-0 rounded-4 overflow-hidden">
        <div class="row g-0">
            <!-- Gambar Buku -->
            <div class="col-md-5">
               <img src="<?= base_url('assets/uploads/' . $detail_books->gambar) ?>" 
     class="img-fluid rounded" 
     style="max-width: 100%; height: auto;">

            </div>

            <!-- Detail Buku -->
            <div class="col-md-7">
                <div class="card-body p-4">
                    <h3 class="fw-bold mb-2 text-primary"><?= $detail_books->judul ?></h3>
                    <h5 class="text-dark mb-1"><?= $detail_books->pengarang ?></h5>
                    <h6 class="text-muted mb-3"><?= $detail_books->penerbit ?></h6>
                    
                    <p class="text-justify"><?= $detail_books->ulasan ?></p>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.object-fit-cover {
    object-fit: cover;
}
</style>
