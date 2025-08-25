<div class="container my-5">
    <?= form_open_multipart('adminBlog/dashboard_blog/insert') ?> 
    <div class="card shadow-lg border-0 rounded-4 mb-4">
        <div class="card-header bg-primary text-white">
            <strong>Input Dashboard Blog</strong>
        </div>
        <div class="card-body">
            <!-- About Blog -->
            <div class="mb-3">
                <label for="about_blog" class="form-label fw-bold">About Blog</label>
                <textarea class="ckeditor form-control" name="about_blog" id="about_blog" rows="5"></textarea>
            </div>
            
            <!-- Upload Gambar -->
            <div class="mb-3">
                <label for="gambar" class="form-label fw-bold">Gambar User</label>
                <input type="file" name="gambar" id="gambar" class="form-control">
            </div>

            <!-- Tombol Submit -->
            <button type="submit" class="btn btn-success">
                <i class="fa fa-save me-1"></i> Simpan
            </button>
        </div>
    </div>
    <?= form_close(); ?>

    <!-- Tabel Dashboard Blog -->
    <div class="card shadow-lg border-0 rounded-4">
        <div class="card-header bg-dark text-white">
            <strong>Dashboard Blog</strong>
        </div>
        <div class="card-body table-responsive">
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-dark text-center">
                    <tr>
                        <th width="5%">No</th>
                        <th width="55%">About</th>
                        <th width="40%">Gambar</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <?php 
                        $no = 1;
                        foreach($dashboard as $key => $dhs) : 
                    ?>
                        <tr>
                            <td><?= $no++ ?></td>
                            <td class="text-start"><?= character_limiter(strip_tags($dhs->about_blog), 80) ?></td>
                            <td>
                                <img src="<?= base_url().'assets/uploads/'.$dhs->gambar ?>" 
                                     class="img-thumbnail rounded shadow-sm" 
                                     style="max-height:120px; object-fit:cover;">
                            </td>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
