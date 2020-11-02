<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Login Page</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="css/login.css" rel="stylesheet">
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

  <!-- Custom styles for this template-->

</head>
<script>
function validate()
{
var username=$("#username");
var password=$("#password");
username.removeClass("is-invalid");
password.removeClass("is-invalid");
var focus=null;
if(username.val().trim().length==0)
{
username.addClass("is-invalid");
if(focus==null)
{
username.focus();
focus=username;
}
}
if(password.val().trim().length==0)
{
password.addClass("is-invalid");
if(focus==null)
{
password.focus();
focus=password;
}
}
if(focus==null) return true;
return false;
}
function usernameInput()
{
if($("#username").val().trim().length==0) $("#username").addClass("is-invalid");
else $("#username").removeClass("is-invalid");
}
function passwordInput()
{
if($("#password").val().length==0) $("#password").addClass("is-invalid");
else $("#password").removeClass("is-invalid");
}
function forgotPassword()
{
alert("For getting the reset password please contact +919584937187 or +918770491889");
}
</script>
<body class="bg-gradient-primary">

  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-12">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                  </div>
                   <center><h5 style="color:red;">${errorBean.genericError}</h5></center>
                  <form class="user" action="login" onsubmit="return validate()" method='POST'>
                    <div class="form-group">
                      <input id='username' name='username' type="text" class="form-control form-control-user" aria-describedby="emailHelp" placeholder="Enter Username..." oninput="usernameInput()" novalidate>
                    </div>
                    <div class="form-group">
                      <input type="password" name="password" class="form-control form-control-user" id="password" placeholder="Password" oninput="passwordInput()" novalidate>
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                      </div>
                    </div>
                    <button type='submit' class="btn btn-primary btn-user btn-block">login</button>
                  </form>
                  <hr>
                  <div class="text-center">
                    <a class="small" href="#" onclick="forgotPassword();">Forgot Password?</a>
                  </div>
                  <div class="text-center">
                    <a class="small" href="register">Sign up</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin-2.min.js"></script>

</body>

</html>
