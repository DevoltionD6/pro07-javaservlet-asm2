 function validate() {
	var user = document.getElementById("username").value;
	var pass = document.getElementById("password").value;
	if (user == "" && pass == "") {
		document.getElementById("username").style.border = "1px solid red";
		document.getElementById("error-name").innerHTML = "You must enter Username";
		document.getElementById("password").style.border = "1px solid red";
		document.getElementById("error-pass").innerHTML = "You must enter Password";
		return false;
	} else if (user == "" && pass != "") {
		document.getElementById("username").style.border = "1px solid red";
		document.getElementById("error-name").innerHTML = "You must enter Username";
		document.getElementById("password").style.borderColor = "#32CD32	";
		document.getElementById("error-pass").innerHTML = "";
		return false;
	} else if (pass == "" && user != "") {
		document.getElementById("username").style.borderColor = "#32CD32	";
		document.getElementById("error-name").innerHTML = "";
		document.getElementById("password").style.border = "1px solid red";
		document.getElementById("error-pass").innerHTML = "You must enter Password";
		return false;
	} 
	return true;
}