<div class="container">
    <?= form_open_multipart('adminBlog/daily_life/insert'); ?>

        <div class="form-group">
            <label>Title</label>
            <input type="text" name="title" class="form-control" placeholder="title">
        </div>

        <div class="form-group">
            <label>Gambar</label>
            <input type="file" name="gambar" class="form-control">
        </div>

        <div class="form-group">
            <textarea name="daily_life" id="daily_life" class="ckeditor"></textarea>
        </div>

        <button type="submit">Simpan</button>

    <?= form_close() ?>
</div>