<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page import="java.net.*, java.io.*,org.w3c.dom.*, org.xml.*" %>
<%@ page import="javax.xml.parsers.*" %>
<%
	//xml 파씽을 위한 준비
	DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
	//Document doc = docBuilder.parse(new File("/var/lib/tomcat9/webapps/ROOT/xml/testdata.xml")); //local path
	
	// xml 파일을 불러오는 식인데 parse 안에 xmlmake.jsp 파일을 넣어서 db를 받아 xml로 만들어준다. 
	Document doc = docBuilder.parse("http://192.168.23.29:8080/chaptor6/xmlmake.jsp"); // url
	
	Element root = doc.getDocumentElement();
	//nodelist에다가 xml 의 마크업이름을 통해 값을 대입해준다. 
	NodeList tag_name = doc.getElementsByTagName("name");
	NodeList tag_studentid = doc.getElementsByTagName("studentid");
	NodeList tag_kor = doc.getElementsByTagName("kor");
	NodeList tag_eng = doc.getElementsByTagName("eng");
	NodeList tag_mat = doc.getElementsByTagName("mat");
	
	out.println("<table cellspacing=1 width=500 border=1>");
	out.println("<tr>");
	out.println("<td width=100>이름</td>");
	out.println("<td width=100>학번</td>");
	out.println("<td width=100>국어</td>");
	out.println("<td width=100>영어</td>");
	out.println("<td width=100>수학</td>");
	out.println("</tr>");
	
	out.println("<h1> 성적 조회 </h1>");
	//nodelist의 길이만큼 반복해서 => 전체학생들에 대한 xml을 parsing 해온다. 
	for(int i = 0; i < tag_name.getLength(); i++){
		//기본으로 가져오는 값들은 String으로 지정되어 있다.
		//name 밑에 여러개가 달려있다면 (child) 그중에 첫번째를 불러오는건데 어차피 현재는 child는 한개뿐이다.
		out.println("<tr>");
		out.println("<td width=100>" + tag_name.item(i).getFirstChild().getNodeValue()+ "</td>");
		out.println("<td width=100>" + tag_studentid.item(i).getFirstChild().getNodeValue()+ "</td>");
		out.println("<td width=100>" + tag_kor.item(i).getFirstChild().getNodeValue()+ "</td>");
		out.println("<td width=100>" + tag_eng.item(i).getFirstChild().getNodeValue()+ "</td>");
		out.println("<td width=100>" + tag_mat.item(i).getFirstChild().getNodeValue()+ "</td>");
		
		out.println("</tr>");
	
	}
	out.println("</table>");

%>