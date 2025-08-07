<div class="container my-4">
    <div class="card">
        <div class="card-header bg-dark text-white">
            <strong>Daily Life</strong>
        </div>
        <div class="card-body table-responsive">
        <table class="table table-bordered table-striped align-middle">
            <thead class="table-dark text-center">
                <tr>
                    <th>No</th>
                    <th>Title</th>
                    <th>Gambar</th>
                    <th>Ceritanya</th>
                </tr>
            </thead>
            <tbody>
                <?php
                    $no = 1;
                ?>
                <tr>
                    <td class="text-center"><?= $no++ ?></td>
                    <td style="width: 150px;"><?= $detail_jalan->title ?></td>
                    <td><img src="<?= base_url('assets/uploads/'. $detail_jalan->gambar) ?>" 
                    class="img-fluid rounded" style="max-width: 120px; height: auto;"></td>
                    <td><?= $detail_jalan->ceritanya ?></td>
                </tr>
            </tbody>
        </table>
    </div>
    
    </div>
    <a href="<?= base_url('admin/blog/jalan-jalan') ?>"><button class="btn btn-info mt-3">Kembali</button></a>
</div>