<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />

<html>
    

    <head>

    </head>
	<style>
		table{
			margin-left:auto; 
			margin-right:auto;
		}
	</style>
	
    <body>

		<table>
		<tr>
		<%
			
			Integer number = 1;
			for(Integer i = 0; i < 10; i++){
				
			 out.print("<td width=20><p align=center><a href='wifi2.jsp?from=" 
			 + (number * 10) + "'>" + number + "</a></p></td>");
			 
			 number++;
			 
			}
		%>
		</tr>
		<table>
		
    </body>
</html>