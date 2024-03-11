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
	
	Cookie c[]=request.getCookies();
	
	String encrypted="";
	
	//c.length gives the cookie count 
	for(int i=0;i<c.length;i++)
	{	
	 	if(c[i].getName().equals("accesskey"))
	 	{
	 		encrypted=c[i].getValue();
	 	}
	}
	
	ResultSet rs = st
			.executeQuery(" select * from regpage where userid='" + usr+ "' and password='"+pas+"'");
	
	String decrypted="";
	String clientkey="";
	
	while(rs.next()) {
		TrippleDes td= new TrippleDes(rs.getString("enckey"));
	    decrypted=td.decrypt(encrypted);
	    clientkey=rs.getString("clientkey");
	}
	
	System.out.println("Decrypted:"+decrypted+"\t client key:"+clientkey);
	
	if(decrypted!=null)
	{
		if(decrypted.equals("")  && clientkey.equals(""))
		{
			response.sendRedirect("userlog.jsp?status=invalid credentials");
		}
		else
		{
			if(decrypted.equals(clientkey))
		    {
				request.getSession().setAttribute("me",usr);
				response.sendRedirect("adminpage.jsp");
		    }
		    else
		    {
		    	response.sendRedirect("userlog.jsp?status=invalid credentials");
		    }
		}
	}
	else
    {
    	response.sendRedirect("userlog.jsp?status=invalid access");
    }
	
%>

