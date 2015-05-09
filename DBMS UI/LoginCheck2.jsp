<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
	<%@ page import = "java.sql.*" %>
	<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:hr/hr@localhost:1521:xe");
    Statement stmt  = conn.createStatement();
	String[] t = new String[100];int i=0;
	String sql="select enroll from students"; 
    ResultSet rs = stmt.executeQuery(sql);
    try {
		if(rs!=null) {
		while(rs.next()) {
		t[i]=rs.getString(1);
		
		i++;
		}}}
		
     catch(SQLException e) {
        e.printStackTrace();
    } stmt.close();rs.close();stmt=null;rs=null;
	
  %>
        <%
        String username=request.getParameter("enroll");
        String password=request.getParameter("pass");
		i=0;
	while(i<t.length){
	
        if((username.equals(t[i]) && password.equals("pass")))
            {
			
            session.setAttribute("user",username);
            response.sendRedirect("students.jsp");
            break;
			} 
       i++;
	   }
        %>
    </body>
</html>


