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
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:hr/hr@localhost:1521:xe");
    Statement stmt  = conn.createStatement();
	
	
	String dep ="";
	String q="select sec,sem,dept from students where enroll='"+a+"'";
	ResultSet rs = stmt.executeQuery(q);
	String sem="",sec="";
	try {
		if(rs!=null) {
		while(rs.next()) {
	sec=rs.getString(1);
	sem=rs.getString(2);
	dep=rs.getString(3);
	}
	}
	}
	catch(SQLException e) {
        e.printStackTrace();
    }
	String sql="select dweek,half,period1,period2,period3 from (select * from table(dispRoutine('"+dep+"','"+sec+"',"+sem+"))) a,(select * from dayweek) b where a.day=b.day ";
    rs = stmt.executeQuery(sql);
    try {
		if(rs!=null) {
  %>
<div class="jumbotron">
      <center><h2>Welcome to the Student's section</h2></center>
	  <p align="center" id="enroll"> Your enrolment number is : <% out.println(" "+a); %>  </p> 

</div>
<hr>
<br>
<div class="container">
<ul id="myTab" class="nav nav-tabs">
   <li class="active">
      <a href="#routine" data-toggle="tab">
         Routine
      </a>
   </li>
   <li><a href="#attendance" data-toggle="tab">Attendance</a></li>
   <li><a href="#info" data-toggle="tab">Personal Information</a></li>
   

   </ul>
<div id="myTabContent" class="tab-content">
   <div class="tab-pane fade in active" id="routine">
   <table class="table table-hover table-bordered">
 
   <thead>
      <tr>
         <th>Day</th>
         <th>Period 1</th>
		 <th>Period 2</th>
		 <th>Period 3</th>
		 <th>Half</th>
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
				
				</tr>
  <%    	}  %>	
  
   </tbody>
</table>
 <%    	}  %>	
  <%	
     }catch(SQLException e) {
        e.printStackTrace();
    }
finally {	stmt.close();rs.close();stmt=null;rs=null;}
  %>
<hr>
<table class="table table-hover table-bordered">
  <%
  stmt  = conn.createStatement();
   String s="select sj,sjname,credit from subj where dept='"+dep+"'";
   rs = stmt.executeQuery(s);
    try {
		if(rs!=null) {
  %>
   <thead>
      <tr>
         <th>Paper Code</th>
         <th>Paper Name</th>
		 <th>Credits</th>
		 
      </tr>
   </thead>
   <tbody>
      
      
    <%		while(rs.next()) {  %>
				<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				
				
				
				</tr>
  <%    	}  %>	
      <%	} %>
   </tbody>
    <%    	  %>	
  <%	
     }catch(SQLException e) {
        e.printStackTrace();
    } 
	finally {stmt.close();rs.close();stmt=null;rs=null;}
  %>
</table>
   </div>
   <div class="tab-pane fade" id="attendance">
    <table class="table table-hover table-bordered">
   <%
  stmt  = conn.createStatement();
   String s1="select sj,present,total,(present/total)*100 as perc from attendum where enroll='"+a+"'";
   rs = stmt.executeQuery(s1);
    try {
		if(rs!=null) {
  %>
   <thead>
      <tr>
         <th>Paper</th>
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
      <%	} %>
   </tbody>
</table>
   </div>
   <div class="tab-pane fade" id="info">
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
<!--<div class="tab-pane fade in" id="paper"> -->

	<!---- End this -->
 <%    	  %>	
  <%	
     }catch(SQLException e) {
        e.printStackTrace();
    } 
	finally {stmt.close();rs.close();conn.close();stmt=null;rs=null;conn=null;}
  %>
<!--</div> -->

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