<div class="container">
    <?= form_open_multipart('adminBlog/about/insert') ?>

        <label>Title</label>
        <input type="text" name="title" class="form-control" placeholder="Title">

        <label>Gambar User</label>
        <input type="file" name="gambar_user" class="form-control" placeholder="Gambar User">

        <label>About User</label>
        <textarea class="ckeditor" name="about_user" id="about_blog"></textarea>

        <label>Title Kegiatan</label>
        <input type="text" name="title_2" class="form-control" placeholder="Title Kegiatan">

        <label>Gambar Kegiatan</label>
        <input type="file" name="gambar_kegiatan" class="form-control" placeholder="Gambar Kegiatan">

        <label>About Kegiatan</label>
        <textarea class="ckeditor" name="about_kegiatan" id="about_blog"></textarea>

        <button type="submit">Simpan</button>

    <?= form_close() ?>
</div>