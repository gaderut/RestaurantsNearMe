<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/blurimage.css">
<script type="text/javascript">window.history.forward();
	function noback()
	{
		window.history.forward();
	}
	</script>
<title>Bill</title>
</head>
<body onload="noback();" background="images/new.jpg">
<table>
				<tr>
				<td style="width: 150px; "></td>
		<td align="right" colspan="2" style="width: 872px; "><a href="LogoutServlet" ><font size="5px" color="black" ><u><b>LOGOUT</b></u></font></a>
			
		</td>
		</tr>
		</table>
<%String username= session.getAttribute("username").toString();
System.out.println(username);
String r5 = session.getAttribute("r5").toString();
System.out.println(r5);
String bill = session.getAttribute("bill").toString();
System.out.println(bill);
String order_id = session.getAttribute("order_id").toString();
System.out.println(order_id);
String res_name = session.getAttribute("res_name").toString();
System.out.println(res_name);
String order_date = session.getAttribute("order_date").toString();
System.out.println(order_date);	
String emp_name = session.getAttribute("emp_name").toString();
System.out.println(emp_name);	
String emp_ph = session.getAttribute("emp_ph").toString();
System.out.println(emp_ph);			
%>

<h1 align="center" style="width: 953px;"><font size="5px" color="black" face="algerian" ><%=res_name %></font></h1>
<table  align="center">
<tr>
	<td style="width: 460px; ">Dear <%=username %> ,</td>
</tr>
<tr>
<td>Your order no.:<%=order_id%></td>
</tr>
<tr>
<td>Placed on:<%=order_date%></td>
</tr>
<tr>
<td>Your total bill amount:<%=bill%></td>
</tr>
<tr>
<td>Your order will be delivered by <%=emp_name %>(Contact No.:<%=emp_ph %>)within 30 miniutes</td>
</tr>
<tr>
<td>Enjoy your meal!!!! :-)</td>
</tr>
</table>
</body>
</html>