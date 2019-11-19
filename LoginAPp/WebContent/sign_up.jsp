<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/layout.css">
<link rel="stylesheet" href="css/camera.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/font-awesome.css">
<link rel="stylesheet" href="css/stuck.css">
<script type="text/javascript" src="js/ValidateRegistrationForm.js"></script>

<title>SIGNUP</title>
</head>
<body onload="start1()">

	<form method="post" name="form2" action="RegisterServlet"
		onsubmit="return(validate())" >
		<h1 align="center" style="width: 953px;">
			<font size="5px" color="black" face="algerian">REGISTER
				HERE!!!</font>
		</h1>
		<table border="1" style="width: 75%" bgcolor="#f45472">

			<tr>
				<td style="width: 276px;">Name</td>
				<td><input type="text" name="name" style="width: 290px;" /></td>
			</tr>
			<tr>
				<td>Location</td>
				<td><select name="location">
						<option value="3">Bibwewadi</option>
						<option value="5">Camp</option>
						<option value="11">East Street</option>
						<option value="6">FC Road</option>
						<option value="7">Hadapsar</option>
						<option value="12">JM Road</option>
						<option value="8">Katraj</option>
						<option value="9">Kondhwa</option>
						<option value="4">Koregaon Park</option>
						<option value="2">Kothrud</option>
						<option value="13">Shivajinagar</option>
						<option value="1">Swargate</option>
						<option value="10">Wanowrie</option>
				</select></td>


			</tr>
			<tr>
				<td><font color="white" >Address</font> </td>
				<td><textarea rows="4" cols="20" name="address"
						style="width: 311px;"> </textarea></td>
			</tr>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username" style="width: 290px;" /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"
					style="width: 290px;" /></td>
			</tr>
			<tr>
				<td><font color="White">Confirm Password</font></td>
				<td><input type="password" name="repassword" onblur="f1()"
					style="width: 290px;" /></td>
			</tr>
			<tr>
				<td style="width: 276px;">Mobile number</td>
				<td><input type="text" name="mobile" onblur="phone()"
					style="width: 290px;" /></td>
			</tr>
			<tr>
				<td>Security Question</td>
				<td><select name="securityQuestion" style="width: 290px;">
						<option>What is your pet name ?</option>
						<option>What is your birth place ?</option>
				</select></td>
			</tr>

			<tr>
				<td>Answer</td>
				<td><input type="text" name="secAns" onblur="secans()"
					style="width: 290px;" /></td>
			</tr>
			<tr>
				<td><input type="submit" value="Submit" /></td>
				<td><input type="reset" value="Clear" /></td>
			</tr>
		</table>
	</form>

	<hr />
	<table height="40px" width="500px" bgcolor="#599595" align="center">
		<tr>
			<td align="center"><a href="index.jsp"
				style="text-decoration: none;"> <font size="4px" color="White">
						Login Here </font>
			</a></td>
		</tr>
	</table>



</body>
</html>