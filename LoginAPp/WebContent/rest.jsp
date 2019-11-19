<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*,java.io.PrintWriter"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/blacktd.css"> 
<title>Restaurant</title>
</head>
<body background="images/blue1.png" style="height: 5px;">

		<%
		String username= session.getAttribute("username").toString();
		
		request.setAttribute("username", username);
		System.out.println(username);
		String zon=session.getAttribute("zon").toString();
		request.setAttribute("zon", zon);
		String foo=request.getParameter("food");
		//session.setAttribute("foo", foo);
		
					
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
						 	ps=con.prepareStatement("select * from restaurant where res_id=?");
		      				ps.setString(1,foo);
							rs=ps.executeQuery();
							while(rs.next()){
              					String res_name = rs.getString("res_name");
            					String res_add = rs.getString("res_add");
            					st=con.createStatement();
            					int k=st.executeUpdate("insert into recent values("+cus_id+",'"+res_name+"','"+res_add+"',SYSDATE)");
            					String veg = rs.getString("veg");
            					int r=rs.getInt("res_id");
            					session.setAttribute("r", r);
            				%>
          <div id="container"> 				
			<form method="post" action="">
			<table>
				<tr>
				<td style="width: 150px; "/>
		<td align="right" colspan="2" style="width: 872px; "><a href="LogoutServlet" ><font size="5px" color="White" ><u><b>LOGOUT</b></u></font></a>
			
		</td>
		</tr>
		</table>
				<h1 align="center" style="width: 953px; "><font size="5px" color="white" face="algerian" ><%=rs.getString(3) %></font></h1>
				<table border="1" style="width:100%">
			
			<tr style="height: 50px; ">
				<td colspan="3" style="width: 40%; "align="center"> <font size="5px" color="white">CUISINES  </font><img src="C:\Users\ashwini\Documents\Bluetooth Folder\images_3.jpeg" alt="like" style="width: 39px; height: 27px;"></td>
				
				<td colspan="3" style="width: 33%; " align="center"> <font size="5px" color="white"><%=rs.getString(5) %></font></td>
				 
				
			</tr>
			<tr style="height: 50px; ">
				<td colspan="3" style="width: 40%; " align="center"> <font size="5px" color="white">FEATURES  </font><img src="C:\Users\ashwini\Documents\Bluetooth Folder\case2.jpg" alt="like" style="width: 39px; height: 27px;"></td>
				<td>
				<table style="width:100%" >
				<tr>
					<td colspan="3" style="width: 39%; " align="center"> <font size="5px" color="white">Non-Veg <input type="checkbox" name="1"<%if ("N".equals(rs.getString(7))){out.print("checked=\"checked\""); }%> value="Veg" disabled="disabled" ></font></td>
					<td style="width: 39%; " align="center"><font size="5px" color="white"> Home delivery <input type="checkbox" name="2" <%if ("Y".equals(rs.getString(11))){out.print("checked=\"checked\""); }%> value="Home_del" disabled="disabled" ></font></td>
					<td style="width: 39%; " align="center"><font size="5px" color="white"> AC <input type="checkbox" name="3" <%if ("Y".equals(rs.getString(9))){out.print("checked=\"checked\""); }%> value="Ac"  disabled="disabled" ></font></td>
				</tr>
				<tr>
					<td colspan="3" style="width: 39%; " align="center"> <font size="5px" color="white">Bar <input type="checkbox" name="4" <%if ("Y".equals(rs.getString(8))){out.print("checked=\"checked\""); }%> value="Bar" disabled="disabled"  ></font></td>
					<td style="width: 39%; " align="center"> <font size="5px" color="white">Credit card <input type="checkbox" name="5" <%if ("Y".equals(rs.getString(10))){out.print("checked=\"checked\""); }%> value="Credit_card" disabled="disabled"  ></font></td>
				</tr>
			    </table>
			    </td>
			    </tr>
			    <tr style="height: 50px; ">
				<td colspan="3" style="width: 40%; " align="center"> <font size="5px" color="white">COST FOR TWO  </font><img src="C:\Users\ashwini\Documents\Bluetooth Folder\images.png" alt="like" style="width: 39px; height: 27px;"></td>
				<td style="width: 70%; " align="center"><font size="5px" color="white">Rs.<%=rs.getString(6) %></font></td>
			</tr>
			<tr style="height: 50px; ">
				<td colspan="3" style="width: 40%; "align="center"> <font size="5px" color="white">OUR SPECIALS  </font><img src="C:\Users\ashwini\Documents\Bluetooth Folder\thumbsup-big.jpg" alt="like" style="width: 39px; height: 27px;"></td>
				<td>
				<table  style="width:100%" >
				<tr style="height: 50px; ">
					<td colspan="3"  style="width: 50%;"  align="center"> <font size="5px" color="white"><%=rs.getString(12) %></font></td>
					
				</tr>
				</table>
				</td> 
				
			</tr>
			<tr style="height: 50px; ">
				<td colspan="3" style="width: 40%; " align="center"> <font size="5px" color="white">ADDRESS  </font><img src="C:\Users\ashwini\Documents\Bluetooth Folder\images.jpeg" alt="like" style="width: 39px; height: 27px;"></td>
				<td colspan="3" style="width: 33%; border-style:solid; " align="center"> <font size="5px" color="white"><%=rs.getString(4) %></font></td>
			</tr>
			<tr style="height: 50px; ">
				<td colspan="3" style="width: 40%; " align="center"> <font size="5px" color="white">TIMINGS  </font><img src="C:\Users\ashwini\Documents\Bluetooth Folder\images_2.jpeg" alt="like" style="width: 39px; height: 27px;"></td>
				<td style="width: 70%; " align="center"><font size="5px" color="white"> <%=rs.getString(13) %></font></td>
			</tr>
			<tr style="height: 50px; ">
				<td colspan="3" style="width: 40%; " align="center"> <font size="5px" color="white">CONTACT NO.:  </font><img src="C:\Users\ashwini\Documents\Bluetooth Folder\ph.jpg" alt="like" style="width: 39px; height: 27px;"></td>
				<td style="width: 70%; " align="center"><font size="5px" color="white"> <%=rs.getString(14) %></font></td>
			</tr>
</table>


			</form>
			
			</div>
			<table width="100%" style="width: 1073px; height: 50px">
<tr style="width: 959px; ">
	<td style="height: 35px; width: 595px; " align="center"><a href="menu.jsp" ><font size="50px"> <input type="submit" value="View Menu" size="20px" style="width: 168px; height: 39px"/></font></a> </td>
 <td style="width: 408px; "> <a href="review.jsp" ><input type="submit" value="View Reviews" style="width: 168px; height: 39px"/></a></td>
</tr>
</table>

			
						<%
							}
							}
						
						}
					catch(Exception e1)
						{
						} 
						%>
						
						
						
	
		
		
		
</body>
</html>