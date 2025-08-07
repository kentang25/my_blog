<div class="container my-4">
    <?= form_open_multipart('adminBlog/jalan_jalan/insert'); ?>

    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <strong>Jalan Jalan</strong>
        </div>

        <div class="card-body">
            <div class="mb-3">
                <label>Title</label>
                <input type="text" name="title" class="form-control" placeholder="title">
            </div>

            <div class="mb-3">
                <label>Gambar</label>
                <input type="file" name="gambar" class="form-control">
            </div>

            <div class="mb-3">
                <textarea name="ceritanya" id="ceritanya" class="ckeditor"></textarea>
            </div>
            <button type="submit" class="btn btn-success">
            <i class="fa fa-save"></i> Simpan
        </button>
        </div>
        
    </div>
    

    <?= form_close() ?>

    <div class="card">
        <div class="card-header bd-dark text-white">
            <strong>Daftar Jalan Jalan</strong>
        </div>

        <div class="card-body table-responsive">
            <table class="table table-bordered table-bordered align-middle table-hover">
                <thead class="table-dark text-center">
                    <tr>
                        <th style="width: 5%">No</th>
                        <th style="width: 20%">Title</th>
                        <th>Jalan-Jalan</th>
                        <th style="width: 20%">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $no = 1;
                        foreach($jalan_jalan as $key => $jln) :
                    ?>
                    <tr>
                        <td class="text-center"><?= $no++ ?></td>
                        <td><?= $jln->title ?></td>
                        <td><?= character_limiter(strip_tags($jln->ceritanya),80) ?></td>
                        <td class="text-center">
                            <a href="<?= base_url('admin/blog/jalan-jalan/edit/' . $jln->id_jalan) ?>" class="btn btn-sm btn-primary mb-1" title="Edit">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <a href="<?= base_url('admin/blog/jalan-jalan/detail/' . $jln->id_jalan) ?>" class="btn btn-sm btn-info mb-1" title="Detail">
                                    <i class="fa fa-search"></i>
                                </a>
                                <a href="<?= base_url('admin/blog/jalan-jalan/delete/' . $jln->id_jalan) ?>" class="btn btn-sm btn-danger mb-1" title="Hapus" onclick="return confirm('Yakin ingin menghapus data ini?')">
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