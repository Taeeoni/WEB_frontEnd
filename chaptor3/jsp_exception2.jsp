<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page errorPage= "error.jsp"%>

<html>
    <head>
	<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
    </head>
    <body>
        <%
		String arr[] = new String[]{"111", "222", "333"};

			out.println(arr[4]+"<br>"); // 4는 없으므로 exception으로... 

		%>
		Good...
    </body>
</html>