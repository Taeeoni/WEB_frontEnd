<%@ page contentType="text/html; charset=UTF-8"%>
<%	
	//post방식 받기 
	String password = request.getParameter("userpasswd"); //name=userpasswd 라는 파라미터를 통해 값을 get 
	String ckey2 = request.getParameter("username"); // 한글같은경우 값을 받을때 깨지는것 방지 하기 위해 
	String name = new String(ckey2.getBytes("8859_1"),"utf-8"); 
%>

<html>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
    <head>
		<title> 로그인 </title>
    </head>
    <body>

		이름 : <%= name %><br>
		비밀번호 : <%= password %><br>

    </body>
</html>