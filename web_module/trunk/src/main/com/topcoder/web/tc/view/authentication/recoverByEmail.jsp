<%--
  - Author: vangavroche, TCSASSEMBLER
  - Version: 1.0 (Release Assembly - TopCoder Password Recovery Revamp v1.0)
  - Copyright (C) 2010 - 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page allows the user to choose primary or second email to recieve token.
--%>
<%@ page contentType="text/html; charset=utf-8" import="com.topcoder.web.tc.Constants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Password Recovery</title>

<jsp:include page="/style.jsp">
	<jsp:param name="key" value="tc_reg" />
</jsp:include>
<jsp:include page="/script.jsp" />
<script type="text/javascript" src="/js/passwordRecovery.js"></script>
<script type="text/javascript">

$(document).ready(function () {
	var emailTypeRadioTable = $('.emailTypeRadioTable')[0];

	$('#frm').submit(function(){
		return validateEmailTypeRadio(emailTypeRadioTable);
	});
	//Bind change event to all input field with the given name.
	$('input[name=<%=Constants.EMAIL_TYPE%>]').change(function(){
		validateEmailTypeRadio(emailTypeRadioTable);
	});
});
</script>

</head>

<body>
	<div align="center" style="padding: 6px 0px 6px;">
		<A href="/"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0" /> </A>
	</div>

	<div align="center">
		<div style="padding: 0px 10px 10px 10px; width: 600px; text-align: center;">

			<table cellspacing="0" cellpadding="0" class="pageTitleTable">
				<tr>
					<td width="100%" class="pageTitle"><img border="0" src="/i/header_registration_w.gif" alt="registration_w" />
					</td>
					<td align=right class="pageSubtitle">&#160;&#160;</td>
				</tr>
			</table>
			<br>
			<form id="frm" method="post" action="/tc">
				<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ResetPassword" /> 
				<input type="hidden" name="<%=Constants.CODER_ID%>" value="${param.cr}" />
				<div align="center">
					<p align="left">
						<strong><c:if test="${not empty ha }">We think your handle is <a href="/tc?module=MemberProfile&cr=${param.cr}">${ha}</a>.</c:if> Choose the email to reset password</strong>
					</p>
					<table width="279" class="emailTypeRadioTable">
						<tbody>
						<tc-webtag:errorIterator id="err" name="<%= Constants.ERROR_INFO %>">
							<tr>
								<td><span class="bigRed"><%=err%></span>
								</td>
							</tr>
						</tc-webtag:errorIterator>
						<tr>
							<td width="144" height="23"><label> <input type="radio" name="<%=Constants.EMAIL_TYPE%>" value=<%=Constants.PRIMARY_EMAIL_TYPE%> >
									primary email </label>
							</td>
						</tr>
						<c:if test="${ not empty param.emc and param.emc gt 1}">
							<tr>
								<td><label> <input type="radio" name="<%=Constants.EMAIL_TYPE%>" value=<%=Constants.SECOND_EMAIL_TYPE%>> second email</label>
								</td>
							</tr>
						</c:if>
						<tr>
							<td><input type="submit" name="submit" value="Submit">
						    <input type="button" name="cancel" value="Cancel"  onclick="history.go(-1);" /></td>
						</tr>
						</tbody>
					</table>
					<p>&nbsp;</p>
				</div>
			</form>

		</div>
	</div>
</body>
</html>
