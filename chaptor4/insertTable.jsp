<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page errorPage="error.jsp" %>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />

<html>
    

    <head>

    </head>
    <body>
		<h1>실습 데이터 입력</h1>
        <%
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
			stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('나연', 209901, 95, 100, 95)");
			stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('정연', 209902, 90, 100, 90)");
			stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('모모', 209903, 85, 70, 90)");
			stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('사나', 209904, 95, 100, 65)");
			stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('지효', 209905, 100, 80, 95)");
			stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('미나', 209906, 75, 100, 90)");
			stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('다현', 209907, 95, 90, 75)");
			stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('채영', 209908, 65, 80, 100)");
			stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('쯔위', 209909, 95, 100, 95)");

			
			stmt.close();
			conn.close();
		%>

    </body>
</html>