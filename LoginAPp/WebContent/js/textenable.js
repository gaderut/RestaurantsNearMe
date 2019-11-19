function view_textarea()
{
	var txt1 = document.getElementById('txt1');
	txt1.disabled =false;
		
}

function view_text()
{
	
	if(document.getElementById('m').checked ==true)
		{
			document.getElementById('m').disabled =false;
		
		}
	else
		{
		document.getElementById('m').disabled =true;	
		
		}
}