<div class="container my-4">
    <?= form_open_multipart('adminBlog/cerita/insert') ?>
    
    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <strong>Tambah Cerita</strong>
        </div>
        <div class="card-body">

            <div class="mb-3">
                <label class="form-label">Title</label>
                <input type="text" name="title" class="form-control" placeholder="Masukkan judul" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Gambar</label>
                <input type="file" name="gambar" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">Cerita</label>
                <textarea name="cerita" id="cerita" class="form-control ckeditor" rows="5"></textarea>
            </div>

            <button type="submit" class="btn btn-success">
                <i class="fa fa-save"></i> Simpan
            </button>
        </div>
    </div>

    <?= form_close(); ?>

    <div class="card">
        <div class="card-header bg-dark text-white">
            <strong>Daftar Cerita</strong>
        </div>
        <div class="card-body table-responsive">
            <table class="table table-bordered table-hover table-striped">
                <thead class="table-dark text-center">
                    <tr>
                        <th style="width: 5%;">No</th>
                        <th style="width: 20%;">Title</th>
                        <th>Cerita</th>
                        <th style="width: 20%;">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1; foreach($cerita as $crt): ?>
                        <tr>
                            <td class="text-center"><?= $no++ ?></td>
                            <td><?= $crt->title ?></td>
                            <td><?= character_limiter(strip_tags($crt->cerita), 80) ?></td>
                            <td class="text-center">
                                <a href="<?= base_url('admin/blog/cerita/edit/'. $crt->id_cerita) ?>" class="btn btn-sm btn-primary mb-1">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <a href="<?= base_url('admin/blog/cerita/detail/'. $crt->id_cerita) ?>" class="btn btn-sm btn-info mb-1">
                                    <i class="fa fa-search"></i>
                                </a>
                                <a href="<?= base_url('admin/blog/cerita/delete/'. $crt->id_cerita) ?>" class="btn btn-sm btn-danger mb-1" onclick="return confirm('Yakin ingin menghapus data ini?')">
                                    <i class="fa fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
