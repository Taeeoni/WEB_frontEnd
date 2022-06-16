<?xml version="1.0" encoding="UTF-8"?>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page import="java.net.*, java.io.*" %>

<%
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
							   "root" , "kopote");
	Statement stmt = conn.createStatement();
	
	String name = request.getParameter("key"); // ?key를 통해 받아오는거는 한글화 작업 안해줘도 되는모양... utf-8 작업 필요없었다. 
	// 받아온 후보 이름을 통해 후보의 기호를 불러온다. 
	String giho = name.substring(0,1);
	ResultSet rset = stmt.executeQuery("select count(*) from tupyo_table where id =" + giho + ";");
	rset.next();
	Integer giho_votes = rset.getInt(1); // 기호당 총 득표 수 
	if(giho_votes == 0){
			giho_votes = 1;
	}
	// 연령대, 그 연령대가 투표한 수 (count(age)) sql문 
	rset = stmt.executeQuery("select age, count(age) from tupyo_table where id = " + giho + " group by age order by age;"); 
	
%>

<%	 
	 out.println("<datas>");
	  out.println("<hubo>"+ name +"</hubo>");
	  Integer [] age = {0,0,0,0,0,0,0,0,0,0};
	  while(rset.next()){
		age[rset.getInt(1)] = rset.getInt(2);
	 }
	for(Integer i = 1; i < 10; i++){
	  out.println("<data>");
	  
	  out.println("<age>" + i * 10 + "</age>");
	  out.println("<vote>" +  age[i] + "</vote>");
	  out.println("<votePer>" + age[i] * 100 / giho_votes + "</votePer>");

	  out.println("</data>");
	} 
	out.println("</datas>");
	
	rset.close();
	stmt.close();
	conn.close();
	
%>