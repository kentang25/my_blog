<div class="container my-4">
    <div class="card">
        <div class="card-header bg-primary text-white">
            <strong>Detail Books</strong>
        </div>
        <div class="card-body table-responsive">
            <table class="table table-bordered table-striped align-middle">
                <thead class="table-dark text-center">
                    <tr>
                        <th>No</th>
                        <th>Title</th>
                        <th>Judul</th>
                        <th>Pengarang</th>
                        <th>Penerbit</th>
                        <th>Tahun</th>
                        <th>Gambar</th>
                        <th>Ulasan</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $no = 1;
                    ?>
                    <tr>
                        <td class="text-center"><?= $no++ ?></td>
                        <td><?= $detail_books->title ?></td>
                        <td><?= $detail_books->judul ?></td>
                        <td><?= $detail_books->pengarang ?></td>
                        <td><?= $detail_books->penerbit ?></td>
                        <td><?= $detail_books->tahun ?></td>
                        <td><img src="<?= base_url('assets/uploads/'. $detail_books->gambar) ?>" class="img-fluid rounded" style="max-width: 120px; height: auto;"></td>
                        <td><?= $detail_books->ulasan ?></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <a href="<?= base_url('admin/books') ?>"><button class="btn btn-info mt-3">Kembali</button></a>
</div>