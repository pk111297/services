<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Signup</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>
<script>
function validate()
{
var username=$("#username");
var password=$("#password");
var name=$("#name");
var rePassword=$("#rePassword");
var dateOfBirth=$("#dateOfBirth");
name.removeClass("is-invalid");
password.removeClass("is-invalid");
username.removeClass("is-invalid");
rePassword.removeClass("is-invalid");
var focus=null;
if(name.val().trim().length==0)
{
name.addClass("is-invalid");
if(focus==null)
{
name.focus();
focus=name;
}
}
if(username.val().trim().length==0)
{
username.addClass("is-invalid");
if(focus==null)
{
username.focus();
focus=username;
}
}
if(dateOfBirth.val().trim().length==0)
{
dateOfBirth.addClass("is-invalid");
if(focus==null)
{
dateOfBirth.focus();
focus=dateOfBirth;
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
if(rePassword.val().trim().length==0)
{
rePassword.addClass("is-invalid");
if(focus==null)
{
rePassword.focus();
focus=rePassword;
}
}
if(focus!=null) return false;
if(password.val().trim()!=rePassword.val().trim())
{
rePassword.addClass("is-invalid");
rePassword.focus();
focus=rePassword;
document.getElementById("errorTag").innerHTML = "Password doesnot match!";
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
function nameInput()
{
if($("#name").val().trim().length==0) $("#name").addClass("is-invalid");
else $("#name").removeClass("is-invalid");
}
function rePasswordInput()
{
if($("#rePassword").val().length==0) $("#rePassword").addClass("is-invalid");
else $("#rePassword").removeClass("is-invalid");
}
function dateOfBirthInput()
{
if($("#dateOfBirth").val().length==0) $("#dateOfBirth").addClass("is-invalid");
else $("#dateOfBirth").removeClass("is-invalid");
}
function forgotPassword()
{
alert("For getting the reset password please contact +919584937187 or +918770491889");
}
</script>

<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-12">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an account</h1>
              </div>
                   <center><h5 id="errorTag" style="color:red;">${errorBean.genericError}</h5></center>
              <form class="user" action="signup" onsubmit="return validate()" method='POST'>
                <div class="form-group row">
                  <div class="col-sm-12 mb-3 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="Name.." oninput="nameInput()">
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="username" name="username" placeholder="Username.." oninput="usernameInput()">
                </div>
                <div class="form-group">
                  <input type="date" class="form-control form-control-user" id="dateOfBirth" name="dateOfBirth" placeholder="Date Of Birth.." oninput="dateOfBirthInput()" novalidate>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="Password.." oninput="passwordInput()">
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="rePassword" name="rePassword" placeholder="Repeat Password.." oninput="rePasswordInput()">
                  </div>
                </div>
                <button type="submit"  class="btn btn-primary btn-user btn-block">Signup</button>
              </form>
              <hr>
              <div class="text-center">
                <a class="small" href="#" onclick="forgotPassword();">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="start">Already have an account? Login!</a>
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
