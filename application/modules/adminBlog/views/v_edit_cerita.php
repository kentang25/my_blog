<div class="container">
    <?= form_open_multipart('adminBlog/cerita/update') ?>

        <?php foreach($edit_cerita as $key => $crt) : ?>

        <div class="form-group">
            <label>Title</label>
            <input type="text" name="title" class="form-control" placeholder="Title" value="<?= $crt->title ?>">
        </div>

        <!-- <div class="form-group">
            <label>Gambar</label>
            <input type="file" name="gambar" class="form-control">
        </div> -->

        <div class="form-group">
            <label>Cerita</label>
            <textarea name="cerita" id="cerita" class="ckeditor"><?= $crt->cerita ?></textarea>
        </div>

        <button type="submit">Simpan</button>

        <?php endforeach ?>
    <?= form_close(); ?>
</div>