<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.controller.request.Login,
                 com.topcoder.web.corp.Constants,
                 com.topcoder.shared.security.User,
                 com.topcoder.web.common.security.SessionPersistor,
                 com.topcoder.web.common.security.BasicAuthentication,
                 com.topcoder.web.corp.model.SessionInfo,
                 com.topcoder.shared.util.ApplicationServer"
         %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%
   boolean isHomePage = "true".equals(request.getParameter("isHomePage"));
%>

<a name="top"></a>
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">
    <tr valign="middle">
        <td class="login" width="99%">&nbsp;</td>
        <td class="login" nowrap>
    <% if (sessionInfo.isAnonymous()) {  // no logged user %>
            <strong>You are not logged in.</strong>
&#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Static&d1=corp&d2=LoginPage" class="loginLinks" target="_parent">Login</a>
&#160;&#160;|&#160;&#160;<a href="https://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Registration" class="loginLinks">Register</a>
    <% } else { %>
            <strong>Hello, <jsp:getProperty name="sessionInfo" property="Handle" />.</strong>
&#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Logout" class="loginLinks" target="_parent">Logout</a>
&#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Registration" class="loginLinks">Update Profile</a>
    <% } %>

        </td>
        <td class="login" width="10">&nbsp;</td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr valign="middle">
        <td width="15"><img src="/i/corp/clear.gif" width="15" height="1" alt="" border="0"></td>
        <td width="206">

<% if (isHomePage) { %>
        <img src="/i/corp/logo_corp.gif" width="206" height="49" border="0" alt="TopCoder Corporate Services" vspace="5">
<% } else { %>
        <a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/" class="globalNavSmall" target="_parent"><img src="/i/corp/logo_corp.gif" width="206" height="49" border="0" alt="TopCoder Corporate Services" vspace="5"></a>
<%  } %>

        </td>
        <td width="20"><img src="/i/corp/clear.gif" width="1" height="1" alt="" border="0" hspace="15"></td>
        <td width="99%" nowrap align="right">&#160;</td>
        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
    </tr>
    <tr><td height="4" class="headStripe" colspan="5"><img src="/i/corp/clear.gif" alt="" height="4" alt="" border="0"></td></tr>
</table>
<!-- Header ends -->

<!-- Main Navigation bar begins -->
<jsp:include page="../../menu.jsp"/>
<!-- Main Navigation bar ends -->
