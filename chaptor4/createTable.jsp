<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page errorPage="error.jsp" %>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />

<html>
    <head>

    </head>
    <body>
		<h1>테이블만들기 OK</h1>
        <%
			//  Connection 연결 -> Statement 명령 -> Resultset 결과값출력 
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
                                       "root" , "kopote");
			Statement stmt = conn.createStatement();
			
		%>

		<%
			stmt.execute("drop table if exists examtable");
			stmt.execute("create table examtable("
			+ "name varchar(20)," 
			+ "studentid int not null primary key,"
			+ "kor int,"
			+ "eng int,"
			+ "mat int);");
			
			stmt.close();
			conn.close();
		%>

    </body>
</html>