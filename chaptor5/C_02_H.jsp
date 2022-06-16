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

	.bar{
		border: 1px solid whitesmoke;
		height:10%;
		background-color: cornflowerblue;
		display: inline-block;
		margin-right: 10px;
	}

	a:link {
		color : black;
		text-decoration: none;
	}
	a:visited {
		color : black;
		text-decoration: none;
	}
	a:hover {
		color : red;
		text-decoration: underline;
	}
	a:active {
		color : red;
		text-decoration: none;
	}

	</style>
	
    <body>
	
	</br>
	<form method = "post" >

		<div>
			<tr><td colspan='2'><input formaction='A_01_H.jsp' class='blue' type = "submit" value="후보등록"/>
			<input formaction='B_01_H.jsp' class='blue' type = "submit" value="투표"/>
			<input formaction='C_01_H.jsp' class='select' type = "submit" value="개표결과"/></td></tr>
			</br></br>
			<h3>득표성향 분석</h3>
			<table>
				<tr>
					<td width=100>10대</td>
					<td><div class="bar" style="width:200px"></div>102(10%)</td>
					
				</tr>
				<tr>
					<td>20대</td>
					<td><div class="bar" style="width:40px"></div>102(10%)</td>
					
				</tr>
				<tr>
					<td>30대</td>
					<td><div class="bar" style="width:70px"></div>102(10%)</td>
				</tr>
				<tr>
					<td>40대</td>
					<td><div class="bar" style="width:70px"></div>102(10%)</td>
				</tr>
				<tr>
					<td>50대</td>
					<td><div class="bar" style="width:70px"></div>102(10%)</td>
				</tr>
				<tr>
					<td>60대</td>
					<td><div class="bar" style="width:70px"></div>102(10%)</td>
				</tr>
				<tr>
					<td>70대</td>
					<td><div class="bar" style="width:70px"></div>102(10%)</td>
				</tr>
				<tr>
					<td>80대</td>
					<td><div class="bar" style="width:70px"></div>102(10%)</td>
				</tr>
				<tr>
					<td>90대</td>
					<td><div class="bar" style="width:70px"></div>102(10%)</td>
				</tr>

			</table>


		</div>
	</form>





    </body>
</html>