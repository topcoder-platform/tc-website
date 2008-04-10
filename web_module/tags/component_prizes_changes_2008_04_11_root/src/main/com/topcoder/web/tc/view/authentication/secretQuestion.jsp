<%@ page contentType="text/html; charset=utf-8"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.controller.request.authentication.FindUser,                 
                 com.topcoder.web.tc.controller.request.authentication.RecoverEmail,                                  
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_reg"/>
    </jsp:include>

<html>
<head>
<title>Password Recovery</title>

<SCRIPT type="text/javascript">
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
<strong>Password Recovery - Secret Question</strong><br>
Please respond to your secret question as an added measure of security.
<br><br>

<form method="post" name="frm" action="/tc">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="RecoverEmail"/>
<input type="hidden" name="<%= Constants.CODER_ID %>" value='<%= request.getAttribute(Constants.CODER_ID)%>'/>

<div align="center">
<table cellpadding="0" cellspacing="0" border="0" class="regFields">
   <tr>
      <td class="value" colspan="2">
         <span class="bigRed"><tc-webtag:errorIterator id="err" name="error"><%=err%></tc-webtag:errorIterator></span>
      </td>
   </tr>
   <tr>
      <td class="name">Question: </td>
      <td class="value"><%= request.getAttribute(FindUser.SECRET_QUESTION) %></td>
   </tr>
   <tr>
      <td class="name">Your response:</td>
      <td class="value"><tc-webtag:textInput name="<%= RecoverEmail.SECRET_QUESTION_RESPONSE %>" size="30" maxlength="30"/></td>
   </tr>
   <tr>
      <td class="name">Current email address:</td>
      <td class="value"><tc-webtag:textInput name="<%= Constants.EMAIL %>" size="30" maxlength="30"/></td>
   </tr>
   <tr>
      <td class="value" colspan="2">An email will be sent to that address with further instructions <br>to change your password.
   <tr>
      <td class="value">&#160;</td>
      <td class="value"><a href="JavaScript:document.frm.submit()" class="bodyText">Submit</a></td>
   </tr>
</table>

</form>

   </div>
</div>

</body>
</html>