<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*" %>
<%@ page import="java.net.*, java.io.*,org.w3c.dom.*, org.xml.*" %>
<%@ page import="javax.xml.parsers.*" %>
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
	<%
			//xml 파씽을 위한 준비
		DocumentBuilder docBuilder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		//Document doc = docBuilder.parse(new File("/var/lib/tomcat9/webapps/ROOT/xml/testdata.xml")); //local path
		// xml 파일을 불러오는 식인데 parse 안에 xmlmake.jsp 파일을 넣어서 db를 받아 xml로 만들어준다. 
		
		String Key = request.getParameter("key"); // ?key를 통해 받아오는거는 한글화 작업 안해줘도 되는모양... utf-8 작업 필요없었다. 
		Document doc = docBuilder.parse("http://192.168.23.29:8080/chaptor6/ReportOne.jsp?key=" + Key +""); // url
	%>
    <body>

	
	</br>
		<div>
			<form method = "post">
			<tr><td colspan='2'><input formaction='A_01.jsp' class='blue' type = "submit" value="후보등록"/>
			<input formaction='B_01.jsp' class='blue' type = "submit" value="투표"/>
			<input formaction='C_01.jsp' class='select' type = "submit" value="개표결과"/></td></tr>
			</form>
			<table>
				<%
					Element root = doc.getDocumentElement();
					//nodelist에다가 xml 의 마크업이름을 통해 값을 대입해준다. 
					NodeList tag_001 = doc.getElementsByTagName("datas");
					Element elmt = (Element) tag_001.item(0); // elmt에 datas 태그를 박는다.
					
					NodeList tag_hubo = elmt.getElementsByTagName("hubo");
					NodeList tag_age = doc.getElementsByTagName("age");
					NodeList tag_vote = doc.getElementsByTagName("vote");
					NodeList tag_votePer = doc.getElementsByTagName("votePer");
					
					
					out.println("<h3>" + tag_hubo.item(0).getFirstChild().getNodeValue() + " 득표성향분석 </h3>");
					
					
					
					//nodelist의 길이만큼 반복해서 => 전체학생들에 대한 xml을 parsing 해온다. 
					for(int i = 0; i < tag_age.getLength(); i++){
						
						Integer age = Integer.parseInt(tag_age.item(i).getFirstChild().getNodeValue());
						Integer vote = Integer.parseInt(tag_vote.item(i).getFirstChild().getNodeValue());
						Integer votePer = Integer.parseInt(tag_votePer.item(i).getFirstChild().getNodeValue());
						
						//기본으로 가져오는 값들은 String으로 지정되어 있다.
						//name 밑에 여러개가 달려있다면 (child) 그중에 첫번째를 불러오는건데 어차피 현재는 child는 한개뿐이다.
						out.println("<tr>");
						out.println("<td width=100>" + age + "대</td>");
						// 바는 이미지크기 width로 통해 조절 => 투표받은 %에 비례하여 크기를 늘려주었다. 
						out.println("<td><p align=left><img src='blu-bar.jpg' width=" + votePer * 3 + " height=20>" + vote +"(" +  votePer +"%)</p></td>");
						out.println("</tr>");
					
					}
				%>

			</table>


		</div>

    </body>
</html>