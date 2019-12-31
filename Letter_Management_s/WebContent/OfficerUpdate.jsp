<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*,java.util.*"%>
    <%@page import="javax.sql.*"%>
    
   	<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="UpdateInfo.jsp">
<input type="hidden" name="id" value="<%=request.getParameter("loc") %>">
 content:<input type ="text" name = "Content"><br>
     <select name="Status">
     <option>Pending</option>
     <option>Approved</option>
     <option>Rejected</option>    
     </select>
     
 <input type="date" name="dname">
 
<input type="submit" value="Submit"> 
</form>
</body>
</html>
 