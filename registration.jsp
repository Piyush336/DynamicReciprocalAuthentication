<!DOCTYPE HTML>
<html>

<head>
<title></title>
<meta name="description" content="website description" />
<meta name="keywords" content="website keywords, website keywords" />
<meta http-equiv="content-type"
	content="text/html; charset=windows-1252" />
<link rel="stylesheet" type="text/css" href="style/style.css" />

</head>

<body>
	<div id="main">
		<div id="header">
			<div id="logo">
				<div id="logo_text">
					<br /> <br /> <font size="5"><a href="index.html"><span
							class="logo_colour">Dynamic Reciprocal Authentication Protocol for Mobile Cloud Computing
								</span></a></font>
				</div>
			</div>
			<div id="menubar">
				<ul id="menu">
					<li><a href="index.html">Home</a></li>
					<li><a href="userlog.jsp">Owner Login</a></li>
					<li><a href="registration.jsp">Data Owner Registration</a></li>
					<li><a href="login.jsp">User Login</a></li>
					<li><a href="regpage.jsp">User Registration</a></li>
				</ul>
			</div>
		</div>
		<div id="content_header"></div>
		<div id="site_content">
			<div id="sidebar_container">
				<br /> <br /> <br /> <br />
				<div class="sidebar">
					<div class="sidebar_top"></div>
					<div class="sidebar_item">
						<h3>Useful Links</h3>
						<ul>
							<li><a href="index.html">Home</a></li>
							<li><a href="userlog.jsp">Owner Login</a></li>
							<li><a href="registration.jsp">Data Owner Registration</a></li>
							<li><a href="login.jsp">User Login</a></li>
							<li><a href="regpage.jsp">User Registration</a></li>
						</ul>
					</div>
					<div class="sidebar_base"></div>
				</div>
			</div>
			<div id="content">

				<%
					if (request.getParameter("msgg") != null) {
				%>
				<h3>Failed</h3>
				<%
					} else {
				%>
				<h3>Data Owner Registration</h3>
				<%
					}
				%>

				<div class="form_settings">
					
					<form action="regaction.jsp" name="ff" method="get"
						onsubmit="return check()">
						
						<p>
							<span>Name</span><input class="contact" type="text" name="name" id="name" required="required"/>
						</p>
						<p>
							<span>User ID</span><input class="contact" type="text" name="user" id="user" required="required"/>
						</p>
						<p>
							<span>E-Mail</span><input class="contact" type="email" name="email" id="mail" required="required"/>
						</p>
						<p>
							<span>Password</span><input class="contact" type="password" name="pass" id="pass" required="required"/>
						</p>

						<p>
							<span>Date of Birth</span><input class="contact" type="date" name="dob" id="dob" required="required"/>
						</p>
						<p>
							<span>Address</span><input class="contact" type="text" name="loc" id="loc" required="required"/>
						</p>
						<p>
							<span>Gender</span><input class="contact" type="text" name="sex" id="sex" required="required"/>
						</p>
						
						<p>
							<span>IMEI</span><input class="contact" type="text" name="imei" id="imei" required="required"/>
						</p>

						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit" name="contact_submitted" value="Register" />
						</p>
					</form>
					
				</div>
			</div>
		</div>
		<br /> <br /> <br /> <br />
		<div id="content_footer"></div>
		<div id="footer">
			<p>Copyright &copy; Voidmain Technologies</p>
		</div>
	</div>
</body>
</html>
