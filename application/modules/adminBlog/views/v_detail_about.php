<div class="container my-4">
    <div class="table-responsive">
        <table class="table table-bordered table-striped align-middle">
            <thead class="table-dark text-center">
                <tr>
                    <th>No</th>
                    <th>Title</th>
                    <th>Gambar User</th>
                    <th>About User</th>
                    <th>Title 2</th>
                    <th>Gambar Kegiatan</th>
                    <th>About Kegiatan</th>
                    <th>Gambar Kegiatan 2</th>
                    <th>About Kegiatan 2</th>
                </tr>
            </thead>
            <tbody>
                <?php $no = 1; ?>
                <tr>
                    <td class="text-center"><?= $no++ ?></td>
                    <td><?= $detail_about->title ?></td>
                    <td>
                        <img src="<?= base_url('assets/uploads/' . $detail_about->gambar_user) ?>" 
                             class="img-fluid rounded" 
                             style="max-width: 120px; height: auto;">
                    </td>
                    <td><?= $detail_about->about_user ?></td>
                    <td><?= $detail_about->title ?></td>
                    <td>
                        <img src="<?= base_url('assets/uploads/' . $detail_about->gambar_kegiatan) ?>" 
                             class="img-fluid rounded" 
                             style="max-width: 120px; height: auto;">
                    </td>
                    <td><?= $detail_about->about_kegiatan ?></td>
                    <td>
                        <img src="<?= base_url('assets/uploads/' . $detail_about->gambar_kegiatan_2) ?>" 
                             class="img-fluid rounded" 
                             style="max-width: 120px; height: auto;">
                    </td>
                    <td><?= $detail_about->about_kegiatan_2 ?></td>
                </tr>
            </tbody>
        </table>
    </div>
    <a href="<?= base_url('admin/about-blog') ?>"><button class="btn btn-info mt-3">Kembali</button></a>
</div>
