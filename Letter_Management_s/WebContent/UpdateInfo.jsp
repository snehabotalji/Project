<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*,java.util.*"%>
    <%@page import="javax.sql.*"%>
    
   <%
String loc=request.getParameter("id");
   String content=request.getParameter("Content");
   String status=request.getParameter("Status");
   String dname=request.getParameter("dname");

   try
   {	
	
   	Connection conn=null;
   	String url="jdbc:mysql://localhost:3306/FileSystem";
   Class.forName("com.mysql.jdbc.Driver");
   conn = DriverManager.getConnection(url, "root", "root");
   Statement st=conn.createStatement();
   	 //ResultSet rs;
   	 

   		PreparedStatement ps = conn.prepareStatement("Update FileInfo set Content=?,Status1=?,DepartureDate=? where Location=?");
   		ps.setString(1, content);
   		ps.setString(2, status);
   		ps.setString(3, dname);
   		ps.setString(4, loc);
   	
   		int r=ps.executeUpdate();
   		out.println("Data is updated succcessfully!"+loc);
  	conn.close();
   //}

   }
   catch(Exception e)
   {
   System.out.print("unable to connect"+e);

   }
   
   %>
