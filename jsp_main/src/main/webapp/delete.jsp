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
    // Get the book ID from the parameter
    int id = Integer.parseInt(request.getParameter("id"));

    // JDBC code to delete the book
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/application", "root", "Dhanu@1080");
        PreparedStatement ps = con.prepareStatement("DELETE FROM book WHERE id = ?");
        ps.setInt(1, id);
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