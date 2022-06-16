<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />

<html>
    

    <head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
	
	<style>
		table{
			margin-left:auto; 
			margin-right:auto;
		}
		
		h1{
			text-align : center;
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
		
	</style>
	


    <body>
		<h1>wifi</h1>
        <%
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
                                       "root" , "kopote");
			Statement stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select * from freewifi;");
		%>
		<table cellspacing = 1 width = 1000 border = 1 >
			<tr>
				<td width=50><p align=center>번호</p></td>
				<td width=600><p align=center>주소</p></td>
				<td width=50><p align=center>위도</p></td>
				<td width=50><p align=center>경도</p></td>
				<td width=100><p align=center>거리</p></td>
			</tr>
		<%
			Integer lineCount = 1;
			Double lat = 37.3860521;
			Double lng = 127.1214038;
			Integer fromPT = 0; // 몇번부터 보여줄건가 
			Integer cntPT = 0; // 찍힌것 카운트 
			Integer cnt = 10; // 한 페이지에 몇개를 보여줄 것인가 
			
			String key = request.getParameter("from");
			if(key != null){
				fromPT = Integer.parseInt(key);
			}

			while (rset.next()) { 
			
			 if(lineCount > fromPT){
				 out.println("<tr>");
				 out.println("<td width=50><p align=center>" + Integer.toString(lineCount) + "</p></td>");
				 out.println("<td width=600><p align=center>" + rset.getString(10) + "</p></td>");
				 out.println("<td width=50><p align=center>" + Double.toString(rset.getDouble(13)) + "</p></td>");
				 out.println("<td width=50><p align=center>" + Double.toString(rset.getDouble(14)) + "</p></td>");
				 
				 double dist = Math.sqrt( Math.pow(rset.getDouble(13) - lat, 2)
								+ Math.pow(rset.getDouble(14) - lng, 2));
				 
				 out.println("<td width=100><p align=center>" + dist + "</p></td>");
				 out.println("<tr>");
				 cntPT++;
			 }
			 
			 if(cntPT >= cnt){
				 break;
			 }
			 
			 lineCount++;
			 
			} 
			
			rset = stmt.executeQuery("select count(*) from freewifi;");
			rset.next();
			Integer lastData_num = rset.getInt(1); 

			rset.close();
			stmt.close();
			conn.close();	
		%>
		</table>
		</br>
		<table>
		<tr>
		<%

			
			Boolean notShowBefore = false;
			Boolean notShowAfter = false;
			Integer number = ((Integer) fromPT / (cnt * 10)) * 10 + 1 ;
			if(fromPT < (cnt * 10)){
				notShowBefore = true;
			}
			
			if(!notShowBefore){
				out.print("<td width=20><p align=center><a  href='wifi2.jsp?from=" 
				 + (fromPT - (cnt * 10)) + "'>&#60&#60</a></p></td>");
				
				out.print("<td width=20><p align=center><a  href='wifi2.jsp?from=" 
				 + (fromPT - cnt) + "'>&#60</a></p></td>");
			}
			for(Integer i = 0; i < 10; i++){
				
			 out.print("<td width=20><p align=center><a  href='wifi2.jsp?from=" 
			 + ((number-1) * cnt) + "'>" + number + "</a></p></td>");
			 
			 number++;
			 
			 if(number > (Integer) (lastData_num / cnt) + 1){
				notShowAfter = true;
				break; 
			 }
			 
			}
			if(!notShowAfter){
				out.print("<td width=20><p align=center><a  href='wifi2.jsp?from=" 
				 + (fromPT + cnt) + "'>&#62</a></p></td>");
				 
				 out.print("<td width=20><p align=center><a  href='wifi2.jsp?from=" 
				 + (fromPT + cnt * 10) + "'>&#62&#62</a></p></td>");
			}
			
		%>
		</tr>
		<table>
    </body>
</html>