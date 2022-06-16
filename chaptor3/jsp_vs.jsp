<%@ page contentType="text/html; charset=UTF-8"%>
<html>
  <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
  <head>
	<%! //함수나 변수 선언시 ~ 
      private String call1() {
        String a = "abc";
        String b = "efg";
        return(a+b);// String변수 a 와 b를 합침
      }

      private Integer call2() {
        Integer a = 1;
        Integer b = 2;
        return(a+b);// integer변수 a 와 b를 합침
      }
	%>
  </head>
  <body>
	String연산:<%= call1() %> <br>
	Integer연산:<%= call2() %> <br>
    Good...
  </body>
</html>