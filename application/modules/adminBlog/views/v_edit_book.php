<div class="container my-4">
    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <strong>Input Edit Books</strong>
        </div>

        <div class="card-body">
            <?php 
                foreach($edit_book as $key => $e_bks) :
                echo form_open_multipart('adminBlog/books/update/'. $e_bks->id_book);
            ?>
            <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" class="form-control" name="title" value="<?= $e_bks->title ?>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Judul</label>
                    <input type="text" class="form-control" name="judul" value="<?= $e_bks->judul ?>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Pengarang</label>
                    <input type="text" class="form-control" name="pengarang" value="<?= $e_bks->pengarang ?>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Penerbit</label>
                    <input type="text" class="form-control" name="penerbit" value="<?= $e_bks->penerbit ?>">
                </div>
                <div class="mb-3">
                    <label class="form-label">Tahun</label>
                    <input type="text" class="form-control" name="tahun" value="<?= $e_bks->tahun ?>">
                </div>
                <!-- <div class="mb-3">
                    <label class="form-label">Gambar</label>
                    <input type="file" class="form-control" name="gambar">
                </div> -->
                <div class="mb-3">
                    <label class="form-label">Ulasan</label>
                    <textarea class="ckeditor" name="ulasan"><?= $e_bks->ulasan ?></textarea>
                </div>

                <button type="submit" class="btn btn-success">
                    <i class="fa fa-save"></i> Simpan
                </button>
            <?php
                endforeach;
                echo form_close();
            ?>
        </div>
    </div>
</div>