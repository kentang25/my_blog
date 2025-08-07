<div class="container">
    <?php foreach($edit_daily_life as $key => $e_dlf) : ?>
    <?= form_open_multipart('adminBlog/daily_life/update/'. $e_dlf->id_daily_life); ?>
    <div class="form-group">
        <label>Title</label>
        <input type="text" name="title" class="form-control" placeholder="Title" value="<?= $e_dlf->title ?>">
    </div>

    <!-- <div class="form-group">
            <label>Gambar</label>
            <input type="file" name="gambar" class="form-control">
        </div> -->

    <div class="form-group">
        <label>Daily Life</label>
        <textarea name="daily_life" id="daily_life" class="ckeditor"><?= $e_dlf->daily_life ?></textarea>
    </div>

    <button type="submit">Simpan</button>
    <?= form_close() ?>
    <?php endforeach ?>
</div>