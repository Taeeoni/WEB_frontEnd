<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page errorPage="error.jsp" %>
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
		<h1>성적 전체 조회</h1>
		
		
        <%
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
                                       "root" , "kopote");
			Statement stmt = conn.createStatement();
			
		%>
		<table cellspacing = 1 width = 1000 border = 1 >
		<%
			//전체 데이터량을 구하기 위한 로직 
			ResultSet rset = stmt.executeQuery("select count(*) from examtable;"); //총 데이터 몇개인지 세고 
			rset.next();
			Integer lastData_num = rset.getInt(1); // 총 데이터 개수를 변수에 대입 
			
			//페이지 번호 출력 부분 
			Integer pageNum = 1; // 페이지번호 변수 
			Integer fromVal = 0; // from 값을 받을 변수 
			Integer cnt = 10;  // 한 페이지에 몇개를 보여줄 것인가
			String ckey = request.getParameter("cnt");
			if(ckey == null){
				cnt = 10;
			} else{
				cnt = Integer.parseInt(ckey);
			}
			
			String pkey = request.getParameter("from");
			if(pkey != null){
				fromVal = Integer.parseInt(pkey);
				pageNum = (Integer) (fromVal / cnt) + 1; // 페이지번호 = from 값에서 페이지당 데이터 수를 나눠주고 + 1 
			} 
			
			if(pageNum > (Integer) (lastData_num / cnt) + 1){  // 페이지번호 = (총데이터양 / 페이지당 보여주는 데이터 수) + 1
				pageNum = (Integer) (lastData_num / cnt) + 1;
			 }
			
			out.println("<tr><td colspan = 8><b>현재 페이지 : " + pageNum + "</b></td></tr>");
		%>
			<tr>
				<td width=50><p align=center>이름</p></td>
				<td width=50><p align=center>학번</p></td>
				<td width=50><p align=center>국어</p></td>
				<td width=50><p align=center>영어</p></td>
				<td width=50><p align=center>수학</p></td>
				<td width=50><p align=center>총점</p></td>
				<td width=50><p align=center>평균</p></td>
				<td width=50><p align=center>등수</p></td> 
			</tr>
		<%
			Integer lineCount = 1; //몇번째 데이터를 읽었는지 확인 
			Integer fromPT = 0; // 몇번부터 보여줄건가 
			Integer cntPT = 0; // 프린트 된 것 카운트 

			// key값을 받아서 몇번부터 보여줘야하는지 받는다.
			String key = request.getParameter("from");
			if(key != null){
				fromPT = Integer.parseInt(key);
			}
			
			//만약 from 이 데이터량을 초과시에 맨 마지막 페이지로 변경 
			if(fromPT > lastData_num){  // 페이지번호 = (총데이터양 / 페이지당 보여주는 데이터 수) + 1
				fromPT = (Integer) (lastData_num / 10) * 10;
			 }
			 
			rset = stmt.executeQuery("select name, studentid, kor, eng, mat, kor+eng+mat, (kor+eng+mat)/3, f_get_rank(studentid) from examtable;");//stmt로 freewifi DB를 불러와서 rset에다가 넣는다. 
			while (rset.next()) { //rset에 저장된 DB 내용 연속해서 매 줄 출력
			
			 if(lineCount > fromPT){ // fromPT 이상인 것부터 보여주게 하기 위한 if문 
			 out.println("<tr>");
			 out.println("<td width=50><p align=center><a href='oneview.jsp?key=" 
			 + rset.getString(1) + "'>" +rset.getString(1) + "</a></p></td>");
			 out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(2)) + "</p></td>");
			 out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(3)) + "</p></td>");
			 out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(4)) + "</p></td>");
			 out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(5)) + "</p></td>");
			 out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(6)) + "</p></td>");
			 out.println("<td width=50><p align=center>" + rset.getString(7) + "</p></td>");
			 out.println("<td width=50><p align=center>" + Integer.toString(rset.getInt(8)) + "</p></td>");
			 out.println("<tr>");	
				 cntPT++; //한줄 찍힘이 완료되었으므로 프린트 카운트 +1
			 }
			 
			 if(cntPT >= cnt){ // 프린트 라인수가 한페이지에 보여줄 내용에 도달하면 반복문 break
				 break;
			 }	 
			 lineCount++; //번호 + 1
			} 
		
			rset.close();
			stmt.close();
			conn.close();
			
		%>
		
		</table>
		</br>
		<table>
		<tr>
		
		<%

			Boolean notShowBefore = false; // 왼쪽 꺽쇠를 띄울것인가 확인하는 index 
			Boolean notShowAfter = false; // 오른쪽 꺽쇠를 띄울것인가 확인하는 index 
			
			// 페이지번호를 y , fromPT를 x라고 하고 cnt가 10이라한다면
			// x값이 100~199일때는 y값이 11
			// x값이 200~299일때는 y값이 21 ....... 식으로 되어야 한다. 
			// 이 조건을 맞게하면 아래와 같은 식
			Integer number = ((Integer) fromPT / (cnt * 10)) * 10 + 1 ; // 페이지 번호 변수 
			
			
			// fromPT의 값이 페이지나열의 맨 앞이라면 (페이지 1~10부분이라면) 더 이상 이보다 앞의 내용이 없으므로 왼쪽꺽쇠를 사라지게끔 한다.
			if(fromPT < (cnt * 10)){ 
				notShowBefore = true;
			}
			
			if(!notShowBefore){ //왼쪽 꺽쇠를 띄우는 조건이라면 
				out.print("<td width=20><p align=center><a href='jsp-db.jsp?from=" 
				 + (fromPT - (cnt * 10)) + "&cnt=" + cnt + "'>&#60&#60</a></p></td>");// << 를 누를때 페이지의수 * cnt 만큼 뒤로 
				
				out.print("<td width=20><p align=center><a href='jsp-db.jsp?from=" 
				 + (fromPT - cnt) +  "&cnt=" + cnt + "'>&#60</a></p></td>");// <를 누를때 cnt 만큼 뒤로 
			}
			
			for(Integer i = 0; i < 10; i++){ //페이지 번호를 띄우는 반복문 (페이지 10개를 띄울거므로 10번 반복)
			
				String bold = ""; //굵게1
				String bold2 = ""; //굵게2
					
			// Integer 라서 equals 사용 
			if(pageNum.equals(number)){ // 만약 페이지번호와 같다면 number 글씨를 굵게 만든다.
				bold = "<b>";
				bold2 = "</b>";
			}
			 out.print("<td width=20><p align=center><a href='jsp-db.jsp?from=" 
			 + ((number-1) * cnt) + "&cnt=" + cnt + "'>" + bold + number + bold2 + "</a></p></td>"); // 보여지는 번호는 number부터 시작해서 number+9 까지 
			 
			 number++; // 페이지 번호 +1
			 
			 // 앞에서 구한 총 데이터의 수를 가지고 오른쪽 꺽쇠를 보여줄지 말지 결정 
			 // 마지막 페이지의 번호를 구하는 식 
			 if(number > (Integer) ((lastData_num - 1) / cnt) + 1){  // 페이지번호 = (총데이터양 / 페이지당 보여주는 데이터 수) + 1
				notShowAfter = true;
				break; //마지막의 페이지에 도달했으므로 반복문도 break
			 }
			 
			}
			
			if(!notShowAfter){ //오른쪽 꺽쇠를 띄우는 조건이라면 
				out.print("<td width=20><p align=center><a href='jsp-db.jsp?from=" 
				 + (fromPT + cnt) + "&cnt=" + cnt + "'>&#62</a></p></td>"); // >를 누를때 cnt 만큼 앞으로 
				 
				 out.print("<td width=20><p align=center><a href='jsp-db.jsp?from=" 
				 + (fromPT + cnt * 10) + "&cnt=" + cnt + "'>&#62&#62</a></p></td>"); // >>를 누를때 페이지의수 * cnt 만큼 앞으로 
			}
			
		%>
		</tr>
		<table>
    </body>
</html>