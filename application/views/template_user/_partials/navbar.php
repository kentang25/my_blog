<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <!-- Brand / Logo -->
        <a class="navbar-brand" href="<?= base_url('my_blog') ?>">Regi Yanuar</a>

        <!-- Toggler Button (untuk layar kecil) -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Menu -->
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav gap-3">
                <li class="nav-item">
                    <a class="nav-link fw-semibold text-dark px-3 py-2 rounded-pill" href="<?= base_url('about') ?>">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-semibold text-dark px-3 py-2 rounded-pill" href="<?= base_url('blog')?>">Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-semibold text-dark px-3 py-2 rounded-pill" href="<?= base_url('books')?>">Books</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-semibold text-dark px-3 py-2 rounded-pill" href="<?= base_url('kontak') ?>"> Kontak </a>
                </li>

                <!-- Tombol Logout -->
            </ul>
        </div>
    </div>
</nav>
