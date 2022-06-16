<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />

    <head>
        <%!
        private class AA{ //AA 클래스에는 합을 구하는 함수가 포함 
                private int Sum(int i, int j){
                    return i+j;
                }
        }
        AA aa = new AA(); //AA 클래스를불러와서 aa 인스턴스를 통해 객체사용 
		%>
    </head>
    <body>
	
        <% out.println("2+3=" + aa.Sum(2,3)); %> <br>
		
    </body>
</html>
