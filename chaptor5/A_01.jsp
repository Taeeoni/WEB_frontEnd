<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page errorPage="error.jsp" %>
<html>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
    <head>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
	}

	div{
		width: 500px;
		border: 3px solid pink;
		border-radius: 8px;
		padding : 10px;
	}

	.select{
		border: solid 2px lightblue;
		border-radius: 8px;
		height: 40px;
		background-color: aquamarine;
	}

	.select2{
		border: solid 2px lightblue;
		border-radius: 8px;
		height: 25px;
		background-color: aquamarine;
	}

	</style>
	
	<script>
	function check(obj){
        //정규식으로 특수문자 판별
        var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
        
        //배열에서 하나씩 값을 비교
        if( regExp.test(obj.value) ){
           //값이 일치하면 문자를 삭제
		   alert("특수문자는 입력할 수 없습니다.")
           obj.value = obj.value.substring( 0 , obj.value.length - 1 ); 
        }
		

      }
	  
	 $(function (){
		
		$("#submit").click(function () {
			var x = $("[name=hubo_name]").val();
			if(x.length == 0){
			alert("공백을 입력할 수 없습니다.")
			return false;
			} else if($("[name=hubo_name]").val().length > 8) {
			alert("이름은 8자까지만 가능합니다.")
			return false;
			}
			var replaceName = /^[가-힣a-zA-Z\s]+$/;
			
			if (x.length > 0) {
				if (!x.match(replaceName)) {
				   alert("이름은 한글, 영문만 입력 가능합니다.");
					return false;
				} 
			}
			
		});
	});
		
	
	</script>
	
    <body>
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
								   "root" , "kopote");
		Statement stmt = conn.createStatement();
		ResultSet rset = stmt.executeQuery("select * from hubo_table order by id;");  // 기호번호, 후보명 테이블 불러온다.
	%>
	
	</br>
		<div>
			<form method='post'>
			<tr><td colspan='2'><input formaction='A_01.jsp' class='select' type = "submit" value="후보등록"/>
			<input formaction='B_01.jsp' class='blue' type = "submit" value="투표"/>
			<input formaction='C_01.jsp' class='blue' type = "submit" value="개표결과"/></td></tr>
			</form>
			</br>
			<table>
			
			<%
				Integer hubo_count = 1;
				while (rset.next()) {
					out.println("<form method='post' action='A_02.jsp'>"); // 각 행마다 form을 씌워주고 그 컬럼의 정보가 A_02에 전달되게끔 한다. 
					out.println("<tr><td width = 150>기호번호 : <input style='width:50px' type='text' name='id' value=" + rset.getInt(1) + " readonly></td>"); // name=에 대한 정보가 파라미터로써 a02로 전달된다. 
					out.println("<td width = 300 colspan='2'>후보명 : <input type='text' name='name' value=" + rset.getString(2) + " readonly></td><td width = 50>");
					out.println("<input class='select2' type = 'submit' value='삭제'/></td></tr>"); //삭제를 누르면 action 의 파일로 inputdata가 전해진다. 
					out.println("</form>");
					if (hubo_count ==  rset.getInt(1)){
						hubo_count ++;
					}
				}	
			%>
			
			<form method='post' action='A_03.jsp'>
			<tr><td width = 150>기호번호 : 
			<% out.println(" <input style='width:50px' type='search' name='giho' value='"+ hubo_count +"' readonly/></td>"); //input value에 마지막 기호 +1을 넣어준다. %>
			<td width = 300 colspan='2'>후보명 : <input onkeyup='check(this)' onkeydown='check(this)' style="width:100px" type="search" name="hubo_name" /></td> 
			<td><input id = "submit" class='select2' type = "submit" value="추가"/></td></tr>
			</form>
			</table>
		</div>

		<%
			rset.close();
			stmt.close();
			conn.close();
		%>
    </body>
</html>




	
	
