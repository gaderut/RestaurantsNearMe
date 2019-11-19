<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.PrintWriter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/camera.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/stuck.css">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/blurimage.css">
<title>HOME</title>
</head>
<body>
<%
	HttpSession h=request.getSession(false);
	String username= session.getAttribute("username").toString();
	
	request.setAttribute("username", username);
		System.out.println(username);
		//h.setAttribute("username",u1); %>
<table bgcolor="#f45472" style="width: 1077px; ">
				<tr>
				<td style="width: 581px; "><font size="5px" color="white" face="algerian" >Welcome <%=username %></font></td>
		<td align="right" colspan="2" style="width: 398px; "><a href="LogoutServlet" ><font size="5px" color="white" ><u><b>LOGOUT</b></u></font></a>
			
		</td>
		</tr>
		</table>
	
	<div>
	<table  style="width: 1068px" bgcolor="#f45472">
		
		<tr style="height: 30px;">
			<td style="width: 581px; "><form method="post" action="ZoneServlet" style="width: 494px; ">
					<%
						Connection con = null;
						PreparedStatement ps = null;
						try {
							Class.forName("oracle.jdbc.OracleDriver");
							con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system","ashwini");
							String sql = "SELECT * FROM zone";
							ps = con.prepareStatement(sql);
							ResultSet rs = ps.executeQuery();
					%>
					<p><b><font size="5px">
						Select Zone : </font><select name="zones">
							<%
								while (rs.next()) {
										String zname = rs.getString("zname");
							%>
							<option value="<%=zname%>"><%=zname%></option>

							<%
								}
							%>
						</select>


					</b><input type="submit" value="View Restaurants"></p>
					<td></td>
					<%
						} catch (SQLException sqe) {
							out.println(sqe);
						}
					%>

				</form></td>



			<td align="left" style="width: 398px; "><a href="recent.jsp" ><font size="5px" color="White" ><b>Recently Viewed</b></font></a></td>
		</tr>
	</table>
	</div>
 <div>
 		<img src="images/image(3).jpeg" style="width: 1076px; height: 673px">
		<div class="mask"></div>
	</div> 
	

	


</body>
</html>