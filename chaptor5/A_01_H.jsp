<%@ page contentType="text/html; charset=UTF-8"%>
<html>
    <meta http-equiv="Content-Type" content="text/html" charset="utf-8" />
    <head>

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
	
    <body>
	
	</br>
	<form method = "post" >

		<div>
			<tr><td colspan='2'><input formaction='A_01_H.jsp' class='select' type = "submit" value="후보등록"/>
			<input formaction='B_01_H.jsp' class='blue' type = "submit" value="투표"/>
			<input formaction='C_01_H.jsp' class='blue' type = "submit" value="개표결과"/></td></tr>
			</br></br>
			<table>
			<tr><td width = 150>기호번호 : </td>
			<td width = 300 colspan='2'>후보명 : </td><td width = 50>
			<input class='select2' formaction='A_02_H.jsp' type = "submit" value="삭제"/></td></tr>
			
			<tr><td width = 150>기호번호 : <input style="width:50px" type="search" name="giho" /></td>
			<td width = 300 colspan='2'>후보명 : <input style="width:100px" type="search" name="hubo_name" /></td>
			<td><input class='select2' formaction='A_03_H.jsp' type = "submit" value="추가"/></td></tr>
			</table>
		</div>
	</form>
    </body>
</html>