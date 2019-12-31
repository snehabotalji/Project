<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,java.util.*"%>
    <%@page import="javax.sql.*"%>
   <% 
   
   
String dep=request.getParameter("dep");
   String fil=request.getParameter("fil");

String d=request.getParameter("rdate");
String loc;


 try
{	
	Connection conn=null;
	String url="jdbc:mysql://localhost:3306/FileSystem";
Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection(url, "root", "root");
Statement st=conn.createStatement();
ResultSet rs = null;
int count=1;
PreparedStatement st1=conn.prepareStatement("select * from FileInfo where Department=? and TypeOfFile=?");
st1.setString(1, dep);
st1.setString(2, fil);
rs=st1.executeQuery();
while(rs.next())
{
	count++;
}

loc=dep+"/"+fil+"/"+count;
PreparedStatement ps = conn.prepareStatement("insert into FileInfo(Department,TypeOfFile,ReceivedDate,Location,FileNumb) values(?,?,?,?,?)");
ps.setString(1, dep);
ps.setString(2,fil);
ps.setString(3, d);
ps.setString(4, loc);
ps.setInt(5, count);

int r = ps.executeUpdate();
out.print(r);
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