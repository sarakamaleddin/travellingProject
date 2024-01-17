<?php require "../includes/header.php"; ?>
<?php require "../conf/config.php"; ?>
<?php
// do not allow the user to access login page after login
if(isset($_SESSION['username'])){
  header("location: ".APPURL."");
}

if(isset($_POST['submit'])){
  if(empty($_POST['email']) OR empty($_POST['password'])){
    echo "<script>alert('some inputs are empty')</script>";
  }else{
    $email = $_POST['email'];
    $password = $_POST['password'];

    $login = $conn->query("SELECT * FROM users WHERE email = '$email'");
    $login->execute();

    $fetch = $login->fetch(PDO::FETCH_ASSOC);
    if($login->rowCount() > 0){
      if(password_verify($password, $fetch['mypassword'])){
        echo "<script>alert('password is fine')</script>";
        $_SESSION['username'] = $fetch['username'];
        $_SESSION['user_id'] = $fetch['id'];

        header("location:".APPURL."");
      }else{
        echo "<script>alert('email or password is wrong')</script>";
      }
    }else{
      echo "<script>alert('email or password is wrong')</script>";
    }
  }
}
?>

<div class="reservation-form">
  <div class="container">
    <div class="row">

      <div class="col-lg-12">
        <form id="reservation-form" name="gs" method="POST" role="search" action="login.php">
          <div class="row">
            <div class="col-lg-12">
              <h4>Login</h4>
            </div>
            <div class="col-md-12">
              <fieldset>
                <label for="Name" class="form-label">Your Email</label>
                <input type="text" name="email" class="Name" placeholder="email" autocomplete="on" required>
              </fieldset>
            </div>
            <div class="col-md-12">
              <fieldset>
                <label for="Name" class="form-label">Your Password</label>
                <input type="password" name="password" class="Name" placeholder="password" autocomplete="on" required>
              </fieldset>
            </div>
            <div class="col-lg-12">
              <fieldset>
                <button  type="submit" name="submit" class="main-button">login</button>
              </fieldset>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>

<?php
require "../includes/footer.php";
?>