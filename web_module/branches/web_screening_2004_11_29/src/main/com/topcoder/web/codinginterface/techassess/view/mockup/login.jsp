<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/screening.css"/>
</head>
<body>

<table class=bodyCenter cellspacing=0 cellpadding=0>
	<tr>
		<td align=center>

<%-- TABS --%>
		<jsp:include page="tabs.jsp" >
		<jsp:param name="tabLev1" value="login"/>
		</jsp:include>

		<table cellspacing=0 cellpadding=0 class=bodyTable>
			<tr>
				<td><img src="/i/corp/screening/bodyTL.gif" alt=""/></td>
				<td class=bodyT>&#160;</td>
				<td><img src="/i/corp/screening/bodyTR.gif" alt=""/></td>
			</tr>
			<tr>
				<td class=bodyL>&#160;</td>
<%-- CONTENT --%>
				<td class=bodyContent>
				<p class=pL>
				<span class=bodyBigTitle>Welcome to the Testing Application.</span>
				<br/><br/>
				Please login to the Technical Assessment Tool below.  Your ID and PASSWORD have been emailed to you.		
				<br/><br/>
				</p>

				<table width="400" cellspacing=0 cellpadding=0 class=tableFrame>
					<tr>
						<td class=tableTitle colspan=2>Login</td>
					</tr>
					<tr><td class=tableText colspan=2>&#160;</td></tr>
					<tr>
						<td class=tableText align=right>Login:</td>
						<td class=tableText>
						<INPUT TYPE="TEXT" NAME="ID" SIZE="20" VALUE="">
						</td>
					</tr>
					<tr>
						<td class=tableText align=right>Password:</td>
						<td class=tableText>
						<INPUT TYPE="PASSWORD" NAME="password" SIZE="20" VALUE="">
						</td>
					</tr>
					<tr>
						<td class=tableText align=right>&#160;</td>
						<td class=tableText><A href="/mockup/directions.jsp"><img src="/i/corp/screening/buttonGo.gif" alt=""/></A></td>
					</tr>
					<tr><td class=tableText colspan=2>&#160;</td></tr>
				</table>
							
				</td>
				<td class=bodyR>&#160;</td>
			</tr>
			<tr>
				<td><img src="/i/corp/screening/bodyBL.gif" alt=""/></td>
				<td class=bodyB>&#160;</td>
				<td><img src="/i/corp/screening/bodyBR.gif" alt=""/></td>
			</tr>
		</table>


		</td>
	</tr>
</table>

</body>
</html>