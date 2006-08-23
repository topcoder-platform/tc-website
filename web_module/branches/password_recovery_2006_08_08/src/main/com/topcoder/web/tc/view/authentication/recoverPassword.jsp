<%@ page contentType="text/html; charset=utf-8"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.controller.request.authentication.FindUser,                 
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css">
<link type="text/css" rel="stylesheet" href="/css/tcReg.css">

<html>
<head>
<title>Password Recovery</title>

<SCRIPT type="text/javascript">
function send() {
	if (!document.frm.<%= FindUser.HAS_MAIL_ACCESS %>[0].checked
	  && !document.frm.<%= FindUser.HAS_MAIL_ACCESS %>[1].checked) {
		alert("Please reply whether you have access or not to your email account.");
		return;
	}
	document.frm.submit();
}
</SCRIPT>


<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_reg"/>
</jsp:include>
</head>

<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
<A href="/"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0" /></A>
</div>
<div align="center">
   <div style="padding: 0px 10px 10px 10px; width: 600px; text-align: left;">

<table cellspacing="0" cellpadding="0" class="pageTitleTable">
    <tr>
        <td width="100%" class="pageTitle"><img border="0" src="/i/header_registration_w.gif" alt="registration_w"/></td>
        <td align=right class="pageSubtitle">&#160;&#160;</td>
    </tr>
</table>

<form method="post" name="frm" action="/tc">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="FindUser"/>
<div align="center">

<table cellpadding="0" cellspacing="0" border="0" class="regFields">
   <tr>
      <td class="name">
		Do you still have access to the account used when registering?
      </td>
      <td class="value">
		<input type="radio" value="true" name="<%= FindUser.HAS_MAIL_ACCESS %>" <%= "true".equals(request.getAttribute(FindUser.HAS_MAIL_ACCESS))? "checked" : "" %> >Yes</input>
		<input type="radio" value="false" name="<%= FindUser.HAS_MAIL_ACCESS %>" <%= "false".equals(request.getAttribute(FindUser.HAS_MAIL_ACCESS))? "checked" : "" %> >No</input>
	  </td>
	</tr>
   <tr>
      <td class="value" colspan="2">If you remember your handle, please enter it:</td>
   </tr>
	<tr>
      <td colspan="2"><span class="bigRed">
         <tc-webtag:errorIterator id="err" name="<%= FindUser.ERROR_HANDLE %>"><%=err%></tc-webtag:errorIterator></span>
      </td>
    </tr>
   <tr>
      <td class="name">Handle:</td>
      <td class="value"><tc-webtag:textInput name="<%=Constants.HANDLE%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/></td>
   </tr>
   <tr>
      <td class="value" colspan="2">If you don't remember your handle, please enter as much information as posible in order to indentify you:</td>
   </tr>
	<tr>
      <td colspan="2"><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%= FindUser.ERROR_INFO %>"><%=err%></tc-webtag:errorIterator></span></td>
   </tr>
   <tr>
      <td class="name">First Name:</td>
      <td class="value"><tc-webtag:textInput name="<%=Constants.FIRST_NAME%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/></td>
   </tr>
   <tr>
      <td class="name">Last Name:</td>
      <td class="value"><tc-webtag:textInput name="<%=Constants.LAST_NAME%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/></td>
   </tr>
   <tr>
      <td class="name">Email Address:</td>
      <td class="value"><tc-webtag:textInput name="<%=Constants.EMAIL%>" size="30" maxlength="100" onKeyPress="submitEnter(event)"/></td>
   </tr>
   <tr>
      <td class="value">&#160;</td>
      <td class="value"><a href="JavaScript:send()" class="bodyText">Submit</a></td>
   </tr>
</table>
</form>
</div>

   </div>
</div>

</body>
</html>