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
		display: flex;
		justify-content: space-around;
	}

	div{
		width: 500px;
		border: 3px solid pink;
		border-radius: 8px;
		padding : 10px;
	}

	select{
		padding-left: 10px;
	}

	td{
		align-items: 50px;
	}

	.select{
		border: solid 2px lightblue;
		border-radius: 8px;
		height: 40px;
		background-color: aquamarine;
	}

	</style>
	
    <body>
	
	</br>
	<form method = "post" >

		<div>
			<tr><td colspan='2'><input formaction='A_01_H.jsp' class='blue' type = "submit" value="후보등록"/>
			<input formaction='B_01_H.jsp' class='select' type = "submit" value="투표"/>
			<input formaction='C_01_H.jsp' class='blue' type = "submit" value="개표결과"/></td></tr>
			</br></br>

			
			<div class="gray" style= "width: 400px">
			<select id="name">
				<option value="1">김일돌</option>
				<option value="2">김이돌</option>
			</select>
			
			<select id="age">
				<option value="1">10대</option>
				<option value="2">20대</option>
				<option value="3">30대</option>
				<option value="4">40대</option>
				<option value="5">50대</option>
				<option value="6">60대</option>
				<option value="7">70대</option>
				<option value="8">80대</option>
				<option value="9">90대</option>
			</select>
			<input formaction='B_02_H.jsp' type = "submit" value="투표하기"/></td>
			</div>

		</div>
	</form>
    </body>
</html>