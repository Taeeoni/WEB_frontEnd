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
			//기호와 이름 정보를 post 
			
			if(request.getParameter("giho") != "" && request.getParameter("hubo_name") != ""){

			String cid = request.getParameter("giho");
			Integer id = Integer.parseInt(cid);
			
			String ckey = request.getParameter("hubo_name");
			String name = new String(ckey.getBytes("8859_1"), "utf-8");
			
			//후보 추가하기 위해서 insert 
			stmt.execute("insert hubo_table values(" + id + ", '" + name + "');");
			
			} else {
					response.sendRedirect("error.jsp");
			}
		%>
	</br>
	<form method = "post" >

		<div>
			<tr><td colspan='2'><input formaction='A_01.jsp' class='select' type = "submit" value="후보등록"/>
			<input formaction='B_01.jsp' class='blue' type = "submit" value="투표"/>
			<input formaction='C_01.jsp' class='blue' type = "submit" value="개표결과"/></td></tr>
			</br></br>
            <h3>후보등록 결과 : 후보가 추가 되었습니다.</h3>
		</div>
	</form>
    </body>
</html>