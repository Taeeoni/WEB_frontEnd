<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page import="java.net.*, java.io.*" %>
<html>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
    <head>

    </head>
    <body>
		<h1><center>JSP Database 실습 1</center></h1>
		<%
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
                                       "root" , "kopote");
			Statement stmt = conn.createStatement();

			ResultSet rset = stmt.executeQuery("select counter from count_table");
			rset.next();
			Integer data = rset.getInt(1) + 1;
			
			out.println("<br><br><p  align='center'> 현재 홈페이지 방문조회수는 [" + Integer.toString(data) + "] 입니다 </p></br>");
			
			stmt.execute("update count_table set counter =" + data + ";");
			
			rset.close();
			stmt.close();
			conn.close();
		%>
    </body>
</html>