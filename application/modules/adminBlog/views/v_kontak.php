<div class="container my-4">
    <div class="card mb-3">
        <div class="card-header bg-primary text-white">
            <strong>Kontak</strong>
        </div>
        <?= form_open_multipart('adminBlog/kontak/insert_kontak') ?>
        <div class="card-body">
            <div class="mb-3">
                <label>Title</label>
                <input type="text" name="title" class="form-control">
            </div>

            <div class="mb-3">
                <label>Instagram</label>
                <input type="text" name="instagram" class="form-control">
            </div>

            <div class="mb-3">
                <label>Facebook</label>
                <input type="text" name="facebook" class="form-control">
            </div>

            <div class="mb-3">
                <label>Email</label>
                <input type="text" name="email" class="form-control">
            </div>

            <div class="mb-3">
                <label>Kalimat</label>
                <textarea class="form-control ckeditor" name="kalimat" id="kalimat" rows="5"></textarea>
            </div>

            <div class="mb-3">
                <label>Gambar</label>
                <input type="file" name="gambar" class="form-control">
            </div>

            <button class="btn btn-success">
                <i class="fa fa-save"></i> Simpan
            </button>
        </div>
        <?= form_close(); ?>

        <div class="card">
            <div class="card-header bg-dark text-white">
                <strong>Daftar Kontak</strong>
            </div>
            
            <div class="card-body table-responsive">
                <table class="table table-striped table-bordered table-hove align-middle">
                    <thead class="table-dark text-center">
                        <tr>
                            <th>No</th>
                            <th>Title</th>
                            <th>Instagram</th>
                            <th>Facebook</th>
                            <th>Email</th>
                            <th>Aksi</th>
                        </tr>
                    </thead>
                    <?php
                     $no = 1;
                     foreach($kontak as $key => $ktk) : 
                    ?>
                    <tbody>
                        <tr>
                            <td><?= $no++ ?></td>
                            <td><?= $ktk->title ?></td>
                            <td><?= $ktk->instagram ?></td>
                            <td><?= $ktk->facebook ?></td>
                            <td><?= $ktk->email ?></td>
                            <td></td>
                        </tr>
                    </tbody>
                    <?php endforeach; ?>
                </table>
            </div>
        </div>
    </div>
</div>