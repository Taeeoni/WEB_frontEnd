<?xml version="1.0" encoding="UTF-8"?>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page import="java.net.*, java.io.*" %>

<%
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
							   "root" , "kopote");
	Statement stmt = conn.createStatement();
	ResultSet rset = stmt.executeQuery("select count(*) from tupyo_table");
	rset.next();
	Integer all_votes = rset.getInt(1); 
	if(all_votes == 0){
			all_votes == 1;
	}
	rset = stmt.executeQuery("select b.id, b.name , count(a.id) from hubo_table as b left join tupyo_table as a on b.id = a.id group by a.id, b.name, b.id;"); 

	 out.println("<datas>");
	while (rset.next()) { 
	  out.println("<data>");
	  
	  out.println("<name>"+ rset.getInt(1)+ ". " + rset.getString(2)+"</name>");
	  out.println("<vote>" +  rset.getInt(3) + "</vote>");
	  out.println("<votePer>" + rset.getInt(3) * 100 / all_votes + "</votePer>");

	  
	  out.println("</data>");
	} 
	out.println("</datas>");
	
	rset.close();
	stmt.close();
	conn.close();
	
%>