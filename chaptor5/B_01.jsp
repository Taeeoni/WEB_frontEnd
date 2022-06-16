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
		display: flex;
		justify-content: space-around;
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
		ResultSet rset = stmt.executeQuery("select * from hubo_table;"); 
	%>
	
	</br>
	

		<div>
			<form method = "post" >
			<tr><td colspan='2'><input formaction='A_01.jsp' class='blue' type = "submit" value="후보등록"/>
			<input formaction='B_01.jsp' class='select' type = "submit" value="투표"/>
			<input formaction='C_01.jsp' class='blue' type = "submit" value="개표결과"/></td></tr>
			</form></br>

			<form method = "post" action='B_02.jsp' >
				<div class="gray" style= "width: 400px">
				<select name="name">
				<% // select name= 에 대한정보가 submit시에 파라미터로써 활용 
					Integer cnt = 1;
				
					while (rset.next()) { 
						out.println("<option value='"+ rset.getInt(1) +"'>" + rset.getInt(1) + "번 " + rset.getString(2) + "</option>"); //후보들에 대한 정보들을 option에 넣어준다. 
						cnt++;
					}	
				%>
				</select>
				
				<select name="age">
					<option value="1">10대</option>
					<option value="2">20대</option>
					<option value="3">30대</option>
					<option value="4">40대</option>
					<option value="5">50대</option>
					<option value="6">60대</option>
					<option value="7">70대</option>
					<option value="8">80대</option>
					<option value="9">90대</option>
				</select>
				<input type = "submit" value="투표하기"/></td>
			</form>
			</div>

		</div>
	</form>
    </body>
</html>