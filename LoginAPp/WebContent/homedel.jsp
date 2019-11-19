<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.io.PrintWriter"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/camera.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/stuck.css"> -->
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/blacktd.css">
<script src="js/textenable.js"></script>
<!-- <script> function view_text(m)
{
	if(document.getElementById(m).checked ==true)
		{
			document.getElementById(m).disabled =false;
		
		}
	else
		{
		document.getElementById(m).disabled =true;	
		
		}
}</script> -->
<script type="text/javascript" src="js/ValidateRegistrationForm.js"></script>
<title>Home Delivery</title>
<!--  <style>
div.background
{
  width: 500px;
  height: 500px;
  background: url(images/burger.jpg);
  border: 2px solid black;
}
div.transbox
{
  width: 700px;
  height: 400px;
  margin: 30px 50px;
  background-color: #ffffff;
  border: 1px solid black;
  opacity:0.4;
  filter:alpha(opacity=60); /* For IE8 and earlier */
  background-size:cover;
}
div.transbox p
{
  margin: 30px 40px;
  font-weight: bold;
  color: #000000;
}
</style>
-->
</head>
<body background="images/red2.jpg" style="height: 5px;">
<table>
				<tr>
				<td style="width: 150px; "></td>
		<td align="right" colspan="2" style="width: 872px; "><a href="LogoutServlet" ><font size="5px" color="White" ><u><b>LOGOUT</b></u></font></a>
			
		</td>
		</tr>
		</table>
	<form method="get" action="OrderServlet">
		<%
		String username= session.getAttribute("username").toString();
	
		request.setAttribute("username", username);
		System.out.println(username);
			String r = session.getAttribute("r").toString();
			request.setAttribute("r", r);
			System.out.println(r);
			String zon = session.getAttribute("zon").toString();
			request.setAttribute("zon", zon);
			System.out.println(zon);
			//String fo =request.getParameter("f1");
			//System.out.println(fo);
			Connection con = null;
			PreparedStatement ps,ps1 = null;
			ResultSet rs = null;
			ResultSet rs1 = null;
			try {
				Class.forName("oracle.jdbc.OracleDriver");
				con = DriverManager.getConnection(
						"jdbc:oracle:thin:@localhost:1521:XE", "system",
						"ashwini");
			} catch (Exception e) {
				System.out.println(e);
			}
			try {
				ps = con.prepareStatement("select menu_id,menu_item,unit_price from menu where res_id=?");
				ps.setString(1, r);

				rs = ps.executeQuery();
				out.println("<table  style='width: 100%' border=1>");
				out.println("<tr><th>Item</th>");
				out.println("<th>Price</th>");
				out.println("<th>Select Items</th>");
				out.println("<th>Enter Quantity</th></tr>");
				while (rs.next()) {
					int m = rs.getInt("menu_id");
					String menu_item = rs.getString("menu_item");
					String unit_price = rs.getString("unit_price");
					request.setAttribute("price", unit_price);
					out.println("<tr><td>" + menu_item + "</td>");
					out.println("<td>" + unit_price + "</td>");
					
					out.println("<td> <input type=\"checkbox\" name=\"item\" value=\""
							+ m + "\" id=\""+ m +"\" onclick=\"view_text()\"></td>");
							System.out.println("\n value of m ="+m);
							out.println("<td><input type=\"text\" name=\"quantity\" style=\"width: 100px;\" id=\""+ m +"\" /></td>");
					
					
				}
				out.println("</tr></table>");
				
				ps=con.prepareStatement("select cus_id from customer where username=?");
			ps.setString(1, username);
			rs=ps.executeQuery();
			while(rs.next())
							    {
							    int cus_id = rs.getInt("cus_id");
								rs.close();

			ps1=con.prepareStatement("select cus_adres from cus_address where cus_id=?");
			ps1.setInt(1, cus_id);
			rs1=ps1.executeQuery();
			while(rs1.next())
							    {
							    String address = rs1.getString("cus_adres");
							    System.out.println(address);
							    session.setAttribute("address", address);
							    String address1 = session.getAttribute("adress").toString();
								}
							}
			} catch (Exception e1) {
				System.out.println(e1);
			}
		%>
		<div class="background" style="width: 1045px; height: 350px">

		<table style="width: 455px; ">
			<tr>
				<td style="width: 604px; "><font color="white" face="algerian" >Address: <%=rs1.getString("cus_adres")%></font></td>
			</tr>
			<tr>
			<td style="width: 408px; "><input type="button" value="Click Here To Change Address" style="width: 226px; height: 39px" onclick="view_textarea()"/></td>
			
			</tr>
			<tr>
				<td><font color="white" face="algerian" >Enter New Address:</font> <textarea id="txt1" rows="4" cols="20" name="address"
						style="width: 311px;" disabled="disabled"></textarea></td>
			</tr>
			<tr>
				<td>
					<%
						String sql = "SELECT * FROM zone";
						ps = con.prepareStatement(sql);
						rs = ps.executeQuery();
					%>
					<p><font color="white" face="algerian" >
						Select Zone : </font><select name="zones"
							style="width: 146px; height: 34px">
							<%
								while (rs.next()) {
									String zname = rs.getString("zname");
							%>
							<option value="<%=zname%>"><%=zname%></option>

							<%
							}
							%>
						</select>


					</p> 
 	


				</td>
			</tr>
			<tr>
				<td><font color="white" face="algerian" >Mobile no.: </font><input type="text" name="mobile" style="height: 34px; width: 173px">
				</td>
			</tr>
		</table>
		
		
		<table width="100%" style="width: 1073px; height: 60px" align="center">
			<tr style="width: 959px;">
				<td style="height: 35px; width: 598px;" align="center">
					 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="Confirm Order" align="right" style='height:50px;width: 167px'/>
				</td>

			</tr>
		</table>
		</div>
		
	</form>
</body>
</html>