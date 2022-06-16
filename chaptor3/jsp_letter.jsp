<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
        <%!
        String str = "abcdfeffasdsd";
        int str_len = str.length(); // str의 길이
        String str_sub = str.substring(5); // str의 앞의 5글자 제외
        int str_loc = str.indexOf("cd"); // str 중 cd의 위치 
        String strL = str.toLowerCase(); // str 을 다 소문자로 
        String strU = str.toUpperCase(); // str 을 다 대문자로 
        %>
    </head>
    <body>
        
        Str : <%=str %> <br>
        str_len: <%= str_len %> <br>
		str_sub: <%= str_sub %> <br>
		str_loc: <%= str_loc %> <br>
		strL: <%= strL %> <br>
		strU: <%=strU%> <br>
		Good...
    </body>
</html>