<div class="container">
    <?php foreach($about_user as $abt) : ?>

    <h1 class="text-center mb-5 text-underline"><?= $abt->title ?></h1>

    <img src="<?= base_url().'assets/uploads/'. $abt->gambar_user ?>" id="gambar_user">

    <p id="text_user" class=""><?= $abt->about_user ?></p>


    <div class="container my-5">
        <div class="border rounded p-4 shadow-sm">
            <div class="row justify-content-center">
                <div class="col-12">
                    <h1 class="text-center mb-5"><?= $abt->title_2 ?></h1>
                </div>

                
                <div class="col-md-6 d-flex flex-column align-items-center text-white bg-dark p-4 rounded mb-4 mb-md-0">
                    <img src="<?= base_url().'assets/uploads/'. $abt->gambar_kegiatan ?>" class="img-fluid mb-3"
                        style="max-height: 250px; object-fit: cover;">
                    <p class="text-center"><?= $abt->about_kegiatan ?></p>
                </div>

                
                <div class="col-md-6 d-flex flex-column align-items-center p-4 rounded">
                    <img src="<?= base_url().'assets/uploads/'. $abt->gambar_kegiatan_2 ?>" class="img-fluid mb-3"
                        style="max-height: 400px; object-fit: cover;">
                    <p class="text-center"><?= $abt->about_kegiatan_2 ?></p>
                </div>
            </div>
        </div>
    </div>



    <?php endforeach ?>
</div>