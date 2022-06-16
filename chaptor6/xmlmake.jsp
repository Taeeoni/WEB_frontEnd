<?xml version="1.0" encoding="UTF-8"?>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page import="java.net.*, java.io.*" %>

<%
	Class.forName("com.mysql.cj.jdbc.Driver");  
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
							   "root" , "kopote");
	Statement stmt = conn.createStatement();

	ResultSet rset = stmt.executeQuery("select * from examtable");
	 out.println("<datas>");
	while (rset.next()) { 
	  out.println("<data>");
	  
	  out.println("<name>"+ rset.getString(1) +"</name>");
	  out.println("<studentid>" + rset.getInt(2)+"</studentid>");
	  out.println("<kor>" + rset.getInt(3) + "</kor>");
	  out.println("<eng>" + rset.getInt(4) + "</eng>");
	  out.println("<mat>" + rset.getInt(5) + "</mat>");
	  
	  out.println("</data>");
	} 
	out.println("</datas>");
	
	rset.close();
	stmt.close();
	conn.close();
%>
