<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Video Game Auction Site</title>
</head>

<body>

<br>									  
<br>
 <!-- Show html form to i) display something, ii) choose an action via a 
  | radio button -->
<!-- forms are used to collect user input 
	The default method when submitting form data is GET.
	However, when GET is used, the submitted form data will be visible in the page address field-->


<center>Enter Login Information</center> <br>

	<form method="post" action="checkLogin.jsp">
	<center><table>
	<tr>    
	<td>Username</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="password"></td>
	</tr>
	<tr>
	<td>
		<select name="user-type" size=1>
			<option value="admin">Admin</option>
			<option value="csupport">Customer Support</option>
			<option value="customer">Customer</option>
		</select>
	</td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
	</center>
	</form>
<br><br>

<br>><br>

<center>Register a Username and Password.</center><br>
<br>
	<form method="post" action="registration.jsp">
	<center><table>
	<tr>    
	<td>Username</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="text" name="password"></td>
	</tr>
	<tr>
	<td>
		<select name="user-type" size=1>
			<option value="admin">Admin</option>
			<option value="csupport">Customer Support</option>
			<option value="customer">Customer</option>
		</select>
	</td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
	</center>
	</form>
<br>


</body>
</html>