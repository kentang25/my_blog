<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <!-- Brand / Logo -->
        <a class="navbar-brand" href="#">Regi Yanuar</a>

        <!-- Toggler Button (untuk layar kecil) -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Menu -->
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav gap-3">
                <li class="nav-item">
                    <a class="nav-link fw-semibold text-dark px-3 py-2 rounded-pill" href="<?= base_url('futuretrend') ?>">About</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-semibold text-dark px-3 py-2 rounded-pill" href="<?= base_url('products')?>">Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-semibold text-dark px-3 py-2 rounded-pill" href="<?= base_url('cart')?>">Books</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link fw-semibold text-dark px-3 py-2 rounded-pill" href="<?= base_url('kontak') ?>">  </a>
                </li>

                <!-- Tombol Logout -->
                <li class="nav-item">
                    <a class="nav-link fw-semibold text-white bg-danger px-3 py-2 rounded-pill" href="<?= base_url('logout') ?>">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
