<%--
  - Author: vangavroche, TCSASSEMBLER
  - Version: 1.1 (Release Assembly - TopCoder Password Recovery Revamp v1.0)
  - Copyright (C) 2010 - 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: The entry page of password recovery.
  - 
  - Changes in 1.1 ( Release Assembly - TopCoder Password Recovery Revamp v1.0 )
  - - The change is substantial so that the previous version is nearly all removed.
  - 
--%>
<%@ page contentType="text/html; charset=utf-8" import="com.topcoder.web.tc.Constants"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Password Recovery</title>

<jsp:include page="/style.jsp">
	<jsp:param name="key" value="tc_reg" />
</jsp:include>
<script language="JavaScript" type="text/javascript" src="/js/passwordRecovery.js"></script>
<jsp:include page="/script.jsp" />

<script type="text/javascript">
$(document).ready(function () {

	var q = $('input[name=<%=Constants.FIND_USER_QUERY%>]')[0];
	$('#frm').submit(function(){
		return validateFindUserField(q);
	});

});
</script>
</head>

<body>
<script>
        document.location = "https://www.topcoder.com/reset-password/"
</script>

	<div align="center" style="padding: 6px 0px 6px;">
		<A href="/"><img src="/i/registration/tc-new-logo.png" alt="TopCoder" border="0" /> </A>
	</div>

	<div align="center">
		<div style="padding: 0px 10px 10px 10px; width: 1000px; text-align: left;">

			<table cellspacing="0" cellpadding="0" class="pageTitleTable">
				<tr>
					<td width="100%" class="pageTitle"><img border="0" src="/i/header_registration_w.gif" alt="registration_w" /></td>
					<td align=right class="pageSubtitle">&#160;&#160;</td>
				</tr>
			</table>
			<form method="post" id="frm" action="/tc">
				<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="FindUser" />
				<div align="center">
					<p align="left">
						<strong>Password Recovery</strong>
					</p>
					<table width="918" border="0">
						<tbody>
						<tc-webtag:errorIterator id="err" name="<%= Constants.ERROR_INFO %>">
							<tr>
								<td colspan="2"><span class="bigRed"><%=err%></span>
								</td>
							</tr>
						</tc-webtag:errorIterator>
						<tr>
							<td width="247" height="51">Enter your user name or email:</td>
							<td width="661"><tc-webtag:textInput name="<%= Constants.FIND_USER_QUERY %>" size="<%= Constants.FIND_USER_QUERY_MAX_LENGTH %>" maxlength="<%= Constants.FIND_USER_QUERY_MAX_LENGTH %>"/></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td>
								<input type="submit" name="submit" value="Submit" /> 
							 	<input type="button" name="cancel" value="Cancel"  onclick="history.go(-1);" />
							 </td>
							
						</tr>
						</tbody>
					</table>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
