<%@ page import="com.topcoder.web.codinginterface.techassess.Constants"%>
<%@ taglib uri="tc-webtags.tld" prefix="/WEB-INF/tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Technical Assessment</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link type="text/css" rel="stylesheet" href="/css/screening.css"/>
</head>
<body>

<table width=800 align=center cellspacing=0 cellpadding=0 class=bodyTable>
	<tr>
		<td colspan=3>
		<jsp:include page="tabs.jsp" >
		<jsp:param name="tabLev1" value="login"/>
		</jsp:include>
		</td>
	</tr>

	<tr><td colspan=3>&#160;</td></tr>

	<tr>
		<td><img src="/i/corp/screening/bodyTL.gif" /></td>
		<td class=bodyT width="100%">&#160;</td>
		<td><img src="/i/corp/screening/bodyTR.gif" /></td>
	</tr>
	<tr>
		<td class=bodyL>&#160;</td>
		<td class=bodyContent>

        <form action="<jsp:getProperty name="sessionInfo" property="SecureAbosoluteServletPath"/>" method=post name=loginForm>
		<table width="400" align=center cellspacing=0 cellpadding=0 class=tableFrame>
			<tr>
				<td class=tableTitle colspan=2>Login</td>
			</tr>
			<tr><td class=tableText colspan=2>&#160;</td></tr>
			<tr>
				<td class=tableText align=right width="40%">Login:</td>
				<td class=tableText width="60%">
				<tc-webtag:textInput name="<%=Constants.HANDLE%>" size="15" maxlength="15"/>
				</td>
			</tr>
			<tr>
				<td class=tableText align=right>Password:</td>
				<td class=tableText>
                <tc-webtag:textInput name="<%=Constants.PASSWORD%>" size="15" maxlength="15"/>
				</td>
			</tr>
			<tr>
				<td class=tableText align=right>
				&#160;
				</td>
				<td class=tableText>
				<img src="/i/corp/screening/buttonGo.gif" border=0 />
				</td>
			</tr>
			<tr><td class=tableText colspan=2>&#160;</td></tr>
		</table>
		</form>


		</td>
		<td class=bodyR>&#160;</td>
	</tr>
	<tr>
		<td><img src="/i/corp/screening/bodyBL.gif" /></td>
		<td class=bodyB>&#160;</td>
		<td><img src="/i/corp/screening/bodyBR.gif" /></td>
	</tr>
</table>

</table>
</body>
</html>

<%--
--%>