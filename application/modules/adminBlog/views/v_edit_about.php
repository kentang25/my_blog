<div class="container">
    <?= form_open_multipart('adminBlog/about/update') ?>

    <?php foreach($edit_about as $key => $edt) : ?>

    <label>Title</label>
    <input type="text" name="title" class="form-control" placeholder="Title" value="<?= $edt->title ?>">

    <!-- <label>Gambar User</label>
    <input type="file" name="gambar_user" class="form-control" placeholder="Gambar User"> -->

    <label>About User</label>
    <textarea class="ckeditor" name="about_user" id="about_blog" value=""><?= $edt->about_user ?></textarea>

    <label>Title Kegiatan</label>
    <input type="text" name="title_2" class="form-control" placeholder="Title Kegiatan" value="<?= $edt->title_2 ?>">

    <!-- <label>Gambar Kegiatan</label>
    <input type="file" name="gambar_kegiatan" class="form-control" placeholder="Gambar Kegiatan"> -->

    <label>About Kegiatan</label>
    <textarea class="ckeditor" name="about_kegiatan" id="about_blog" value=""><?= $edt->about_kegiatan ?></textarea>

    <!-- <label>Gambar Kegiatan 2</label>
    <input type="file" name="gambar_kegiatan_2" class="form-control" placeholder="Gambar Kegiatan"> -->

    <label>About Kegiatan 2</label>
    <textarea class="ckeditor" name="about_kegiatan_2" id="about_blog" value=""><?= $edt->about_kegiatan_2 ?></textarea>

    <button type="submit">Simpan</button>

    <?php endforeach ?>

    <?= form_close() ?>
</div>