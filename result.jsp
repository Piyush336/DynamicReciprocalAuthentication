<%@page import="java.io.File"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pack.DbConnector"%>

<%
	String r = request.getParameter("key").trim();

	Connection conn = DbConnector.getConnection();
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from files where file_key='"+ r + "'");

	if (rs.next()) {

		String f = rs.getString("filename");

		response.sendRedirect("userdwnld?file=" + f);
	} else {
		
		response.sendRedirect("userpage.jsp?status=invalidkey");

	}
%>