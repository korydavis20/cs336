<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Page</title>
</head>
<body>
	<%
			String type = request.getParameter("item-type");
			if(type.equals("pcgame"))
				response.sendRedirect("PCGame.jsp");
			if(type.equals("consolegame"))
				response.sendRedirect("ConsoleGame.jsp");
	%>
</body>
</html>