<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
    </head>
    <body>
        <%
		String arr[] = new String[]{"111", "222", "333"}; // arr 배열 생성 , 값 넣어주기
		String str = "abc,efg,hij"; //,가 포함된 string
		String str_arr[] = str.split(","); // split 함수로 나눠서 배열 넣기 
		%>
		
		arr[0] : <%= arr[0] %> <br>
		arr[1] : <%= arr[1] %> <br> 
		arr[2] : <%= arr[2] %> <br> 
		str_arr[0] : <%= str_arr[0] %> <br>
		str_arr[1] : <%= str_arr[1] %> <br>
		str_arr[2] : <%= str_arr[2] %> <br>
		
    </body>
</html>