<%@page import="pack.TrippleDes"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="pack.DbConnector"%>
<%@page import="java.sql.Connection"%>
<%
	String usr = request.getParameter("user");
	String pas = request.getParameter("pass");
	
	Connection con = DbConnector.getConnection();
	Statement st = con.createStatement();
	
	
	ResultSet rs = st
			.executeQuery(" select * from users where userid='" + usr+ "' and pass='"+pas+"'");
	
	if(rs.next()) {
		request.getSession().setAttribute("me",usr);
		response.sendRedirect("userpage.jsp");
	}
    else
    {
    	response.sendRedirect("login.jsp?status=invalid credentials");
    }
	
%>

