<div class="container">
    <?= form_open_multipart('adminBlog/cerita/insert') ?>

        <div class="form-group">
            <label>Title</label>
            <input type="text" name="title" class="form-control" placeholder="Title">
        </div>

        <div class="form-group">
            <label>Gambar</label>
            <input type="file" name="gambar" class="form-control">
        </div>

        <div class="form-group">
            <label>Cerita</label>
            <textarea name="cerita" id="cerita" class="ckeditor"></textarea>
        </div>

        <button type="submit">Simpan</button>

    <?= form_close(); ?>
</div>