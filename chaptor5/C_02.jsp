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
		
		String name = request.getParameter("key"); // ?key를 통해 받아오는거는 한글화 작업 안해줘도 되는모양... utf-8 작업 필요없었다. 
		// 받아온 후보 이름을 통해 후보의 기호를 불러온다. 
		ResultSet rset = stmt.executeQuery("select id from hubo_table where name = '" + name + "';"); 
		rset.next();
		Integer giho = rset.getInt(1);
		// 기호번호당 투표가 얼마나 되었는지 count 
		rset = stmt.executeQuery("select count(*) from tupyo_table where id =" + giho + ";");
		rset.next();
		Integer giho_votes = rset.getInt(1); // 기호당 총 득표 수 
		if(giho_votes == 0){
			giho_votes = 1;
		}	
		// 연령대, 그 연령대가 투표한 수 (count(age)) sql문 
		rset = stmt.executeQuery("select age, count(age) from tupyo_table where id = " + giho + " group by age order by age;"); 
		
	%>
	
	</br>
	<form method = "post" >

		<div>

			<tr><td colspan='2'><input formaction='A_01.jsp' class='blue' type = "submit" value="후보등록"/>
			<input formaction='B_01.jsp' class='blue' type = "submit" value="투표"/>
			<input formaction='C_01.jsp' class='select' type = "submit" value="개표결과"/></td></tr>
			</br></br>
			<%
				out.println("<h3>" + giho + ". " + name +" 득표성향 분석</h3>"); // 아까 데이터 받아온 기호와 이름을 대입 
			%>
			<table>
			
			<%	
				Integer [] age = {0,0,0,0,0,0,0,0,0,0};
				while(rset.next()){
					age[rset.getInt(1)] = rset.getInt(2);
				}
				
				for(Integer i = 1; i < 10; i++){
					
					out.println("<tr><td width=100>" + i * 10 + "대</td>");
					// 바는 이미지크기 width로 통해 조절 => 투표받은 %에 비례하여 크기를 늘려주었다. 
					out.println("<td><p align=left><img src='blu-bar.jpg' width=" + age[i] * 100 / giho_votes * 3 + " height=20>" + age[i] +"(" +  age[i] * 100 / giho_votes +"%)</p></td></tr>");
				}
			%>
			

			</table>

		</div>
	</form>





    </body>
</html>