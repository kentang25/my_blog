<div class="container">

	


	<?= form_open_multipart('adminBlog/dashboard_blog/insert') ?> 

		<label>About Blog</label>
		<textarea class="ckeditor" name="about_blog" id="about_blog"></textarea>

		<label>Gambar User</label>
		<input type="file" name="gambar" class="form-control">

		<button type="submit">Simpan</button>

	<?= form_close();  ?>

	<!-- <script>
	    // Inisialisasi editor setelah textarea dimuat
	    CKEDITOR.replace('about_blog');
	</script> -->
</div>