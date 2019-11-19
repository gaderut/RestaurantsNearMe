<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,java.io.PrintWriter"%>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/blurimage.css">
<title>Review1</title>
</head>
<body background="images/new.jpg" style="height: 5px;">
<table>
				<tr>
				<td style="width: 150px; "></td>
		<td align="right" colspan="2" style="width: 872px; "><a href="LogoutServlet" ><font size="5px" color="black" ><u><b>LOGOUT</b></u></font></a>
			
		</td>
		</tr>
		</table>
<%
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs;				
	String u1= session.getAttribute("username").toString();
	request.setAttribute("username", u1);
		System.out.println(u1);
		
		String r2= session.getAttribute("r1").toString();
		System.out.println(r2);
		String rating=request.getParameter("rate");
		System.out.println(rating);
		StringBuffer comment= new StringBuffer(request.getParameter("comment"));
		System.out.println(comment);
		try
		{
			Class.forName("oracle.jdbc.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","ashwini");
			Statement st=con.createStatement();
			//PrintWriter out=response.getWriter();
			ps=con.prepareStatement("select cus_id from customer where username=?");
			ps.setString(1, u1);
			rs=ps.executeQuery();
			while(rs.next())
							    {
							    int cus_id = rs.getInt("cus_id");
			
			int i=st.executeUpdate("insert into review(rev_id,res_id,rating,cus_id,coment,rev_time) values(rev_seq.nextval,'"+r2+"','"+rating+"','"+cus_id+"','"+comment+"',SYSDATE)");
			}
			System.out.println("Data is inserted successfully");
			//response.sendRedirect("review.jsp");
			out.println("<html><body onload=\"alert('Thank you')\"></body></html>");
			try {
			ps = con.prepareStatement("select coment,rev_time,rating,cus_id from review where res_id=?");
			ps.setString(1, r2);

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
			
				out.println("<tr></tr></table>");
		} catch (Exception e1) {
			System.out.println(e1);
		}
		}
		
		
	
	catch(Exception e1)
	{
		System.out.println("ERROR");
		e1.printStackTrace();
	}
 %>
 
</body>

</html>