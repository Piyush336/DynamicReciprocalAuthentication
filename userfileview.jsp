<!DOCTYPE HTML>
<%@page import="java.sql.ResultSet"%>
<%@page import="pack.DbConnector"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
    function check(){
        var a = document.f.k.value;      
         if(a==0){
            alert('Please Enter The Key..!');
            return false;
            document.getElementById("k").focus();            
        }
    }
    
</script>

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
					<!-- put class="current" in the li tag for the selected page - to highlight which page you're on -->

					<li class="current"><a href="userpage.jsp">Home</a></li>
					<li><a href="logout.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
		<div id="site_content">

			<div id="content">
				<!-- insert the page content here -->

				<%
					String my = session.getAttribute("me").toString();

					if (request.getParameter("dwn") != null) {
				%>
				<h3>Success fully download</h3>
				<%
					} else {
				%>
				<h3>
					Welcome to
					<%=my%></h3>
				<%
					}
				%>

				<%
					String f = null;

					String key = request.getParameter("key");
					String owner=request.getParameter("owner");

					Connection conn = DbConnector.getConnection();
					Statement st1 = conn.createStatement();
					Statement st2 = conn.createStatement();
					Statement st3 = conn.createStatement();

					ResultSet rst = st1
							.executeQuery("select * from files where key_= '" + key
									+ "'");

					if (rst.next()) {
						f = rst.getString("name");
					}
					
					int req = st3
							.executeUpdate("insert into request(name,user,filename,owner)values('"
									+ key + "','" + my + "','" + f + "','"+owner+"')");
				%>

				<form name="f" action="result.jsp" method="get"
					onsubmit="return check()">

					<div class="form_settings">
						<p>
							<span>Enter <%=f%> Key :</span><input class="contact" type="text"
								name="key" id="k"/>
						</p>

						<p style="padding-top: 15px">
							<span>&nbsp;</span><input class="submit" type="submit"
								name="contact_submitted" value="Get"/>
						</p>

					</div>
				</form>

			</div>
		</div>
		<div id="footer">
			<p>
				Copyright &copy; Voidmain | <a href="http://www.voidmaintechnologies.com">info</a>
			</p>
		</div>
	</div>
</body>
</html>