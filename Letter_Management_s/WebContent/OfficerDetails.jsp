<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,java.util.*"%>
    <%@page import="javax.sql.*"%>

   <% 
String dep=request.getParameter("dep");
String ft=request.getParameter("fil");
String dt=request.getParameter("dt");

 try
{	
	Connection conn=null;
	String url="jdbc:mysql://localhost:3306/FileSystem";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, "root", "root");
Statement st=conn.createStatement();
ResultSet rs = null;
PreparedStatement ps = conn.prepareStatement("select * from FileInfo where Department=? and TypeOfFile=? and ReceivedDate=?");
ps.setString(1, dep);
ps.setString(2, ft);
ps.setString(3, dt);

rs = ps.executeQuery();


	 %>
	 <h4>Basic Information</h4>
	 <table border="1">
	<tr>

	<td>Numb</td>
	<td>Department</td>
	<td>TypeOfFile</td>
	<td>ReceivedDate</td>
	<td>Location</td>
	<td>FileNumb</td>
	<td>Content</td>
	<td>Status1</td>
	<td>DepartureDate</td>
	</tr>
	 <%
		while(rs.next())
		{
			%>
			<tr><td><%=rs.getString("Numb") %></td>

			<td><%=rs.getString("Department") %></td>
			
			<td><%=rs.getString("TypeOfFile") %></td>
			
			<td><%=rs.getString("ReceivedDate") %></td>
			
			<td><%=rs.getString("Location") %></td>

			<td><%=rs.getString("FileNumb") %></td>

			<td><%=rs.getString("Content") %></td>
						
			<td><%=rs.getString("Status1") %></td>
			
			<td><%=rs.getString("DepartureDate") %></td>
			
			<td><a href="OfficerUpdate.jsp?loc=<%=rs.getString("Location") %>">update</a></td>
			</tr>
	
		 <% 
		 
		} %>
		 
	 </table>
	 <%
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