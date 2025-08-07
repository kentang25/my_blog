<div class="container my-4">
    <div class="table-responsive">
        <table class="table table-bordered table-striped align-middle">
            <thead class="table-dark text-center">
                <tr>
                    <th>No</th>
                    <th>Title</th>
                    <th>Gambar</th>
                    <th>Cerita</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    $no = 1;
                ?>
                <tr>
                    <td class="text-center"><?= $no++ ?></td>
                    <td style="width: 150px;"><?= $detail_cerita->title ?></td>
                    <td><img src="<?= base_url('assets/uploads/'. $detail_cerita->gambar) ?>" 
                    class="img-fluid rounded" style="max-width: 120px; height: auto;"></td>
                    <td><?= $detail_cerita->cerita ?></td>
                </tr>
            </tbody>
        </table>
    </div>
    <a href="<?= base_url('admin/blog/cerita') ?>"><button class="btn btn-info mt-3">Kembali</button></a>
</div>