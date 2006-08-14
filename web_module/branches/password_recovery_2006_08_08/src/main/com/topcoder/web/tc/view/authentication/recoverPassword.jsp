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
</table>		  

If you remember your handle, please enter it:

<table cellpadding="0" cellspacing="0" border="0" class="regFields">
	<tr>
      <td colspan="2"><span class="bigRed">
         <tc-webtag:errorIterator id="err" name="<%= FindUser.ERROR_HANDLE %>"><%=err%></tc-webtag:errorIterator></span>
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
</table>

If you don't remember your handle, please enter as much information as posible in order to indentify you:

<table cellpadding="0" cellspacing="0" border="0" class="regFields">
	<tr>
      <td colspan="2"><span class="bigRed">
         <tc-webtag:errorIterator id="err" name="<%= FindUser.ERROR_INFO %>"><%=err%></tc-webtag:errorIterator></span>
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
         <tc-webtag:textInput name="<%=Constants.EMAIL%>" size="30" maxlength="100" onKeyPress="submitEnter(event)"/>
      </td>
   </tr>
   <tr>
      <td class="value">
         &#160;
      </td>
      <td class="value">
         <a href="JavaScript:send()" class="bodyText">Submit</a>
      </td>
   </tr>
</table>
</form>
</div>

   </div>
</div>

</body>
</html>