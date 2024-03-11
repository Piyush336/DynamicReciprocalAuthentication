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

					<li ><a  href="adminpage.jsp">Upload</a></li>
					<li ><a  href="download.jsp">Download</a></li>
					<li ><a href="viewreq.jsp">View User Request</a></li>
					<li ><a  href="logout.jsp">Logout</a></li>

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
				
				<table class="imagetable">
					<tr>
						<th>File Name</th>
						<th>Download</th>
					</tr>
				<%
					String f = null;

		
					Connection conn = DbConnector.getConnection();
					Statement st1 = conn.createStatement();

					ResultSet rst = st1
							.executeQuery("select * from files where ownerid= '" + my
									+ "'");

					while(rst.next()) {
				%>
				
				<tr>
						<td><%=rst.getString("filename")%></td>
						<td><a href="result.jsp?key=<%=rst.getString("file_key")%>">download</a></td>

					</tr>

					<%
						}
					%>

				</table>

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