<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page import="java.net.*, java.io.*,org.w3c.dom.*, org.xml.*" %>
<%@ page import="javax.xml.parsers.*" %>

<html>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
    <head>

    </head>
	<style>
		body {
		  color: #666;
		  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
		}
		table {
		  border-collapse: separate;
		  border-spacing: 0;
		  width: 100%;
		}
		th,
		td {
		  padding: 6px 15px;
		}
		th {
		  background: #42444e;
		  color: #fff;
		  text-align: left;
		}
		tr:first-child th:first-child {
		  border-top-left-radius: 6px;
		}
		tr:first-child th:last-child {
		  border-top-right-radius: 6px;
		}
		td {
		  border-right: 1px solid #c6c9cc;
		  border-bottom: 1px solid #c6c9cc;
		}
		td:first-child {
		  border-left: 1px solid #c6c9cc;
		}
		tr:nth-child(even) td {
		  background: #eaeaed;
		}
		tr:last-child td:first-child {
		  border-bottom-left-radius: 6px;
		}
		tr:last-child td:last-child {
		  border-bottom-right-radius: 6px;
		}
	
	</style>
	<body>
	
	<h1>날씨 조회 - kopo11</h1>
<%
	//xml 파씽을 위한 준비
	DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
	//Document doc = docBuilder.parse(new File("/var/lib/tomcat9/webapps/ROOT/xml/testdata.xml")); //local path
	
	// xml 파일을 불러오는 식인데 parse 안에 xmlmake.jsp 파일을 넣어서 db를 받아 xml로 만들어준다. 
	Document doc = docBuilder.parse("http://www.kma.go.kr/wid/queryDFS.jsp?gridx=61&gridy=123"); // url
	
	Element root = doc.getDocumentElement();
	
	String seq=""; //48시간 중 몇번째 인지 가르킴
	String hour=""; //동네예보 3시간 단위
	String day=""; //1번째날 (0: 오늘/ 1: 내일/ 2: 모레)
	String temp=""; //현재 시간온도
	String tmx=""; //최고 온도 
	String tmn=""; //최저 온도
	String sky=""; //하늘 상태 (1: 맑음, 2:구름조금, 3:구름많음, 4:흐림)
	String pty=""; //강수 상태 (0: 없음, 1: 비, 2: 비/눈 3: 눈/비, 4: 눈)
	String wfKor=""; //날씨 한국어
	String wfEn=""; //날씨 영어
	String pop=""; //강수 확률%
	String r12=""; //12시간 예상 강수량 
	String s12=""; //12시간 예상 적설량
	String ws=""; //풍속 (m/s)
	String wd=""; //풍향 (0~7: 북, 북동, 동, 남동, 남, 남서, 서, 북서)
	String wdKor=""; //풍향 한국어
	String wdEn=""; //풍향 영어
	String reh=""; //습도 %
	String r06=""; //6시간 예상 강수량
	String s06=""; //6시간 예상 적설량
	// 테이블 헤더 작성 
	out.println("<table>");
	out.println("<tr>");
	out.println("<th >seq</th>");
	out.println("<th >time</th>");
	out.println("<th >temp</th>");
	out.println("<th >tmx</th>");
	out.println("<th >tmn</th>");
	out.println("<th >sky</th>");
	out.println("<th >pty</th>");
	out.println("<th >wfKor</th>");
	out.println("<th >wfEn</th>");
	out.println("<th >pop</th>");
	out.println("<th >r12</th>");
	out.println("<th >s12</th>");
	out.println("<th >ws</th>");
	out.println("<th >wd</th>");
	out.println("<th >wdKor</th>");
	out.println("<th >wdEn</th>");
	out.println("<th >reh</th>");
	out.println("<th >r06</th>");
	out.println("<th >s06</th>");
	out.println("</tr>");

	
	//nodelist에다가 xml 의 마크업이름을 통해 값을 대입해준다. 
	//data seq=0 : seq는 attribute값이다 data 태그 하위로 값들이 존재 
	NodeList tag_001 = doc.getElementsByTagName("data"); // xml root 기준으로 data 태그를 찾는다.
	for(int i = 0; i < tag_001.getLength(); i++){
			
		Element elmt = (Element) tag_001.item(i);
		seq=tag_001.item(i).getAttributes().getNamedItem("seq").getNodeValue(); //seq의 값 find
		hour=elmt.getElementsByTagName("hour").item(0).getFirstChild().getNodeValue();
		day=elmt.getElementsByTagName("day").item(0).getFirstChild().getNodeValue();
		temp=elmt.getElementsByTagName("temp").item(0).getFirstChild().getNodeValue();
		tmx=elmt.getElementsByTagName("tmx").item(0).getFirstChild().getNodeValue();
		tmn=elmt.getElementsByTagName("tmn").item(0).getFirstChild().getNodeValue();
		sky=elmt.getElementsByTagName("sky").item(0).getFirstChild().getNodeValue();
		pty=elmt.getElementsByTagName("pty").item(0).getFirstChild().getNodeValue();
		wfKor=elmt.getElementsByTagName("wfKor").item(0).getFirstChild().getNodeValue();
		wfEn=elmt.getElementsByTagName("wfEn").item(0).getFirstChild().getNodeValue();
		pop=elmt.getElementsByTagName("pop").item(0).getFirstChild().getNodeValue();
		r12=elmt.getElementsByTagName("r12").item(0).getFirstChild().getNodeValue();
		s12=elmt.getElementsByTagName("s12").item(0).getFirstChild().getNodeValue();
		ws=elmt.getElementsByTagName("ws").item(0).getFirstChild().getNodeValue();
		wd=elmt.getElementsByTagName("wd").item(0).getFirstChild().getNodeValue();
		wdKor=elmt.getElementsByTagName("wdKor").item(0).getFirstChild().getNodeValue();
		wdEn=elmt.getElementsByTagName("wdEn").item(0).getFirstChild().getNodeValue();
		reh=elmt.getElementsByTagName("reh").item(0).getFirstChild().getNodeValue();
		r06=elmt.getElementsByTagName("r06").item(0).getFirstChild().getNodeValue();
		s06=elmt.getElementsByTagName("s06").item(0).getFirstChild().getNodeValue();
		
		String sday = "";
		if(day.equals("0")){
			sday = "오늘 ";
		} else if(day.equals("1")){
			sday = "내일 ";
		} else if(day.equals("2")){
			sday = "모레 ";
		}
		
		String ssky="";
		if(sky.equals("1")){
			ssky = "sky1.png";
		} else if(sky.equals("2")){
			ssky = "sky2.png";
		} else if(sky.equals("3")){
			ssky = "sky3.png";
		} else if(sky.equals("4")){
			ssky = "sky4.png";
		}
		
		String spty = "";
		if(pty.equals("0")){
			spty = "없음";
		} else if(pty.equals("1")){
			spty = "비";
		} else if(pty.equals("2")){
			spty = "비/눈";
		} else if(pty.equals("3")){
			spty = "눈/비";
		} else if(pty.equals("4")){
			spty = "눈";
		}
		
		String swd = "";
		if(wd.equals("0")){ // 북
			swd = "<img src='wind.png' width=40 style='transform:rotate(0deg)';>";
		} else if(wd.equals("1")){ //북동
			swd = "<img src='wind.png' width=40 style='transform:rotate(45deg)';>";
		} else if(wd.equals("2")){ //동
			swd = "<img src='wind.png' width=40 style='transform:rotate(90deg)';>";
		} else if(wd.equals("3")){ //남동
			swd = "<img src='wind.png' width=40 style='transform:rotate(135deg)';>";
		} else if(wd.equals("4")){ //남
			swd = "<img src='wind.png' width=40 style='transform:rotate(180deg)';>";
		}else if(wd.equals("5")){ //남서
			swd = "<img src='wind.png' width=40 style='transform:rotate(225deg)';>";
		}else if(wd.equals("6")){ //서
			swd = "<img src='wind.png' width=40 style='transform:rotate(270deg)';>";
		}else if(wd.equals("7")){ //북서
			swd = "<img src='wind.png' width=40 style='transform:rotate(315deg)';>";
		}
		
		out.println("<tr>");
		out.println("<td>" + seq + "</td>");
		out.println("<td>" + sday + hour +  "시</td>");
		out.println("<td>" + temp + "</td>");
		out.println("<td>" + tmx + "</td>");
		out.println("<td>" + tmn + "</td>");
		out.println("<td><img src='" + ssky + "' width=40 ></td>"); // 
		out.println("<td>" + spty + "</td>"); // 
		out.println("<td>" + wfKor + "</td>");
		out.println("<td>" + wfEn + "</td>");
		out.println("<td>" + pop + "</td>");
		out.println("<td>" + r12 + "</td>");
		out.println("<td>" + s12 + "</td>");
		out.println("<td>" + ws + "</td>");
		out.println("<td>" + swd + "</td>");
		out.println("<td>" + wdKor + "</td>");
		out.println("<td>" + wdEn + "</td>");
		out.println("<td>" + reh + "</td>");
		out.println("<td>" + r06 + "</td>");
		out.println("<td>" + s06 + "</td>");
		out.println("</tr>");	
	}
	
	
	
	
	out.println("</table>");

%>

	
    </body>
</html>