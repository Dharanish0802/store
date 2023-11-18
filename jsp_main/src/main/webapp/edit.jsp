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
    // Get the form parameters
    int id = Integer.parseInt(request.getParameter("id"));
    String title = request.getParameter("title");
    String author = request.getParameter("author");
    int price = Integer.parseInt(request.getParameter("price"));

    // JDBC code to update the book
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/application", "root", "Dhanu@1080");
        PreparedStatement ps = con.prepareStatement("UPDATE book SET title=?, author=?, price=? WHERE id=?");
        ps.setString(1, title);
        ps.setString(2, author);
        ps.setInt(3, price);
        ps.setInt(4, id);
        ps.executeUpdate();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

    // Redirect back to the book list page
    response.sendRedirect("displayAll.jsp");
%>

</body>
</html>