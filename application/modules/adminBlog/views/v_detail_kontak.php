<div class="container my-4">
    <div class="card mb-3">
        <div class="card-header bg-dark text-white">
            <strong>Detail Kontak</strong>
        </div>
        <div class="card-body table-responsive">
            <table class="table table-bordered table-striped align-middle">
                <thead class="table-dark text-center">
                    <tr>
                        <th>No</th>
                        <th>Title</th>
                        <th>Gambar</th>
                        <th>Instagram</th>
                        <th>Facebook</th>
                        <th>Email</th>
                        <th>Kalimat</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $no = 1;
                    ?>

                    <tr>
                        <td><?= $no++ ?></td>
                        <td><?= $detail_kontak->title ?></td>
                        <td><img src="<?= base_url('assets/uploads/' . $detail_kontak->gambar) ?>" class="img-fluid rounded" style="max-width: 120px; height: auto;"></td>
                        <td><?= $detail_kontak->instagram ?></td>
                        <td><?= $detail_kontak->facebook ?></td>
                        <td><?= $detail_kontak->email ?></td>
                        <td><?= $detail_kontak->kalimat ?></td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>
    <a href="<?= base_url('admin/kontak') ?>"><button class="btn btn-info mt-3">Kembali</button></a>
</div>