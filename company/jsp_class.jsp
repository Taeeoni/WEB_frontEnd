<%@ page contentType="text/html; charset=UTF-8"%>
<html>
  <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />

  <head>
    <%! private class AA{ private int Sum(int i, int j){ return i+j; } } AA aa =
    new AA();
  </head>
  <body>
    <% out.println("2+3=" + aa.Sum(2,3)); %> <br />
  </body>
</html>
