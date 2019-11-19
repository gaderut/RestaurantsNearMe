<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/blurimage.css">
<title>Review</title>
</head>
<body background="images/new.jpg" style="height: 5px;">
<table>
				<tr>
				<td style="width: 150px; "/>
		<td align="right" colspan="2" style="width: 872px; "><a href="LogoutServlet" ><font size="5px" color="black" ><u><b>LOGOUT</b></u></font></a>
			
		</td>
		</tr>
		</table>
	<%
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs;
		//String username= request.getAttribute("username").toString();
		//request.setAttribute("username", username);
		//System.out.println(username);
		String r1 = session.getAttribute("r").toString();
		session.setAttribute("r1", r1);
		//String fo =request.getParameter("f1");
		//System.out.println(fo);

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:XE", "system",
					"ashwini");
		} catch (Exception e) {
			System.out.println(e);
		}
		try {
			ps = con.prepareStatement("select coment,rev_time,rating,cus_id from review where res_id=?");
			ps.setString(1, r1);

			rs = ps.executeQuery();
			out.println("<table>");
			while (rs.next()) {
				String coment = rs.getString("coment");
				System.out.println(coment);
				String rev_time = rs.getString("rev_time");
				System.out.println(rev_time);
				int rate = rs.getInt("rating");
				System.out.println(rate);
				int c = rs.getInt("cus_id");
				System.out.println(c);
				session.setAttribute("c", c);
				out.println("<tr><td style='width: 221px;'>Customer ID:" + c + "</td></tr>");

				out.println("<tr><td> Rating:" + rate + "</td>");
				out.println("<td style='width: 221px;'>" + coment + "</td>");
				out.println("<td > </td>");
				out.println("<td style='width: 300px;'> Posted at:" + rev_time + "</td><tr></tr><tr></tr>");
				

				}
			//}
				out.println("<tr></tr></table>");
		} catch (Exception e1) {
			System.out.println(e1);
		}
	%>
	<form action="newreview.jsp" method="post">
		<table>
			<tr style="width: 784px; ">
				<td style="width: 340px; ">Share Your experience<textarea rows="5" cols="20"
						name="comment" style="width: 297px; "> </textarea></td>

				<td style="width: 221px; ">Rating <select name="rate" style="width: 65px; height: 25px">

						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
				</select>
				<td style="width: 217px;"><a href="newreview.jsp"><input
						type="submit" value="Post review"> </a></td>
		</table>
	</form>

</body>
</html>