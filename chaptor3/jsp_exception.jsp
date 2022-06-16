<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <head>

    </head>
    <body>
        <%
		String arr[] = new String[]{"111", "222", "333"};
		try{
			out.println(arr[4]+"<br>"); // 4는 없으므로 exception으로... 
		} catch(Exception e){
			out.println ("error ==> "+ e + "<=========<br>"); //index error
		}
		%>
		
    </body>
</html>