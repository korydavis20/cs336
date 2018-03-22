<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>

<body>
	<%

	List<String> list = new ArrayList<String>();
	
		try {
			
			String user = request.getParameter("username");
			String pass = request.getParameter("password");
			String temp = user;
			user = "'" + user + "'";
			String type = request.getParameter("user-type");
			
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			
			//Make a SELECT query
			String str = "SELECT * FROM Auction_Site.Account WHERE Auction_Site.Account.username = " + user + ";";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			
			boolean found = false;
			
			//parse out the results
			while (result.next()) {
				
				if(result.getString("username").equals(temp)){
					
					if(!result.getString("pass").equals(pass)){ 
						out.print("Password is invalid <br/>"); 
						found = true;
						break;
					}else{
						
						if(!type.equals("customer")){
							
							str = "SELECT * FROM Auction_Site.Admin WHERE Auction_Site.Admin.username = " + user + ";";
							result = stmt.executeQuery(str);
							
							while(result.next()){
								
								if(result.getString("username").equals(temp)){
									out.print("<br/> Welcome, Admin: " + temp);
									found = true;
									break;
								}
							}
							
							if(found != true) out.print("This account does not have admin access");
							
							break;
							
						}else{
							found = true;
							out.print("<br/> Welcome: " + temp);
							break;
						}
					}
				}

			}
			
			if(found == false) out.print("Account does not exist");
			
			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>