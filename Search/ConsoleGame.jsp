<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Console Games</title>
</head>
<body>
	<center>Console Games</center> <br>
	<form method="post" action="sortCG.jsp">
	<td>SortBy</td>
	<select name = "sortchoice" size=1>
			<option value = "high">HighToLow</option>
			<option value = "low">LowToHigh</option>
		</select>
	<input type = "submit" value = "sort">
	</form>
	<br><br>

	<% ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	

	Statement stmt = con.createStatement();
			
	String str = "SELECT A.auction_id, A.game_title, A.current_price FROM Auction_Site.Auctions A WHERE A.device_type = 'playstation' OR A.device_type = 'xbox'";

	ResultSet result = stmt.executeQuery(str);
	
	while (result.next()) {
		out.print(result.getString("game_title"));
		out.print(" $" + result.getString("current_price"));
		%>
		<form method="post" action="item.jsp">
		<input type = "hidden" name = "item" value = "<%result.getString("auction_id");%>">
		<input type = "submit" value = "view">
		</form>
		<br><br>
		<%
	}
	%>
</body>
</html>