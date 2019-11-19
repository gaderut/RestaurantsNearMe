<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/camera.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/stuck.css">
<title>Recently viewed</title>
</head>
<body>
	<%
	String username= session.getAttribute("username").toString();
		Connection con = null;
						PreparedStatement ps = null;
						ResultSet rs;
						Statement st;
						try {
							Class.forName("oracle.jdbc.OracleDriver");
							con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","ashwini");
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
						try {
						ps=con.prepareStatement("select cus_id from customer where username=?");
		      				ps.setString(1,username);
							rs=ps.executeQuery();
							while(rs.next()){
							int cus_id = rs.getInt("cus_id");
							ps=con.prepareStatement("SELECT res_name,res_add from recent where cus_id=? group by res_name,res_add");
		      				ps.setInt(1,cus_id);
							rs=ps.executeQuery();
							out.println("<div class='grid_12'><table bgcolor='#f45472' style='width: 100%' border=1>");
							 out.println("<tr><th>Restaurant</th>");
                             out.println("<th>Address</th></tr>");
							while(rs.next()){
							String res_name=rs.getString("res_name");
							String res_add=rs.getString("res_add");
							out.println("<tr><td>"+ res_name + "</td>");
                                out.println("<td>" + res_add + "</td>");
                                
            					           
							}
						 out.println("</tr></table>");
						 }
						}
					catch(Exception e1)
						{
						System.out.println(e1);
						} 
							
							
	 %>
	 <div>
 		<img src="images/cake.jpg" style="width: 1090px; ">
		<div class="mask"></div>
	</div> 
</body>
</html>