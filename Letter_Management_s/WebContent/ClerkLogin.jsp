<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,java.util.*"%>
    <%@page import="javax.sql.*"%>

   <% 
String dep=request.getParameter("dep");
String ename=request.getParameter("uname");
String pass=request.getParameter("pass");

 try
{	
	Connection conn=null;
	String url="jdbc:mysql://localhost:3306/login";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, "root", "root");
Statement st=conn.createStatement();
ResultSet rs = null;
PreparedStatement ps = conn.prepareStatement("SELECT * FROM tablename1 where email=? and pass=?");
//ps.setString(1, dep);
ps.setString(1, ename);
ps.setString(2, pass);

rs = ps.executeQuery();
boolean datafound = rs.next();

if (datafound == true) {
	//out.println("Valid User");
	
	//RequestDispatcher rd = request.getRequestDispatcher("Education.html");
	//rd.forward(request, response);
	%><jsp:forward page="ClerkDetails.html" />
	
		<% 
} else {
	//out.println("Invalid User");
	%>
	<jsp:forward page="ClerkLogin.html" />
	
	<% 
	//RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
	//rd.include(request, response);
}

}

catch(Exception e)
{
System.out.print("unable to connect"+e);

}%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>