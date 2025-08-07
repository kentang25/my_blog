<div class="container">
    <?php foreach($edit_jalan as $key => $e_jln) : ?>
    <?= form_open_multipart('adminBlog/jalan_jalan/update/'. $e_jln->id_jalan); ?>
    <div class="form-group">
        <label>Title</label>
        <input type="text" name="title" class="form-control" placeholder="Title" value="<?= $e_jln->title ?>">
    </div>

    <!-- <div class="form-group">
            <label>Gambar</label>
            <input type="file" name="gambar" class="form-control">
        </div> -->

    <div class="form-group">
        <label>Daily Life</label>
        <textarea name="ceritanya" id="ceritanya" class="ckeditor"><?= $e_jln->ceritanya ?></textarea>
    </div>

    <button type="submit">Simpan</button>
    <?= form_close() ?>
    <?php endforeach ?>
</div>