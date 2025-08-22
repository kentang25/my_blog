<div class="container my-4">
    <div class="card mb-3">
        <div class="card-header bg-primary text-white">
            <strong>Edit Input Kontak</strong>
        </div>

        <div class="card-body">
            <?php
                foreach($edit_kontak as $key => $e_ktk) :
                echo form_open_multipart('adminBlog/kontak/update/'. $e_ktk->id_kontak);
            ?>
            <div class="mb-3">
                <label class="title">Title</label>
                <input type="text" name="title" class="form-control" value="<?= $e_ktk->title ?>">
            </div>

            <div class="mb-3">
                <label class="title">Instagram</label>
                <input type="text" name="instagram" class="form-control" value="<?= $e_ktk->instagram ?>">
            </div>

            <div class="mb-3">
                <label class="title">Facebook</label>
                <input type="text" name="facebook" class="form-control" value="<?= $e_ktk->facebook ?>">
            </div>

            <div class="mb-3">
                <label class="title">Email</label>
                <input type="text" name="email" class="form-control" value="<?= $e_ktk->email ?>">
            </div>

            <div class="mb-3">
                        <label class="form-label">Kalimat</label>
                        <textarea class="ckeditor" name="kalimat"><?= $e_ktk->kalimat ?></textarea>
                </div>

            <button class="btn btn-success">
                <i class="fa fa-save"></i> Simpan
            </button>

            <?php
                endforeach;
                echo form_close();
            ?>
        </div>
    </div>
</div>