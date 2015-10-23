<%--
  - Author: vangavroche, TCSASSEMBLER
  - Version: 1.1 (Release Assembly - TopCoder Password Recovery Revamp v1.0)
  - Copyright (C) 2010 - 2013 TopCoder Inc., All Rights Reserved.
  -
  - Description: The password reset page. A confirm token will be sent when the page is load or the user required
  - manually later. The user with matched token can reset his/her password. Client validation is added.
  - 
  - Changes in 1.1 ( Release Assembly - TopCoder Password Recovery Revamp v1.0 )
  - - The change is substantial so that the previous version is nearly all removed.
  - 
--%>
<%@ page contentType="text/html; charset=utf-8"
	import="com.topcoder.web.tc.Constants"%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Change Password</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
	<jsp:param name="key" value="tc_reg" />
</jsp:include>

<%
  String coder_id =  (String)request.getParameter(Constants.CODER_ID);  
  String type = (String)request.getParameter(Constants.EMAIL_TYPE);  
  pageContext.setAttribute("coder_id", coder_id);
  pageContext.setAttribute("type", type);
%>
<script type="text/javascript" src="/js/passwordRecovery.js"></script>

<script type="text/javascript">
$(document).ready(function () {

	$.ajax({
		  type: 'POST',
		  async: false,
		  url: '/tc?<%=Constants.MODULE_KEY%>=SendResetToken',
		  data: {
			<%=Constants.CODER_ID%> : ${coder_id},
			<%=Constants.EMAIL_TYPE%> : '${type}',
		  },
		  success: function(data){
				if(data.successful){
					$('#codeBoard').text('A code has been sent to your ${type} email. You have <%=Constants.RESET_TOKEN_AGE / 60%> minutes to enter the code.');
				}
		  },
		  error: function(jqXHR, textStatus, errorThrown) {
		  	 var resp = $.httpData(jqXHR);
		  	 if (resp.error) {
			  	 $('#codeBoard').css("color","red");
			  	 $('#codeBoard').text(resp.error);
		  	 }
		  }
	});

	var tk = $('input[name=<%=Constants.TOKEN%>]')[0];
	var pwd = $('input[name=<%=Constants.PASSWORD%>]')[0];
	var pwdc = $('input[name=<%=Constants.PASSWORD_CONFIRM%>]')[0];

	$(tk).keyup(function(){
		validateResetPassword(tk, pwd, pwdc);
	});

	$(pwd).keyup(function(){
		validateResetPassword(tk, pwd, pwdc);
	});

	$(pwdc).keyup(function(){
		validateResetPassword(tk, pwd, pwdc);
	});

	$('#frmPwd').submit(function(){
		return validateResetPassword(tk, pwd, pwdc);
	});
});

function validateResetPassword(tk, pwd, pwdc) {
	
	$('.bigRed').remove();

	if( !nonEmptyValidate($(tk).val()) ){
		showError("Please enter the code to continue.", tk);
		return false;
	}
	
	var passwordAlphabet = '<%=com.topcoder.web.reg.Constants.PASSWORD_ALPHABET%>';
	if( !basicPasswordValidate($(pwd).val(), passwordAlphabet) ){
		showError("Your password may contain only letters, numbers and <%=com.topcoder.web.reg.Constants.PUNCTUATION%>", pwd);
		return false;
	}
	
	var min = <%=com.topcoder.web.reg.Constants.MIN_PASSWORD_LENGTH%>;
	var max = <%=com.topcoder.web.reg.Constants.MAX_PASSWORD_LENGTH%>;
	if( !checkPasswordLength($(pwd).val(), min, max ) ){
		showError("The password length should between[ "+min + ", " + max + "]", pwd);
		return false;
	}

	if($(pwdc).val() != $(pwd).val() ){
		showError("Password does not match.", pwdc);
		return false;
	}

	return true;
}
</script>
</head>

<body>
	<div align="center" style="padding: 6px 0px 6px;">
		<A href="/"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0" /> </A>
	</div>
	<div align="center">
		<div style="padding: 0px 10px 10px 10px; width: 1000px; text-align: left;">

			<table cellspacing="0" cellpadding="0" class="pageTitleTable">
				<tr>
					<td width="100%" class="pageTitle"><img border="0" src="/i/header_registration_w.gif" alt="registration_w" />
					</td>
					<td align=right class="pageSubtitle">&#160;&#160;</td>
				</tr>
			</table>
			<strong>Password Recovery - Change Password</strong> <br> <br>


			<form id="frmPwd" method="post" action="/tc">
				<div align="center">
					<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ResetPassword" /> <input type="hidden"
						name="<%=Constants.CODER_ID%>" value="${coder_id}" /> <input type="hidden" name="<%=Constants.EMAIL_TYPE%>" value="${type}" />
					<p id="codeBoard" align="left"></p>
					<table width="910" border="0">
						<tc-webtag:errorIterator id="err" name="<%=Constants.ERROR_INFO %>">
							<tr>
								<td colspan="2"><span class="bigRed"><%=err%></span></td>
							</tr>
						</tc-webtag:errorIterator>
						<tr>
							<td width="140">Enter code</td>
							<td width="760">
								<tc-webtag:textInput name="<%=Constants.TOKEN%>" size="6" maxlength="6" />
							</td>
						</tr>
						<tr>
							<td>New password</td>
							<td><input type="password" name="<%=Constants.PASSWORD%>">
							</td>
						</tr>
						<tr>
							<td>Confirm password</td>
							<td><input type="password" name="<%=Constants.PASSWORD_CONFIRM%>">
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
							<td><input type="submit" name="submit" value="Submit"><input type="button" name="cancel" value="Cancel"  onclick="history.go(-1);" /></td>
						</tr>
					</table>
				</div>
			</form>
		</div>

	</div>
</body>
</html>
