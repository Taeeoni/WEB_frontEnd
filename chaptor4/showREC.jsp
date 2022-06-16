<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*" %>
<%@ page errorPage="error.jsp" %>

<meta http-equiv="Content-Type" content="text/html" charset="utf-8" />

<html>
    <head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    </head>
	<style>
	a{
		padding-left : 30px;
	}
	
	td{
		text-align : center;
	}
	
	.oneLine{
		margin-left : 100px;
		display: inline-block;
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
	</script>
	
	<script>
	 $(function (){
		
		$("#submit").click(function () {
			
			if($("[name=kor]").val() < 0 || $("[name=kor]").val() > 100 ){
			alert("점수는 0~100만 가능합니다.")
			return false;
			} 
			if($("[name=eng]").val() < 0 || $("[name=eng]").val() > 100 ){
			alert("점수는 0~100만 가능합니다.")
			return false;
			} 
			if($("[name=mat]").val() < 0 || $("[name=mat]").val() > 100 ){
			alert("점수는 0~100만 가능합니다.")
			return false;
			} 
			
			if($("[name=stu_name]").val().length == 0){
			alert("공백을 입력할 수 없습니다.")
			return false;
			}else if($("[name=stu_name]").val().length > 8) {
				alert("이름은 8자까지만 가능합니다.")
				return false;
			}
			
			var replaceName = /^[가-힣a-zA-Z\s]+$/;
			var x = $("[name=stu_name]").val();
			if (x.length > 0) {
				if (!x.match(replaceName)) { // 정규식으로 지정한 한글, 영어와 같지 않다면 false
				   alert("이름은 한글, 영문만 입력 가능합니다.");
					return false;
				} 
			}

			
			if($("[name=kor]").val().length == 0){
			alert("공백을 입력할 수 없습니다.")
			return false;
			}
			if($("[name=eng]").val().length == 0){
			alert("공백을 입력할 수 없습니다.")
			return false;
			}
			if($("[name=mat]").val().length == 0){
			alert("공백을 입력할 수 없습니다.")
			return false;
			}

		});
		
		$("#idsearch").click(function () {
		
			if($("input[name=stu_id]").val().length == 0){
			alert("공백을 입력할 수 없습니다.")
			return false;
			}else if($("input[name=stu_id]").val().length > 8) {
				alert("학번은 8자까지만 가능합니다.")
				return false;
			}

		});
		
		
	});
	
	</script>	


    <body>
	<%
		
		String cID = request.getParameter("stu_id");
		Integer ID = Integer.parseInt(cID);//데이터 받은것을 통해 학번을 받아온다. 

	
		Class.forName("com.mysql.cj.jdbc.Driver");  
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/kopo11",                  
								   "root" , "kopote");
		Statement stmt = conn.createStatement();
		//받아온 학번을 where에 넣고 sql문 작성 
		ResultSet rset = stmt.executeQuery("select * from examtable where studentid=" + ID + ";");
	%>
	
	<h1>성적 조회/수정/삭제</h1>
	</br>
		<form method = "post" action = "showREC.jsp">
		<span>조회할 학번 </span> <input onkeyup='check(this)' onkeydown='check(this)' type="number" name="stu_id" /> 
		<input type = "submit" id = "idsearch" value="조회"/>
		</form>
	</br>
		<table cellspacing = 1 width = 400 border = 1>
		<form method = "post" >
		<%
			if(rset.next()){ // 만약에 rset이 있다면 (학번에 해당하는 학생이 있다면)
			 
			 out.print("<form method = 'post'>"); //그에 해당하는 학생정보를 table에 출력 
			 out.print("<tr><td width = 100>이름</td><td><input onkeyup='check(this)' onkeydown='check(this)' type='search' name='stu_name' value='"  + rset.getString(1) + "'/></td></tr>");
			 out.print("<tr><td width = 100>학번</td><td><input type='number' name='stu_id2' value='"  + rset.getInt(2) + "' readonly/></td></tr>");
			 out.print("<tr><td width = 100>국어</td><td><input type='number' name='kor' value='"  + rset.getInt(3) + "'/></td></tr>");
			 out.print("<tr><td width = 100>영어</td><td><input type='number' name='eng' value='"  + rset.getInt(4) + "'/></td></tr>");
			 out.print("<tr><td width = 100>수학</td><td><input type='number' name='mat' value='"  + rset.getInt(5) + "'/></td></tr>");
			 
			 out.println("</table>");
			 out.print("</br>");
			 // 버튼마다 다른 jsp로 가게하기 위해서 formaction 사용 
			 %>
			<input formaction = 'updateDB.jsp' class = 'oneLine' id = 'submit' type = 'submit' value='수정'/>
			<input  formaction = 'deleteDB.jsp' class = 'oneLine' type = 'submit' value='삭제'/>
			</form>
			<%
			} else { // 학번에 해당하는 학생이 없다면 해당학번 없음 print 
			out.println("<tr>");
			 out.println("<td width = 50>이름</td>");
			 out.println("<td width=100><p align=center>해당학번없음</p></td>");
			 out.println("</tr><tr>");
			 out.println("<td width = 50 >학번</td>");
			 out.println("<td width=100><p align=center></p></td>");
			  out.println("</tr><tr>");
			  out.println("<td width = 50>국어</td>");
			 out.println("<td width=100><p  align=center></p></td>");
			  out.println("</tr><tr>");
			  out.println("<td width = 50>영어</td>");
			 out.println("<td width=100><p  align=center></p></td>");
			  out.println("</tr><tr>");
			  out.println("<td width = 50>수학</td>");
			 out.println("<td width=100><p align=center></p></td>");
			 out.println("</tr>");
			 out.println("</table>");
			}

			rset.close();
			stmt.close();
			conn.close();
		%>




    </body>
</html>