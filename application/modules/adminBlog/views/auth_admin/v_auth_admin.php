<div class="main">
    <input type="checkbox" id="chk" aria-hidden="true">

    <div class="signup">
        <form method="POST" action="<?= base_url('admin/register') ?>">
            <label for="chk" aria-hidden="true">Sign up</label>
            <input type="text" name="username" placeholder="User name" required="">
            <input type="password" name="password" placeholder="Password" required="">
            <button>Sign up</button>
        </form>
    </div>

    <div class="login">
        <form method="POST" action="<?= base_url('admin/login') ?>">
            <label for="chk" aria-hidden="true">Login</label>
            <input type="text" name="username" placeholder="User name" required="">
            <input type="password" name="password" placeholder="Password" required="">
            <button>Login</button>
        </form>
    </div>
</div>