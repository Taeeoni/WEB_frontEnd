<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>

<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />

<html>

    <head>

    </head>
	<style>		
		td{
			text-align : center;
		}
	</style>
    <body>
		
        <%
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
                                       "root" , "kopote");
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select studentid from examtable order by studentid;");
			Integer id_count = 209901;
			while (rset.next()) {
				
				if (id_count ==  rset.getInt(1)){
					id_count ++;
				}
			}	
		%>

		<% //post 방식으로 데이터 넘겨진걸 받아오는 부분 
			String ckey = request.getParameter("stu_name");
			String stu_name = new String(ckey.getBytes("8859_1"), "utf-8"); //한글을 받을시 utf-8 처리 

			String ckor = request.getParameter("kor");
			String ceng = request.getParameter("eng");
			String cmat = request.getParameter("mat");
			// getparameter 로 받아온거는 string 이므로 int로 변환 
			Integer kor = Integer.parseInt(ckor); 
			Integer eng = Integer.parseInt(ceng);
			Integer mat = Integer.parseInt(cmat);
		%>

		<%//post로 받아온 데이터를 통해서 그에 맞는 데이터를 sql명령을 통해 불러온다. 
			stmt.execute("insert into examtable (name, studentid, kor, eng, mat) values('"
			+ stu_name +"', " + id_count +"," + kor + "," + eng + "," + mat + ")");
			// insert 안의 select 문 서브쿼리임을 알리는 별칭을 붙여줘야 한다고 함 

		%>
		
		<h1>성적입력추가완료</h1>
		<table cellspacing = 1 width = 400 border = 1>
		<%
			rset = stmt.executeQuery("select * from examtable where studentid=" + id_count + ";");	
			
			rset.next();

			 out.println("<tr>");
			 out.println("<td width = 50>이름</td>");
			 out.println("<td width=100><p align=center>" + rset.getString(1) + "</p></td>");
			 out.println("</tr><tr>");
			 out.println("<td width = 50>학번</td>");
			 out.println("<td width=100><p align=center>" + Integer.toString(rset.getInt(2)) + "</p></td>");
			  out.println("</tr><tr>");
			  out.println("<td width = 50>국어</td>");
			 out.println("<td width=100><p align=center>" + Integer.toString(rset.getInt(3)) + "</p></td>");
			  out.println("</tr><tr>");
			  out.println("<td width = 50>영어</td>");
			 out.println("<td width=100><p align=center>" + Integer.toString(rset.getInt(4)) + "</p></td>");
			  out.println("</tr><tr>");
			  out.println("<td width = 50>수학</td>");
			 out.println("<td width=100><p align=center>" + Integer.toString(rset.getInt(5)) + "</p></td>");
			 out.println("</tr>");	 

			rset.close();
			stmt.close();
			conn.close();
		%>
		</table>
    </body>
</html>