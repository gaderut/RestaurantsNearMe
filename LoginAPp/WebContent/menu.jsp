<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.io.PrintWriter"%>
    <%@include file="rest.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!--  <link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/camera.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/stuck.css">-->
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/blacktd.css">
<title>Menu</title>
</head>
<body background="images/red3.jpg" style="height: 5px;">
<table>
				<tr>
				<td style="width: 150px; "></td>
		<td align="right" colspan="2" style="width: 872px; "><a href="LogoutServlet" ><font size="5px" color="White" ><u><b>LOGOUT</b></u></font></a>
			
		</td>
		</tr>
		</table>
<% String u1= session.getAttribute("username").toString();
	
		request.setAttribute("username", u1);
		System.out.println(username);

String r= session.getAttribute("r").toString();
request.setAttribute("r", r);
String z1= session.getAttribute("zon").toString();
request.setAttribute("zon", z1);
System.out.println(z1);
//String fo =request.getParameter("f1");
//System.out.println(fo);
						
								
						try {
							Class.forName("oracle.jdbc.OracleDriver");
							con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","ashwini");
							}
							catch(Exception e)
							{
								System.out.println(e);
							}
						try {
						 	ps=con.prepareStatement("select menu_item,unit_price from menu where res_id=?");
		      				ps.setString(1,r);
		      				
							rs=ps.executeQuery();
							out.println("<table align='center'style='width: 50%' border=1>");
							 out.println("<tr><th>Item</th>");
                             out.println("<th>Price(Rs.)</th></tr>");
							while(rs.next()){
              					String menu_item = rs.getString("menu_item");
            					String unit_price = rs.getString("unit_price");
            					out.println("<tr><td>"+ menu_item + "</td>");
                                out.println("<td>" + unit_price + "</td>");
                                
            					           
							}
						 out.println("</tr></table>");
						 
						}
					catch(Exception e1)
						{
						System.out.println(e1);
						} 
						%>
						<table width="100%" style="width: 1073px; height: 60px" align="center">
<tr style="width: 959px; ">
	<td style="height: 35px; width: 595px; " align="center"><a href="homedel.jsp" > <input type="submit" value="Get Home Delivery" style='height:50px;width: 167px' /></a> </td>
 
</tr>
</table>
						
            				


</body>
</html>