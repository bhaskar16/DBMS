<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
    <title></title>

    <link href="css/bootstrap.css" rel="stylesheet">
   <link href="css/animate.css" rel="stylesheet">
   <link href="css/response.css" rel="stylesheet">

<link href="css/table.css" rel="stylesheet" type="text/css"/>
    <!-- IF using Sass (run gulp sass first), then uncomment below and remove the CSS includes above
    <link href="css/ionic.app.css" rel="stylesheet">
    -->


<script src="js/jquery-1.11.2.js"></script>
    <script src="js/bootstrap.js"></script>
 <script src="js/npm.js"></script>
 

</head>
<body background="bg.jpg" >
<div class="container">
<br>

</div>
<div class="container">
   <div class="jumbotron">
      <center><br><br><br><h2>DBMS Project</h2><br></center>
<center><center>
<p class="text-center"><strong>Student Attendance System</strong></p> <hr>
<br><br>
      <!--  <center> <a  href="index2.html" class="btn btn-default btn-lg btn-block" >Go</a></center> -->
   </div>
</div>

<hr>
<div class="container">
   
    <div class="row" >
      <div class="col-sm-6" >
        <div class="jumbotron">
		<center><h3><strong> Student's Login </strong></h3></center>
		<br>
		<br>
		<br>
<center><a  href="" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#login1" >Go</a></center>		</p>
		</div>
      </div>
      <div class="col-sm-6" >
        <div class="jumbotron">
		<center><h3><strong> Teacher's Login </strong></h3></center>
		<br>
		<br>
		<br>
<center><a  href="" class="btn btn-default btn-lg btn-block" data-toggle="modal" data-target="#login2" >Go</a></center>		</p>
		</div>
      </div>
	  </div>
   </div>

<div id="login1" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" >
  <div class="modal-dialog" >
  <div class="modal-content">
      <div id="head" class="modal-header">
		<strong>Student Login</strong>
  
      </div><form action="LoginCheck2.jsp" method="post">
      <div class="modal-body">
	   
	 <input class="form-control input-lg" type="text" name="enroll" placeholder="Enrollment No.">
  <br>
  <input class="form-control input-lg" type="password" name ="pass" placeholder="Password">	
	 
  </div>
  
   <div class="modal-footer">
    <input  type="submit" text="Submit" class="btn btn-info">
    
   </input>
   </form>
   </div>
  </div>
</div></div>
<div id="login2" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" >
  <div class="modal-dialog" >
  <div class="modal-content">
      <div id="head" class="modal-header">
		<strong>Teacher Login</strong>
  
      </div>
      <div class="modal-body">
	  <form action="LoginCheck.jsp" method="post">
	 <input class="form-control input-lg" type="text" placeholder="Teacher ID" name="tid">
  <br>
  <input class="form-control input-lg" type="password" placeholder="Password" name="pass">	
	 
  </div>
  
   <div class="modal-footer">
    <input type="submit" class="btn btn-info" value="Submit">
    
   </a>
   </form>
   </div>
  </div>
</div></div>
</body>
</html>