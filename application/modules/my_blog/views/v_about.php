<div class="container">
    <?php foreach($about_user as $abt) : ?>

        <h1><?= $abt->title ?></h1>

        <img src="<?= base_url().'assets/uploads/'. $abt->gambar_user ?>" width="350" height="500">

        <p><?= $abt->about_user ?></p>

        <h1><?= $abt->title_2 ?></h1>

        <img src="<?= base_url().'assets/uploads/'. $abt->gambar_kegiatan ?>" width="300" height="200">

        <p><?= $abt->about_kegiatan ?></p>
    <?php endforeach ?>
</div>