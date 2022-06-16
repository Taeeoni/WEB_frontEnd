<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page errorPage="error.jsp" %>

<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />

<html>
    <style>
	.yellow{
		background-color : yellow;
	}
	
	</style>

    <head>

    </head>
    <body>
		<h1>조회</h1>
        <%	
			//수정된 이름, 학번, 국영수 에대한걸 post 받아온다 
			String ckey = request.getParameter("stu_name");
			String stu_name = new String(ckey.getBytes("8859_1"), "utf-8");
			
			String cID = request.getParameter("stu_id2");
			String ckor = request.getParameter("kor");
			String ceng = request.getParameter("eng");
			String cmat = request.getParameter("mat");
			
			Integer ID = Integer.parseInt(cID);
			Integer kor = Integer.parseInt(ckor);
			Integer eng = Integer.parseInt(ceng);
			Integer mat = Integer.parseInt(cmat);
			 
			
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
                                       "root" , "kopote");
			Statement stmt = conn.createStatement();
			// 받아온 데이터를 update set 필드에 각각 넣어주어 sql문 실행 
			stmt.execute("delete from examtable where studentid=" + ID +";");

			ResultSet rset = stmt.executeQuery("select * from examtable"); //테이블 전체 
		%>
		<table cellspacing = 1 width = 600 border = 1>
			<tr>
				<td width=50><p align=center>이름</p></td>
				<td width=50><p align=center>학번</p></td>
				<td width=50><p align=center>국어</p></td>
				<td width=50><p align=center>영어</p></td>
				<td width=50><p align=center>수학</p></td>
			</tr>
		<%
			while (rset.next()) { // 테이블 데이터 컬럼 반복 출력 
			  

			 out.println("<tr>");	
			 out.println("<td width=50><p align=center><a href='oneview.jsp?key=" 
			 + rset.getString(1) + "'>" +rset.getString(1) + "</a></p></td>");
			 out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(2)) + "</p></td>");
			 out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(3)) + "</p></td>");
			 out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(4)) + "</p></td>");
			 out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(5)) + "</p></td>");
			 out.println("<tr>");	 
			} 
			rset.close();
			stmt.close();
			conn.close();
			
		%>
		</table>
    </body>
</html>