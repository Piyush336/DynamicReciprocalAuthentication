<!DOCTYPE HTML>
<html>

<head>
<title></title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Tangerine&amp;v1" />
<link rel="stylesheet" type="text/css"
	href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" />
<link rel="stylesheet" type="text/css" href="style/style.css" />

<script>
	function check() {
		var a = document.ff.name.value;
		var b = document.ff.user.value;
		var c = document.ff.pass.value;
		var d = document.ff.email.value;
		var e = document.ff.dob.value;
		var f = document.ff.loc.value;
		var g = document.ff.sex.value;

		if (a == 0) {
			alert('Please Enter Name');
			document.getElementById("name").focus();
			return false;
		}
		if (b == 0) {
			alert('Please Enter Userid');
			document.getElementById("user").focus();
			return false;

		}
		if (c == 0) {
			alert('Please Enter Password');
			document.getElementById("pass").focus();
			return false;

		}
		if (d == 0) {
			alert('Please Enter E-mail Id');
			document.getElementById("email").focus();
			return false;

		}
		if (e == 0) {
			alert('Please Enter Date of Birth');
			document.getElementById("dob").focus();
			return false;

		}
		if (f == 0) {
			alert('Please Enter Your Location');
			document.getElementById("loc").focus();
			return false;

		}
		if (g == 0) {
			alert('Please Enter Gender');
			document.getElementById("sex").focus();
			return false;

		}

	}
</script>



</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">

				<div class="slogan">Hibrid Cryptography for Secure
					Trasnsmission over Cloud</div>
			</div>
			<div id="menubar">
				<ul id="menu">
					<!-- put class="current" in the li tag for the selected page - to highlight which page you're on -->

					<li><a href="index.html">Home</a></li>
					<li><a href="userlog.jsp">Owner Login</a></li>
					<li><a href="registration.jsp">Data Owner Registration</a></li>
					<li><a href="login.jsp">User Login</a></li>
					<li><a href="regpage.jsp">User Registration</a></li>
				</ul>
			</div>
		</div>
		<div id="site_content">

			<div id="content">
				<!-- insert the page content here -->

				<h1>User Registration Form</h1>
				<%
					request.getSession().setAttribute("usertype", "user");
				%>

				<%
					if (request.getParameter("msg") != null) {
				%>
				<h3>Success</h3>
				<%
					} else {
				%>
				<h3>Registration</h3>
				<%
					}
				%>

				<form action="regaction1.jsp" name="ff" method="get"
					onsubmit="return check()">

					<div class="form_settings">
						<p>
							<span>Name</span><input class="contact" type="text" name="name"
								id="name" />
						</p>
						<p>
							<span>User ID</span><input class="contact" type="text"
								name="user" id="user" />
						</p>

						<p>
							<span>E-Mail</span><input class="contact" type="text"
								name="email" id="mail" />
						</p>

						<p>
							<span>Password</span><input class="contact" type="text"
								name="pass" id="pass" />
						</p>

						<p>
							<span>Date Of Birth</span><input class="contact" type="date"
								name="dob" id="dob">
						</p>

						<p>
							<span>Address</span><input class="contact" type="text" name="loc"
								id="loc" />
						</p>

						<p>
							<span>Gender</span><input class="contact" type="text" name="sex"
								id="sex" />
						</p>

						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="submit" />
						</p>

					</div>
				</form>

			</div>
		</div>
	</div>
	<div id="footer">
		<p>
			Copyright &copy; Voidmain | <a
				href="http://www.voidmaintechnologies.com">info</a>
		</p>
	</div>
</body>
</html>
