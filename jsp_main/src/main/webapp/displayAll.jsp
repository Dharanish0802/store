<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>BOOKS IN MY STORE</h1><br><br>
<table border="1px">
<tr>
	<th>ID</th>
	<th>TITLE</th>
	<th>AUTHOR</th>
	<th>PRICE</th>
	<th>ACTIONS</th>
</tr>

<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/application", "root", "Dhanu@1080");
PreparedStatement ps = con.prepareStatement("select * from book");
ResultSet rs = ps.executeQuery();
while(rs.next())
{
%>

<tr>
	<td><%= rs.getInt(1) %></td>
	<td><%= rs.getString(2) %></td>
	<td><%= rs.getString(3) %></td>
	<td><%= rs.getInt(4) %></td>
	<td>
	<a href="edit.html">EDIT</a>
	<a href="delete.html">DELETE</a>
	</td>
</tr>

<%
}
%>

</body>
</html>