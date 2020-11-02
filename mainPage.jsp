<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Index page</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin-2.min.css" rel="stylesheet">
<script>
function onLoad()
{
$("#mysqlToExcel").hide();
$("#htmlToPdf").hide();
$("#videoSubtitling").hide();
$("#videoWatermarking").hide();
$("#videoTranscoding").hide();
}
window.onload=onLoad;
function videoTranscodingClicked()
{
alert("videoTranscodingClicked function chala");
$("#mysqlToExcel").hide();
$("#htmlToPdf").hide();
$("#videoSubtitling").hide();
$("#videoWatermarking").hide();
$("#videoTranscoding").show();
}
function videoSubtitlingClicked()
{
alert("videoSubtitlingClicked function chala");
$("#mysqlToExcel").hide();
$("#htmlToPdf").hide();
$("#videoWatermarking").hide();
$("#videoTranscoding").hide();
$("#videoSubtitling").show();
}
function videoWatermarkingClicked()
{
alert("videoWatermarkingClicked function chala");
$("#mysqlToExcel").hide();
$("#htmlToPdf").hide();
$("#videoTranscoding").hide();
$("#videoSubtitling").hide();
$("#videoWatermarking").show();
}
function mysqlToExcelClicked()
{
alert("mysqlToExcelClicked function chala");
$("#htmlToPdf").hide();
$("#videoTranscoding").hide();
$("#videoSubtitling").hide();
$("#videoWatermarking").hide();
$("#mysqlToExcel").show();
}
function htmlToPdfClicked()
{
alert("htmlToPdfClicked function chala");
$("#videoTranscoding").hide();
$("#videoSubtitling").hide();
$("#videoWatermarking").hide();
$("#mysqlToExcel").hide();
$("#htmlToPdf").show();
}
function videoTranscodingButtonClicked()
{
alert("videoTranscodingButtonClicked");
}

function htmlToPdfButtonClicked()
{
var htmlToPdfurl=$("#htmlToPdfurl");
var htmlToPdfurlError=document.getElementById("htmlToPdfurlError");
htmlToPdfurlError.innerHTML="";
if(htmlToPdfurl.val()=="")
{
htmlToPdfurlError.innerHTML="URL cannot be empty";
return;
}
var val=htmlToPdfurl.val();
//sending the ajax request to a service
document.getElementById("urlDownloadButtonLoader").style.display='block';
$.ajax({
url:'htmltopdf',
method:'POST',
xhrFields:{
responseType:'blob'
},
data:{ data:val},
success:function(data)
{
document.getElementById("urlDownloadButtonLoader").style.display='none';
alert(data);
var a=document.createElement('a');
var url=window.URL.createObjectURL(data);
a.href=url;
a.download='htmlToPdf.pdf';
document.getElementById("urlDownloadButton").appendChild(a);
a.click();
a.remove();
window.URL.revokeObjectURL(url);
},
error:function(jqXhr,textStatus,errorMessage){
alert(errorMessage);
}
});
}//function htmlToPdfButtonClicked ends

function mysqlToExcelButtonClicked()
{
alert("mysqlToExcelButtonClicked");
mysqlToExcelFileError.innerHTML="";
var fileName=document.getElementById("mysqlToExcelFile").value;
if(fileName=="")
{
mysqlToExcelFileError.innerHTML="Please Select SQL File!";
return;
}
var extension=fileName.substring(fileName.lastIndexOf('.') + 1); 
alert("("+extension+")");
if(extension!="sql")
{
mysqlToExcelFileError.innerHTML="Please Select SQL File only!";
return;
}
var formData=new FormData();
var files=$('#mysqlToExcelFile')[0].files[0];
formData.append('file',files);
formData.append('comment', "foo");
formData.append('minorEdit', "true");
document.getElementById("mysqlDownloadButtonLoader").style.display='block';
$.ajax({
url:'mysqltoexcel',
method:'POST',
xhrFields:{
responseType:'blob'
},
data:formData,//sending file
processData: false,
contentType: false,
success:function(data)
{
document.getElementById("mysqlDownloadButtonLoader").style.display='none';
alert(data);
var a=document.createElement('a');
var url=window.URL.createObjectURL(data);
a.href=url;
a.download='mysqlToExcel.zip';
document.getElementById("mysqlDownloadButton").appendChild(a);
a.click();
a.remove();
window.URL.revokeObjectURL(url);
},
error:function(jqXhr,textStatus,errorMessage){
alert(errorMessage);
}
});



}//function mysqlToExcelButtonClicked ends

function ClearErrorFeild(value,errorValue)
{
//alert(value+"  "+errorValue);
var element=$("#"+value);
if(element.val()!="")
{
document.getElementById(errorValue).innerHTML="";
}
}
</script>
</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-laugh-wink"></i>
        </div>
        <div class="sidebar-brand-text mx-3">My Site</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="index">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Our Services
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseVideo" aria-expanded="true" aria-controls="collapseVideo">
          <i class="fas fa-fw fa-cog"></i>
          <span>Video Editing</span>
        </a>
        <div id="collapseVideo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">Video Editing Options:</h6>
            <a class="collapse-item" href="#" onclick="videoTranscodingClicked();">Transcoding</a>
            <a class="collapse-item" href="#" onclick="videoSubtitlingClicked();">Subtitling</a>
            <a class="collapse-item" href="#" onclick="videoWatermarkingClicked();">Watermarking</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - HTML to PDF Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsehtmltopdf" aria-expanded="true" aria-controls="collapsehtmltopdf">
          <i class="fas fa-fw fa-wrench"></i>
          <span>HTML to PDF</span>
        </a>
        <div id="collapsehtmltopdf" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">HTML to PDF:</h6>
            <a class="collapse-item" href="#" onclick="htmlToPdfClicked();">HTML to PDF</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - mysql Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsemysql" aria-expanded="true" aria-controls="collapsemysql">
          <i class="fas fa-fw fa-folder"></i>
          <span>MySQL</span>
        </a>
        <div id="collapsemysql" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">MySQL:</h6>
            <a class="collapse-item" href="#" onclick="mysqlToExcelClicked();">MySQL to Excel</a>
          </div>
        </div>
      </li>
      
      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
             <!-- <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a> -->
              <!-- Dropdown - Messages --> 
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>



            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${user.name}</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="profile">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
            <!-- VideoTranscoding -->
            <div id="videoTranscoding" class="col-xl-12 col-md-12 mb-4">
              <div class="card shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <center><div class="text-m font-weight-bold text-primary text-uppercase mb-1"><u>Video Editing (Video Transcoding)</u></div></center>
                      <br/>
                      <div class="h6 mb-0 font-weight-bold text-gray-800">Select a Video File :&nbsp;&nbsp;<input type='file' name='videoFile'>&nbsp;&nbsp;<span class="h6 mb-0" style="color:red;">Select video file only!</span>
                      <br/><br/>
                      Select the Quality :&nbsp;&nbsp; 
                       <select>
                       <option value=1080>1080p</option>
                       <option value=720>720p</option>
                       <option value=480>480p</option>
                       <option value=240>240p</option>
                       <option value=144>144p</option>
                       </select>
                       <br/><br/>
                      <button onclick="videoTranscodingButtonClicked();">Transcode</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- VideoSubtitling -->
            <div id="videoSubtitling" class="col-xl-12 col-md-12 mb-4">
              <div class="card shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <center><div class="text-m font-weight-bold text-primary text-uppercase mb-1"><u>Video Editing (Video Subtitling)</u></div></center>
                      <br/>
                      <div class="h6 mb-0 font-weight-bold text-gray-800">Select a Video File :&nbsp;&nbsp;<input type='file' name='videoFile'>&nbsp;&nbsp;<span class="h6 mb-0" style="color:red;">Select video file only!</span>
                      <br/><br/>
                      <button onclick="videoSubtitlingWithSubtitleButtonClicked();">Generate Subtitle</button>&emsp;
                      <button onclick="videoSubtitlingWithSubtitleEmbeddedButtonClicked();">Embedd subtitle with video</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- VideoWatermarking -->
            <div id="videoWatermarking" class="col-xl-12 col-md-12 mb-4">
              <div class="card shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <center><div class="text-m font-weight-bold text-primary text-uppercase mb-1"><u>Video Editing (Video Watermarking)</u></div></center>
                      <br/>
                      <div class="h6 mb-0 font-weight-bold text-gray-800">Select a Video File :&nbsp;&nbsp;<input type='file' name='videoFile'>&nbsp;&nbsp;<span class="h6 mb-0" style="color:red;">Select video file only!</span>
                      <br/><br/>
                      </div>
                      <div class="h6 mb-0 font-weight-bold text-gray-800">Select a Image File :&nbsp;&nbsp;<input type='file' name='imageFile'>&nbsp;&nbsp;<span class="h6 mb-0" style="color:red;">Select Image file only!</span>
                      <br/><br/>
                      </div>
                      <div class="h6 mb-0 font-weight-bold text-gray-800">Opacity(in %) :&nbsp;&nbsp;<input type='number' min='0' max='100'>&nbsp;&nbsp;<span class="h6 mb-0" style="color:red;">Must be between 0-100</span>
                      <br/><br/>                      
                      Select the Quality :&nbsp;&nbsp; 
                       <select>
                       <option value="Center" selected>Center</option>
                       <option value="Left Center">Left Center</option>
                       <option value="Right Center">Right Center</option>
                       <option value="Top Center">Top Center</option>
                       <option value="Bottom Center">Bottom Center</option>
                       <option value="Top Left">Top Left</option>
                       <option value="Top Right">Top Right</option>
                       <option value="Bottom Left">Bottom Left</option>
                       <option value="Bottom Right">Bottom Right</option>
                       </select>
                       <br/><br/>
                      <button onclick="videoWatermarkingButtonClicked();">Watermark the Video</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- HTMLToPdf -->
            <div id="htmlToPdf" class="col-xl-12 col-md-12 mb-4">
              <div class="card shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <center><div class="text-m font-weight-bold text-primary text-uppercase mb-1"><u>HTML to PDF</u></div></center>
                      <br/>
                      <div class="h6 mb-0 font-weight-bold text-gray-800">URL for Generating a PDF:&nbsp;&nbsp;<input type='text' name='htmlToPdfurl' id='htmlToPdfurl' oninput="ClearErrorFeild('htmlToPdfurl','htmlToPdfurlError')">&nbsp;&nbsp;<span class="h6 mb-0" style="color:red;" id='htmlToPdfurlError' ></span>
                      <br/><br/>
                      <center><div id="urlDownloadButton"><div id="urlDownloadButtonLoader" style="display:none;" class="spinner-border"></div></div></center><br/>
                      <center><button onclick="htmlToPdfButtonClicked();">Generate PDF</button></center>                      
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- MySQLToPdf -->
            <div id="mysqlToExcel" class="col-xl-12 col-md-12 mb-4">
              <div class="card shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <center><div class="text-m font-weight-bold text-primary text-uppercase mb-1"><u>MySQL to Excel</u></div></center>
                      <br/>
                      <div class="h6 mb-0 font-weight-bold text-gray-800">Select a SQL File (.sql)  [Database name should be same as file Name] :&nbsp;&nbsp;<input type='file' name='mysqlToExcelFile' id="mysqlToExcelFile" >&nbsp;&nbsp;<span class="h6 mb-0" style="color:red;" id='mysqlToExcelFileError'></span>
                      <br/><br/>
                      <center><div id="mysqlDownloadButton"><div id="mysqlDownloadButtonLoader" style="display:none;" class="spinner-border"></div></div></center><br/>
                      <center><button onclick="mysqlToExcelButtonClicked();">Generate Excel</button></center>             
                      </div>                               
                    </div>
                  </div>
                </div>
              </div>
            </div>

      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; My Site</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

    </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">x</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="logout">Logout</a>
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

  <!-- Page level plugins -->
  <script src="vendor/chart.js/Chart.min.js"></script>
  <script src="js/demo/chart-area-demo.js"></script>
  <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>
