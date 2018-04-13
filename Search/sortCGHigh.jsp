<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SortPGHigh</title>
</head>
<body>
	<center>Console Games</center><br>
	
	<% ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	

	Statement stmt = con.createStatement();
	String str = "SELECT A.auction_id, A.game_title, A.price FROM Auction_Site.Auctions A WHERE A.device_type = 'xbox' OR A.devic_type = 'playstation' ORDER BY A.price DESC";
	ResultSet result = stmt.executeQuery(str);
		
		while (result.next()) {
			out.print(result.getString("game_title"));
			out.print(" $" + result.getString("price"));
			%>
			<form method="post" action="item.jsp">
			<input type = "hidden" name = "item" value = "<%result.getString("auction_id");%>">
			<input type = "submit" value = "view">
			</form>
			<br><br>
			<%
		}
		db.closeConnection(con);
	%>
</body>
</html>