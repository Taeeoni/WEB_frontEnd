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
				<h5>투표결과 : 투표하였습니다.</h5>
			</div>

		</div>
	</form>
    </body>
</html>