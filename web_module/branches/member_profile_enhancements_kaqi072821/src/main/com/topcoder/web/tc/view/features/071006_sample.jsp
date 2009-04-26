<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
</head>

<body>

	<p>

	Menu ;)<br/>

	<a href="/tc?module=Static&d1=features&d2=071006_result" name="test" >Result page</a><br/>

	</p>


	<form id="testFormId" name="testForm" method="post" action="/tc?module=Static&d1=features&d2=071006_result">

		<table>

			<caption>This is a sample form.</caption>

			<tr>

			<td>Login: </td>

			<td><input type="text" name="login"/> </td>

			</tr>



			<tr>

			<td>Password: </td>

			<td><input type="password" name="password"/> </td>

			</tr>



			<tr>

				<td>Action: </td>

				<td><select id="action" name="action" onchange="alert('Alert message')">

					<option id="-1" selected="selected">Select</option>

					<option id="1">Login</option>

					<option id="2">Change password</option>

					<option id="3">Change name</option>



				</select> </td>

			</tr>

			<tr>

			<td>Check me!</td>

			<td><input type="checkbox" name="checkBox"/> &nbsp;&nbsp;

			</td>

			</tr>

			<tr>

			<td>Alert:</td>

			<td><button type="submit" id="1" name="submitButton" ">Submit</button> </td>

			</tr>



		</table>

	</form>
</body>
</html>