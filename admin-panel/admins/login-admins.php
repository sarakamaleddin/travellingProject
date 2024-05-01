<?php
require "../layouts/header.php";
require "../../conf/config.php";
?>
<?php
// do not allow the admin to access login page after login
if (isset($_SESSION['adminname'])) {
  header("location: " . ADMINURL . "");
}

if (isset($_POST['submit'])) {
  if (empty($_POST['email']) or empty($_POST['password'])) {
    echo "<script>alert('some inputs are empty')</script>";
  } else {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $login = $conn->query("SELECT * FROM admins WHERE email = '$email'");
    $login->execute();

    $fetch = $login->fetch(PDO::FETCH_ASSOC);
    if ($login->rowCount() > 0) {
      if (password_verify($password, $fetch['mypassword'])) {
        echo "<script>alert('password is fine')</script>";
        $_SESSION['adminname'] = $fetch['adminname'];
        $_SESSION['user_id'] = $fetch['id'];

        echo "<script>alert('LOGGED IN')</script>";
        header("location:" . ADMINURL . "");
      } else {
        echo "<script>alert('email or password is wrong')</script>";
      }
    } else {
      echo "<script>alert('email or password is wrong')</script>";
    }
  }
}
?>

<div class="row">
  <div class="col">
    <div class="card">
      <div class="card-body">
        <h5 class="card-title mt-5">Login</h5>
        <form method="POST" class="p-auto" action="login-admins.php">
          <div class="form-outline mb-4">
            <input type="email" name="email" id="form2Example1" class="form-control" placeholder="Email" />
          </div>
          <div class="form-outline mb-4">
            <input type="password" name="password" id="form2Example2" placeholder="Password" class="form-control" />
          </div>
          <button type="submit" name="submit" class="btn btn-primary  mb-4 text-center">Login</button>
        </form>
      </div>
    </div>
    <?php require "../layouts/footer.php"; ?>