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
<%
	String title = request.getParameter("title");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/application", "root", "Dhanu@1080");
	PreparedStatement ps = con.prepareStatement("select * from book where title = ?");
	ps.setString(1,title);
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
%>
<b><%= "BOOK ID      : "+rs.getInt(1) %></b> <br><br>
<b><%= "BOOK TITLE   : "+rs.getString(2) %></b> <br><br>
<b><%= "BOOK AUTHOR  : "+rs.getString(3) %></b> <br><br>
<b><%= "BOOK PRICE   : "+rs.getInt(4) %></b> <br><br>
<%
	}
%>

<form action="home.html">
<input type="submit" value="BACK TO HOME">
</form>

</body>
</html>