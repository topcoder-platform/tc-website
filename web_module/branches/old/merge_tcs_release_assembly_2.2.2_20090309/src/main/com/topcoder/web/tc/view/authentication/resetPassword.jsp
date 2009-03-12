<%@ page contentType="text/html; charset=utf-8"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.controller.request.authentication.FindUser,                 
                 com.topcoder.web.tc.controller.request.authentication.ResetPassword,                 
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>

<html>
<head>
<title>Change Password</title>

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
<strong>Password Recovery - Change Password</strong>
<br><br>

<form method="post" name="frmPwd" action="/tc">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="ResetPassword"/>
<input type="hidden" name="<%= ResetPassword.PASSWORD_RECOVERY_ID %>" value='<%= request.getAttribute(ResetPassword.PASSWORD_RECOVERY_ID) %>' />
<input type="hidden" name="<%= ResetPassword.HASH_CODE %>" value='<%= request.getAttribute(ResetPassword.HASH_CODE) %>'/>

<div align="center">
<table cellpadding="0" cellspacing="0" border="0" class="regFields">
   <tc-webtag:errorIterator id="err" name="error">
   <tr>
      <td class="value" colspan="2"><span class="bigRed"><%=err%></span></td>
   </tr>
   </tc-webtag:errorIterator>
<% if (!String.valueOf("true").equals(request.getAttribute(ResetPassword.PASSWORD_EXPIRED))) { %>
   <tr>
      <td class="name">Enter your new password: </td>
      <td class="value"><input type="password" name="<%= ResetPassword.PASSWORD %>"></td>
   </tr>
   <tr>
      <td class="name">Retype new password: </td>
      <td class="value"><input type="password" name="<%= ResetPassword.PASSWORD_VERIF %>"></td>
   </tr>
   <tr>
      <td class="value">&#160;</td>
      <td class="value"><a href="JavaScript:document.frmPwd.submit()" class="bodyText">Submit</a></td>
   </tr>
<% } %>   
</table>
</form>
</div>

</div>
</div>

</body>
</html>