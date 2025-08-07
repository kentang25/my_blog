<div class="container my-4">
    <?= form_open_multipart('adminBlog/daily_life/insert'); ?>

    <div class="card mb-4">
        <div class="card-header bg-primary text-white">
            <strong>Daily Life</strong>
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
                <textarea name="daily_life" id="daily_life" class="ckeditor"></textarea>
            </div>

            <button type="submit" class="btn btn-success"><i class="fa fa-save"></i>Simpan</button>
        </div>
    </div>

    <?= form_close() ?>

    <div class="card">
        <div class="card-header bg-dark text-white">
            <strong>Daftar Daily Life</strong>
        </div>
    </div>

    <div class="card-body table-responsive">
        <table class="table table-bordered table-hover table-striped">
            <thead class="bg-dark text-center">
                <tr>
                    <th style="width: 5%">No</th>
                    <th style="width: 20%">Title</th>
                    <th>Daily Life</th>
                    <th style="width: 20%">Aksi</th>
                </tr>
            </thead>
            <tbody>
                <?php $no = 1; foreach($daily_life as $key => $dlf) : ?>
                <tr>
                    <td class="text-center"><?= $no++ ?></td>
                    <td><?= $dlf->title ?></td>
                    <td><?= $dlf->daily_life ?></td>
                    <td class="text-center">
                        <a href="<?= base_url('admin/blog/daily-life/edit/'. $dlf->id_daily_life) ?>"
                            class="btn btn-sm btn-primary mb-1">
                            <i class="fa fa-edit"></i>
                        </a>
                        <a href="<?= base_url('admin/blog/daily-life/detail/'. $dlf->id_daily_life) ?>"
                            class="btn btn-sm btn-info mb-1">
                            <i class="fa fa-search"></i>
                        </a>
                        <a href="<?= base_url('admin/blog/daily-life/delete/'. $dlf->id_daily_life) ?>"
                            class="btn btn-sm btn-danger mb-1"
                            onclick="return confirm('Yakin ingin menghapus data ini?')">
                            <i class="fa fa-trash"></i>
                        </a>
                    </td>
                </tr>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>