<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.tc.controller.request.authentication.Login,
                 com.topcoder.web.tc.controller.request.authentication.FindUser,                 
                 com.topcoder.web.tc.Constants" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>Password Recovery</title>
</head>

<body>
<form method="post" name="frm1" action="/tc">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="FindUser"/>
If you still have access to the email address you used when registering, please enter it here:

<div align="center">

<table cellpadding="0" cellspacing="0" border="0" class="regFields">
   <tr>
      <td colspan="2"><span class="bigRed">
         <tc-webtag:errorIterator id="err" name="<%=FindUser.GOOD_EMAIL%>"><%=err%></tc-webtag:errorIterator></span>
      </td>
   </tr>
   <tr>
      <td class="name">
         E-mail:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.CURRENT_EMAIL%>" size="30" maxlength="30"/>
      </td>
   </tr>
<% if (request.getAttribute(FindUser.NEEDS_HANDLE) != null) { %>
   <tr>
      <td class="name">
         Handle:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <% } %>
   <tr>
      <td class="value">
         &#160;
      </td>
      <td class="value">
         <a href="JavaScript:document.frm1.submit()" class="bodyText">Submit</a>
      </td>
   </tr>
   
</table>
</div>
</form>

<form method="post" name="frm2" action="/tc">
<input type="hidden" name="<%=Constants.MODULE_KEY%>" value="FindUser"/>

If you don't have access any more to the address you used when registering, please provide as much information as possible:

<div align="center">

<table cellpadding="0" cellspacing="0" border="0" class="regFields">
   <tr>
      <td colspan="2"><span class="bigRed">
         <tc-webtag:errorIterator id="err" name="<%=FindUser.LOST_EMAIL%>"><%=err%></tc-webtag:errorIterator></span>
      </td>
   </tr>
   <tr>
      <td class="name">
         Handle:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/>
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
      <td class="name">
         Last Name:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.LAST_NAME%>" size="30" maxlength="30" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="name">
         Email Address:
      </td>
      <td class="value">
         <tc-webtag:textInput name="<%=Constants.REGISTERED_EMAIL%>" size="30" maxlength="100" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="value">
         &#160;
      </td>
      <td class="value">
         <a href="JavaScript:document.frm2.submit()" class="bodyText">Submit</a>
      </td>
   </tr>
</table>
</form>
</div>

   </div>
</div>

</body>
</html>