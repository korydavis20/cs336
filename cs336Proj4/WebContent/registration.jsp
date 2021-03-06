<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Submitted</title>
</head>
<body>
	<%
	    
		try {
	
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();		
			//Get parameters from the HTML form at the index?.jsp
			String user = request.getParameter("username");
			String pass = request.getParameter("password");
			String type = request.getParameter("user-type");
			
			//Make an insert statement for the Sells table:
			String insert = "INSERT INTO Auction_Site.Account(username, pass)"
					+ "VALUES (?, ?);";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, user);
			ps.setString(2, pass);
			
			//Run the query against the DB
			ps.executeUpdate();
			
			if(type.equals("customer")){
				
				insert = "INSERT INTO Auction_Site.End_User(username)"
						+ "VALUES (?);";		
				ps = con.prepareStatement(insert);
				ps.setString(1, user);
						
			}else{
			
				insert = "INSERT INTO Auction_Site.Admin(username, type)"
						+ "VALUES (?, ?);";
				ps = con.prepareStatement(insert);
				ps.setString(1, user);
				ps.setString(2, type);
				
			}
			
			ps.executeUpdate();
			
			//close the connection.
			db.closeConnection(con);
			
			out.print("You have been registered");
			
		} catch (Exception ex) {
			out.print(ex);
			out.print("<br/><br/> insert failed"); 
		}
	%>

</body>
</html>