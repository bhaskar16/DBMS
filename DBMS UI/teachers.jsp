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
<body  >
 <%@ page import = "java.sql.*" %>
   <%
            String a=session.getAttribute("user").toString();
           
            %>
  <%
    String enroll = "";
	if(request.getParameter("eid") != null) enroll = request.getParameter("eid");
   %>
  
  <%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:hr/hr@localhost:1521:xe");
    Statement stmt  = conn.createStatement();
	
	String dep = a.substring(0,2);
	
   // String sql="select * from subj where dept='CS'";
	String sql="select dweek,sem,sec,half,period1,period2,period3 from (select * from table(getRoutine('"+a+"')) where dept='"+dep+"' and sec='A' and sem=6) a ,(select * from dayweek) b where a.day=b.day"; 
    ResultSet rs = stmt.executeQuery(sql);
    try {
		if(rs!=null) {
  %>
<div class="jumbotron">

      <center><h2>Welcome to Teacher's section</h2></center>
	 <!-- <p align="center" id="enroll" >  </p> -->
	
<p align="center" id="enroll" ><% out.println("Your ID is : "+a); %>  </p>
</div>
<hr>
<br>
<div class="container">
<ul id="myTab" class="nav nav-tabs">
   <li class="">
      <a href="#schedule" data-toggle="tab">
        Weekly Schedule
      </a>
   </li>
	<li><a href="#attendance" data-toggle="tab">Student attendance records</a></li>
   <li><a href="#info" data-toggle="tab">Personal Information</a></li>
</ul>
<div id="myTabContent" class="tab-content">
   <div class="tab-pane fade in active" id="schedule">
   <div class="container">
   <table class="table table-hover table-bordered">
   <caption>Schedule</caption>
   <thead>
      <tr>
			<th>Day</th>
        
         <th>Semester</th>
		  <th>Section</th>
		  <th>Half</th>
		  <th>Period 1</th>
		  <th>Period 2</th>
		  <th>Period 3</th>
         
		 
      </tr>
   </thead>
   <tbody>
     <%		while(rs.next()) {  %>
 
				<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
				
				</tr>
  <%    	}  %>	
   
   </tbody>
</table>
<%	}
    } catch(SQLException e) {
        e.printStackTrace();
    } stmt.close();rs.close();stmt=null;rs=null;
  %>
   </div>
   </div>
   <div class="tab-pane fade" id="attendance">
      <br>
      <div class="row" >
	  <div class="col-sm-4" >
	   <div class="jumbotron">
	    <button type="button" class="btn btn-primary btn-lg btn-block">
    Update
   </button>
	   </div>
	  </div>
	  <div class="col-sm-8" >
	    <div class="container">
			<form method="post" action="http://localhost:8081/DBMS UI/teachers.jsp#attendance">
		<h3>Enrollment number:</h3><input type="text" name="eid" size=50> 
		<button type="submit" class="btn btn-warning">
    Go
   </button>

</form>

</div></div></div><hr>
<table class="table table-hover table-bordered">
 <%
	
   stmt  = conn.createStatement();
    String s="select enroll,present,total,(present/total)*100 as percent from attendum where enroll='"+enroll+"' and sj='CS61'";
	//String sql2="select day,sem,sec,half,period1,period2,period3 from table(getRoutine('CS1')) where dept='CS' and sec='A'"; 
 rs = stmt.executeQuery(s);
    try {
		if(rs!=null) {
  %>
   <caption>Attendance of student with enrollment: ______________</caption>
   <thead>
      <tr>
         <th>Enroll</th>
         <th>Days attended</th>
		 <th>Total no of days</th>
		 <th>Percent attendance</th>
      </tr>
   </thead>
   <tbody>
      <%		while(rs.next()) {  %>
 
				<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				
				</tr>
  <%    	}  %>	
  <%	}
    } catch(SQLException e) {
        e.printStackTrace();
    } stmt.close();rs.close();conn.close();stmt=null;rs=null;conn=null;
  %>
     <!-- <tr>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
		  <td>&nbsp;</td>
      </tr>
      <tr>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
		  <td>&nbsp;</td>
      </tr>
	  <tr>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
         <td>&nbsp;</td>
		  <td>&nbsp;</td>
      </tr> -->
   </tbody>
</table>
      
	  </div>
   
   <div class="tab-pane fade" id="info">
      <br>
      <div class="row" >
	  <div class="col-sm-4" >
	   <div class="jumbotron">
	    <button type="button" class="btn btn-primary btn-lg btn-block">
    Update
   </button>
	   </div>
	  </div>
	  <div class="col-sm-8" >
	  <h3>My Personal Info</h3>
	  <table class="table">
   
   <thead>
      <tr>
         <th>Name</th>
         <th>&nbsp;</th>
      </tr>
  
   
      <tr>
         <th>Id</th>
         <th>&nbsp;</th>
         
      </tr>
      <tr>
         <th>Contact</th>
         <th>&nbsp;</th>
         
      </tr>
	  <tr>
         <th>Email</th>
         <th>&nbsp;</th>
         
      </tr>
      
   </thead>
</table>
	  </div>
	  </div>
	  
   </div>
</div>

</div>
<script>
   $(function(){
      $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      // Get the name of active tab
      var activeTab = $(e.target).text(); 
      // Get the name of previous tab
      var previousTab = $(e.relatedTarget).text(); 
      $(".active-tab span").html(activeTab);
      $(".previous-tab span").html(previousTab);
   });
});
</script>
</div>




</body>
</html>