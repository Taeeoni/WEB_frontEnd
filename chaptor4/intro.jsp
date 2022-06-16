<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page import="java.net.*, java.io.*" %>
<html>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
    <head>

    </head>
    <body>
		<h1><center>JSP Database 실습 1</center></h1>
		<%
			String data;
			int cnt = 0;
			FileReader fr = new FileReader("/home/cnt.txt");
			StringBuffer sb = new StringBuffer();
			int ch = 0;
			while((ch = fr.read()) != -1){
					sb.append((char)ch);
			}
			data = sb.toString().trim().replace("\n", "");
			fr.close();
			
			cnt = Integer.parseInt(data);
			cnt++;
			data = Integer.toString(cnt);
			out.println("<br><br> 현재 홈페이지 방문조회수는 [" + data + "] 입니다 </br>");
			
			FileWriter fw = new FileWriter("/home/cnt.txt", false);
			fw.write(data);
			fw.close();
		%>
    </body>
</html>