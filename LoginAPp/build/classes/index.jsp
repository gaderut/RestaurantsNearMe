<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="css/camera.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/font-awesome.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/stuck.css">
	<script src="js/jquery.js"></script>
	<script src="js/jquery-migrate-1.2.1.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/script.js"></script>
	<script src="js/tmStickUp.js"></script>
	<script src="js/jquery.equalheights.js"></script>
	<script src="js/jquery.ui.totop.js"></script>
	<script src="js/camera.js"></script>
	<script src="js/ValidateRegistrationForm.js"></script>
	<title>Home</title>
	<!-- <script>
            $(document).ready(function(){
                jQuery('#camera_wrap').camera({
                    loader: true,
                    pagination: true,
                    minHeight: '300',
                    thumbnails: false,
                    height: '47.36%',
                    caption: false,
                    navigation: false,
                    fx:  'scrollBottom'
                });
                /*Back to Top*/
                $().UItoTop({ easingType: 'easeOutQuart' });
             });
        </script> -->
</head>

<body id="top" onload="start()">
	<!--==============================header=================================
<div class="box">
<header id="header">


</header>
<div class="clear"></div>-->
<!--=======slider================================
<div id="camera_wrap">
<div data-src="images/slide1.jpg"></div>
<div data-src="images/slide2.jpg"></div>
<div data-src="images/slide3.jpg"></div>
</div>
</div>-->
<!--=======content================================-->





<div id="content">
<div class="bg1 p84">
<div class="container">
<div class="row">
<div class="grid_12">
<div style="color:green; background-color: white;text-align: center;">
</div>
<div class="container_div">
	<form method="get" name="form2" action="LoginServlet" onsubmit="return(validate())">
		<table align="center">
			<tr>
				<td><font color="White" size="6px">Enter UIN</font></td>
				<td><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td><font color="White" size="6px">Enter Password</font></td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="Submit"/>
				</td>
				<td>
					<input type="reset" value="Clear"/>
				</td>
			</tr>
			
		</table>
		<hr/>
		<table align="center">
		<tr>
			<td align="center"><a href="sign_up.jsp" ><font size="5px" color="White" >New User</font></a><br/><font size="5px" color="White" >
			Sign Up Here</font></td>
		</tr>
		</table>
	</form>
</div>
<hr/>
<h2>ABHI<br>CLOTH <br>CENTRE</h2>
</div>
</div>
</div>
</div>

</div>

<!--=======footer=================================-->


</body>
</html>