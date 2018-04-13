<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Page</title>
<br><br>
	</head>
	<body>
	<center>Search Page</center> <br>
	<form method="post" action="checkCriteria.jsp">
	<center>
	<td>
		<select name = "item-type" size=1>
			<option value = "consolegame">ConsoleGame</option>
			<option value = "pcgame">PCGame</option>
		</select>
		<input type = "submit" value = "search">
	</td>
	</center>
	</form>
	</body>
</html>