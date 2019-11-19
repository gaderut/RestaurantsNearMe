function start() {
	document.forms["form2"]["username"].focus();
}

function start1() {
	document.forms["form2"]["name"].focus();
}
function validate() {
	if (document.forms["form2"]["username"].value == "") {
		alert("Username should not be empty");
		document.forms["form2"]["username"].focus();
		return false;
	}

	if (document.forms["form2"]["password"].value == "") {
		alert("Password should not be empty / Length be between 7 to 15");
		document.forms["form2"]["password"].focus();
		return false;
	}

	if (document.forms["form2"]["repassword"].value == "") {
		alert("Please Re-Enter Password");
		document.forms["form2"]["repassword"].focus();
		return false;
	}

	

	if (document.forms["form2"]["name"].value == "") {
		alert("Please Enter Name");
		document.forms["form2"]["name"].focus();
		return false;
	}

	if (document.forms["form2"]["zone"].value == "") {
		alert("Please Enter Zone");
		document.forms["form2"]["zone"].focus();
		return false;
	}
	
	
}


function secans()
{
	if (document.forms["form2"]["secAns"].value == "") {
		alert("Please Enter Your Answer");
		document.forms["form2"]["secAns"].focus();
		return false;
	}
}
function f1()
{
	if (document.forms["form2"]["repassword"].value != document.forms["form2"]["password"].value) {
		document.forms["form2"]["password"].focus();
		alert("Please Enter Same Password");
		document.forms["form2"]["password"].value='';
		document.forms["form2"]["repassword"].value='';
		//document.getElementById("password").toString().length=0;
		 //var1.reset();
		//document.getElementById("repassword").toString().length=0;
		//var2.reset();
		
		document.forms["form2"]["repassword"].focus();
		return false;
	}
}
function phone()
{
	var a = document.forms["form2"]["mobile"].value;
	if (a == "") {
		alert("please Enter the Contact Number");
		document.forms["form2"]["mobile"].focus();
		return false;
	}

	if (isNaN(a)) {
		alert("Enter the valid Mobile Number(Like : 9566137117)");
		document.forms["form2"]["mobile"].focus();
		return false;
	}

	if ( (a.length != 10)) {
		alert(" Your Mobile Number must be 1 to 10 Integers");
		document.forms["form2"]["mobile"].select();
		return false;
	}
}
function view_tex()
{
	if(document.getElementsByName("item").checked ==true)
		{
			document.getElementByName("quantity").disabled =false;
		
		}
	else
		{
		document.getElementByName("quantity").disabled =true;	
		
		}
}


// onclick="phonenumber(document.form1.text1)"/

