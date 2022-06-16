<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page errorPage="error.jsp" %>
<html>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
    <head>

    </head>
	<style>
	table, th, td { 
		border: 2px solid gray; 
		border-radius: 8px;
	}

	table { 
		border-collapse: collapse;
		width: 500px;
	}
	
	.blue{
		border: solid 2px lightblue;
		border-radius: 8px;
		height: 40px;
	}
	
	.gray{
		border: 2px solid gray;
	}

	div{
		width: 500px;
		border: 3px solid pink;
		border-radius: 8px;
		padding : 10px;
	}

	select{
		padding-left: 10px;
	}

	td{
		align-items: 50px;
	}

	.select{
		border: solid 2px lightblue;
		border-radius: 8px;
		height: 40px;
		background-color: aquamarine;
	}

	</style>
	
    <body>
		<%
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
                                       "root" , "kopote");
			Statement stmt = conn.createStatement();
			
		%>
	
		<%	
			// data post 통해 받아오기 
			String cid = request.getParameter("name"); //투표한 후보 기호
			String cage = request.getParameter("age"); //연령대 
			Integer id = Integer.parseInt(cid);
			Integer age = Integer.parseInt(cage);
			// 투표테이블에 insert (추가) 해준다.
			stmt.execute("insert tupyo_table values(" + id + ", " + age + ");");
		%>
	
	
	</br>
	<form method = "post" >

		<div>
			<tr><td colspan='2'><input formaction='A_01.jsp' class='blue' type = "submit" value="후보등록"/>
			<input formaction='B_01.jsp' class='select' type = "submit" value="투표"/>
			<input formaction='C_01.jsp' class='blue' type = "submit" value="개표결과"/></td></tr>
			</br></br>

			
			<div class="gray" style= "width: 400px">
				<h5>투표결과 : 투표하였습니다.</h5>
			</div>

		</div>
	</form>
    </body>
</html>