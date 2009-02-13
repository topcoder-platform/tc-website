<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>TopCoder</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_reg"/>
</jsp:include>

<SCRIPT type="text/javascript">
function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
     document.frmPass.submit();
     return false;
    } else return true;
  }
</SCRIPT>

</head>

<body>
<div align="center" style="padding:6px 0px 6px; 0px;">
<A href="/"><img src="/i/registration/tc_logo.gif" alt="TopCoder" border="0" /></A>
</div>
<div align="center">
   <div style="padding: 0px 10px 10px 10px; width: 600px; text-align: left;">

     <jsp:include page="/page_title.jsp">
         <jsp:param name="image" value="registration_w"/>
         <jsp:param name="title" value="&#160;"/>
     </jsp:include>

   <strong>Forgot your password?</strong><br>
   Have you forgotten your password?  Enter the information below. This must be the <strong>same information</strong> you used when you registered. We will immediately email your password to you.
   <br><br>

<form method="post" name="frmPass" action="/tc">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="PasswordEmail"/>

<div align="center">
<table cellpadding="0" cellspacing="0" border="0" class="regFields">
   <tr>
      <td colspan="2"><span class="bigRed">
         <tc-webtag:errorIterator id="err" name="<%=Constants.FIRST_NAME%>"><%=err%></tc-webtag:errorIterator></span>
      </td>
   </tr>
   <tr>
      <td class="name">
         First Name:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.FIRST_NAME%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td colspan="2"><span class="bigRed">
         <tc-webtag:errorIterator id="err" name="<%=Constants.LAST_NAME%>"><%=err%></tc-webtag:errorIterator></span>
      </td>
   </tr>
   <tr>
      <td class="name">
         Last Name:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.LAST_NAME%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td colspan="2"><span class="bigRed">
         <tc-webtag:errorIterator id="err" name="<%=Constants.EMAIL%>"><%=err%></tc-webtag:errorIterator></span>
      </td>
   </tr>
   <tr>
      <td class="name">
         Email Address:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="30" maxlength="100" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="value">
         &#160;
      </td>
      <td class="value">
         <a href="JavaScript:document.frmPass.submit()" class="bodyText">Submit</a>
      </td>
   </tr>
</table>
</form>
</div>

   </div>
</div>

</body>
</html>