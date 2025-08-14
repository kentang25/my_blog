<div class="container my-4">
    <?= form_open_multipart('adminBlog/books/insert') ?>
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <strong>Tambah Buku</strong>
            </div>
            <div class="card-body">
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" class="form-control" name="title">
                </div>
                <div class="mb-3">
                    <label class="form-label">Judul</label>
                    <input type="text" class="form-control" name="judul">
                </div>
                <div class="mb-3">
                    <label class="form-label">Pengarang</label>
                    <input type="text" class="form-control" name="pengarang">
                </div>
                <div class="mb-3">
                    <label class="form-label">Penerbit</label>
                    <input type="text" class="form-control" name="penerbit">
                </div>
                <div class="mb-3">
                    <label class="form-label">Tahun</label>
                    <input type="text" class="form-control" name="tahun">
                </div>
                <div class="mb-3">
                    <label class="form-label">Gambar</label>
                    <input type="file" class="form-control" name="gambar">
                </div>
                <div class="mb-3">
                    <label class="form-label">Ulasan</label>
                    <textarea class="ckeditor" name="ulasan"></textarea>
                </div>

                <button type="submit" class="btn btn-success">
                    <i class="fa fa-save"></i> Simpan
                </button>
            </div>
        </div>
    <?= form_close(); ?>

    <div class="card">
        <div class="card-header bg-dark text-white">
            <strong>Daftar Buku</strong>
        </div>
        <div class="card-body table-responsive">
            <table class="table table-bordered table-striped table-hover align-middle">
                <thead class="table-dark text-center">
                    <tr>
                        <th>No</th>
                        <th>Title</th>
                        <th>Judul</th>
                        <th>Pengarang</th>
                        <th>Penerbit</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $no = 1;
                        foreach($books as $key => $bks) :
                    ?>
                    <tr>
                        <td><?= $no++ ?></td>
                        <td><?= $bks->title ?></td>
                        <td><?= $bks->judul ?></td>
                        <td><?= $bks->pengarang ?></td>
                        <td><?= $bks->penerbit ?></td>
                        <td class="text-center">
                                <a href="<?= base_url('admin/books/edit/' . $bks->id_book) ?>" class="btn btn-sm btn-primary mb-1" title="Edit">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <a href="<?= base_url('admin/books/detail/' . $bks->id_book) ?>" class="btn btn-sm btn-info mb-1" title="Detail">
                                    <i class="fa fa-search"></i>
                                </a>
                                <a href="<?= base_url('admin/books/delete/' . $bks->id_book) ?>" class="btn btn-sm btn-danger mb-1" title="Hapus" onclick="return confirm('Yakin ingin menghapus data ini?')">
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