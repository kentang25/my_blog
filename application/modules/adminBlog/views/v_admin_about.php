<div class="container my-4">
    <?= form_open_multipart('adminBlog/about/insert') ?>

    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <strong>Tambah Data About</strong>
        </div>
        <div class="card-body">
            <div class="mb-3">
                <label class="form-label">Title</label>
                <input type="text" name="title" class="form-control" placeholder="Masukkan Title" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Gambar User</label>
                <input type="file" name="gambar_user" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">About User</label>
                <textarea class="form-control ckeditor" name="about_user" id="about_user" rows="5"></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Title Kegiatan</label>
                <input type="text" name="title_2" class="form-control" placeholder="Masukkan Title Kegiatan">
            </div>

            <div class="mb-3">
                <label class="form-label">Gambar Kegiatan</label>
                <input type="file" name="gambar_kegiatan" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">About Kegiatan</label>
                <textarea class="form-control ckeditor" name="about_kegiatan" id="about_kegiatan" rows="5"></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Gambar Kegiatan 2</label>
                <input type="file" name="gambar_kegiatan_2" class="form-control">
            </div>

            <div class="mb-3">
                <label class="form-label">About Kegiatan 2</label>
                <textarea class="form-control ckeditor" name="about_kegiatan_2" id="about_kegiatan_2" rows="5"></textarea>
            </div>

            <button type="submit" class="btn btn-success">
                <i class="fa fa-save"></i> Simpan
            </button>
        </div>
    </div>

    <?= form_close(); ?>

    <div class="card">
        <div class="card-header bg-dark text-white">
            <strong>Daftar About</strong>
        </div>
        <div class="card-body table-responsive">
            <table class="table table-bordered table-hover align-middle table-striped">
                <thead class="table-dark text-center">
                    <tr>
                        <th style="width: 50px;">No.</th>
                        <th style="width: 150px;">Title</th>
                        <th>About User</th>
                        <th>About Kegiatan</th>
                        <th>About Kegiatan 2</th>
                        <th style="width: 140px;">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1; foreach($about as $abt): ?>
                        <tr>
                            <td class="text-center"><?= $no++ ?></td>
                            <td><?= $abt->title ?></td>
                            <td><?= character_limiter(strip_tags($abt->about_user), 80) ?></td>
                            <td><?= character_limiter(strip_tags($abt->about_kegiatan), 80) ?></td>
                            <td><?= character_limiter(strip_tags($abt->about_kegiatan_2), 80) ?></td>
                            <td class="text-center">
                                <a href="<?= base_url('admin/about-blog/edit/' . $abt->id_about) ?>" class="btn btn-sm btn-primary mb-1" title="Edit">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <a href="<?= base_url('admin/about-blog/detail/' . $abt->id_about) ?>" class="btn btn-sm btn-info mb-1" title="Detail">
                                    <i class="fa fa-search"></i>
                                </a>
                                <a href="<?= base_url('admin/about-blog/delete/' . $abt->id_about) ?>" class="btn btn-sm btn-danger mb-1" title="Hapus" onclick="return confirm('Yakin ingin menghapus data ini?')">
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
