<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page errorPage="error.jsp" %>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />

<html>
    

    <head>

    </head>
    <body>
		<h1>테이블지우기 OK</h1>
        <%
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
                                       "root" , "kopote");
			Statement stmt = conn.createStatement();
			
		%>

		<%
			stmt.execute("drop table examtable");		
			stmt.close();
			conn.close();
		%>

    </body>
</html>