<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
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
	
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		int price = Integer.parseInt(request.getParameter("price"));
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/application", "root", "Dhanu@1080");
		PreparedStatement ps = con.prepareStatement("insert into book values(?,?,?,?)");
		ps.setInt(1,id);
		ps.setString(2,title);
		ps.setString(3,author);
		ps.setInt(4,price);
		ps.executeUpdate();
		response.sendRedirect("home.html");
		
	%>
</body>
</html>