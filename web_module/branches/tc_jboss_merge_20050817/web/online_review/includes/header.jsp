<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<!--Header begins-->
<table border="0" cellpadding="3" cellspacing="0" width="100%" class="search">
    <tr valign="middle">
        <td class="login" width="99%">&nbsp;</td>
        <td class="login" nowrap="nowrap">
<logic:present name="user">
            <strong><bean:write name="user" property="handle" /></strong> is logged in.
            &#160;&#160;|&#160;&#160;<html:link page="/logoff.do" styleClass="loginLinks">Logout</html:link>
</logic:present>

<logic:notPresent name="user">
	<% if (request.getRequestURI().indexOf("/login.jsp") >= 0) { %>
            <strong>Login</strong>
    <% } else { %>
            <html:link page="/login.jsp" styleClass="loginLinks">Login</html:link>
    <% } %>

    <% if (request.getRequestURI().indexOf("/registration.jsp") >= 0) { %>
            &#160;&#160;|&#160;&#160;<strong>Register</strong>
    <% } else { %>
            &#160;&#160;|&#160;&#160;<a href="/registration/registration.jsp" class="loginLinks">Register</a>
    <% } %>
</logic:notPresent>

            &#160;&#160;|&#160;&#160;<a href="http://www.topcoder.com" class="loginLinks">Home</a>
        </td>
        <td><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr valign="middle">
        <td width="15"><img src="/images/clear.gif" width="15" height="1" alt="" border="0"></td>
        <td width="206">
        <a href="http://www.topcoder.com" class="globalNavSmall" target="_parent"><img src="/images/logo.gif" width="206" height="49" border="0" alt="TopCoder" vspace="5"></a>
        </td>
        <td width="99%" align="right" valign="bottom"><img src="/images/clear.gif" alt="" width="541" height="22" border="0"></td>
        <td width="10"><img src="/images/clear.gif" width="10" height="75" alt="" border="0"></td>
    </tr>
    <tr><td height="4" class="headStripe" colspan="5"><img src="/images/clear.gif" alt="" height="4" alt="" border="0"></td></tr>
</table>
<!-- Header ends -->
