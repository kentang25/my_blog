<div class="container">
    <?= form_open_multipart('adminBlog/about/insert') ?>

    <label>Title</label>
    <input type="text" name="title" class="form-control" placeholder="Title">

    <label>Gambar User</label>
    <input type="file" name="gambar_user" class="form-control" placeholder="Gambar User">

    <label>About User</label>
    <textarea class="ckeditor" name="about_user" id="about_blog"></textarea>

    <label>Title Kegiatan</label>
    <input type="text" name="title_2" class="form-control" placeholder="Title Kegiatan">

    <label>Gambar Kegiatan</label>
    <input type="file" name="gambar_kegiatan" class="form-control" placeholder="Gambar Kegiatan">

    <label>About Kegiatan</label>
    <textarea class="ckeditor" name="about_kegiatan" id="about_blog"></textarea>

    <label>Gambar Kegiatan 2</label>
    <input type="file" name="gambar_kegiatan_2" class="form-control" placeholder="Gambar Kegiatan">

    <label>About Kegiatan 2</label>
    <textarea class="ckeditor" name="about_kegiatan_2" id="about_blog"></textarea>

    <button type="submit" class="btn btn-primary mt-3">Simpan</button>

    <?= form_close() ?>

    <?php
    // function potong($teks, $limit = 100) {
    //                     return strlen($teks) > $limit ? substr($teks, 0, $limit) . '...' : $teks;
    //                 }
    ?>

    <div class="table-responsive">
    <table class="table table-bordered table-hover align-middle">
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
            <?php 
            $no = 1;
            foreach($about as $key => $abt) :
            ?>
            <tr>
                <td class="text-center"><?= $no++ ?></td>
                <td><?= $abt->title ?></td>
                <td><?= character_limiter(strip_tags($abt->about_user), 80) ?></td>
                <td><?= character_limiter(strip_tags($abt->about_kegiatan), 80) ?></td>
                <td><?= character_limiter(strip_tags($abt->about_kegiatan_2), 80) ?></td>
                <td class="text-center">
                    <a href="<?= base_url('admin/about-blog/edit/' . $abt->id_about) ?>" class="btn btn-sm btn-primary" title="Edit">
                        <i class="fa fa-edit"></i>
                    </a>
                    <a href="<?= base_url('admin/about-blog/detail/' . $abt->id_about) ?>" class="btn btn-sm btn-info" title="Detail">
                        <i class="fa fa-search"></i>
                    </a>
                    <a href="<?= base_url('admin/about-blog/delete/' . $abt->id_about) ?>" class="btn btn-sm btn-danger" title="Hapus" onclick="return confirm('Yakin ingin menghapus data ini?')">
                        <i class="fa fa-trash"></i>
                    </a>
                </td>
            </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>



</div>