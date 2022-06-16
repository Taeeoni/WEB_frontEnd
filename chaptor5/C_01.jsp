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

	.bar{
		border: 1px solid whitesmoke;
		height:10%;
		background-color: cornflowerblue;
		display: inline-block;
		margin-right: 10px;
	}

	a:link {
		color : black;
		text-decoration: none;
	}
	a:visited {
		color : black;
		text-decoration: none;
	}
	a:hover {
		color : red;
		text-decoration: underline;
	}
	a:active {
		color : red;
		text-decoration: none;
	}
	
	img{
		padding-right: 10px;
	}

	</style>
	
    <body>
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
								   "root" , "kopote");
		Statement stmt = conn.createStatement();
		// 전체 투표합을 구하기위해 sql문을 앞서 실행 
		ResultSet rset = stmt.executeQuery("select count(*) from tupyo_table");
		rset.next();
		Integer all_votes = rset.getInt(1); 
		if(all_votes == 0){
			all_votes = 1;
		}	
		// from에 후보테이블 투표테이블을 다 불러와서 합쳐진 sql문을 만들어 주었다. (기호, 후보이름, 투표합) 
		// 0표더라도 count() 에 0이라 띄우기 위해서 left join + on 을 사용하였다. (on은 where과 같은 느낌)
		rset = stmt.executeQuery("select b.id, b.name , count(a.id) from hubo_table as b left join tupyo_table as a on b.id = a.id group by a.id, b.name, b.id;"); 
	%>
	
	</br>
		<div>
			<form method = "post">
			<tr><td colspan='2'><input formaction='A_01.jsp' class='blue' type = "submit" value="후보등록"/>
			<input formaction='B_01.jsp' class='blue' type = "submit" value="투표"/>
			<input formaction='C_01.jsp' class='select' type = "submit" value="개표결과"/></td></tr>
			</form>
			<h3>후보 별 득표율</h3>
			<table>
				<%
					while (rset.next()) { 
						out.println("<tr><td width=100 ><a href ='C_02.jsp?key="+  rset.getString(2) +"'>" + rset.getInt(1) + ". " + rset.getString(2) + "</a></td>");
						// 바는 이미지크기 width로 통해 조절 => 투표받은 %에 비례하여 크기를 늘려주었다. 
						out.println("<td><p align=left><img src='blu-bar.jpg' width=" +  rset.getInt(3) * 100 / all_votes * 3 + " height=20>" + rset.getInt(3) +"(" + rset.getInt(3) * 100 / all_votes +"%)</p></td></tr>");
						
					}	
				%>

			</table>


		</div>

    </body>
</html>