<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<%@ taglib uri="screening.tld" prefix="screen" %>
<a name="top"></a>

<!-- Logo Bar Include Begins -->
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" />
<% boolean isHomePage = "true".equals(request.getParameter("isHomePage")); %>
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">
    <tr valign="middle">
        <td class="login" width="99%">&nbsp;</td>
        <td class="login" nowrap>
<% if(!sessionInfo.isAnonymous()) { %>
             <strong>Hello, <jsp:getproperty name="sessionInfo" property="Handle" />.</strong>
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/?module=Logout" class="loginLinks" target="_parent">Logout</a>
<%} %>
            &#160;&#160;|&#160;&#160;<a href="http://<%=ApplicationServer.CORP_SERVER_NAME%>/" class="loginLinks">Corporate Services Home</a>
        </td>
        <td class="login" width="10">&nbsp;</td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr>
        <td width="15"><img src="/i/corp/clear.gif" width="15" height="1" border="0"/></td>
        <td width="206">
<% if (isHomePage) { %>
            <img src="/i/corp/logo_testing.gif" width="206" height="49" border="0" vspace="5"/>
<% } else { %>
            <screen:servletLink target="_top"><img src="/i/corp/logo_testing.gif" width="206" height="49" border="0" vspace="5"/></screen:servletLink>
<%  } %>
        </td>
        <td width="99%"><img src="/i/corp/clear.gif" width="1" height="1" border="0"/></td>
   </tr>
    <tr><td height="3" class="headStripe" colspan="3"><img src="/i/corp/clear.gif" alt="" height="3" alt="" border="0"></td></tr>
</table>

<!-- Menu bar begins here -->
<table width="100%" border="0" cellpadding="3" cellspacing="0">
    <tr valign="top">
        <td class="testTop" width="49%">&#160;</td>
        <td nowrap class="testTop"><screen:servletLink processor="PopulateSession" styleclass="topLink">Create a New Session</screen:servletLink></td>
        <td width="1" class="testTop">&#160;</td>
        <td nowrap class="testTop"><screen:servletLink processor="ProfileList" styleclass="topLink">Test Profiles</screen:servletLink></td>
        <td width="1" class="testTop">&#160;</td>
        <td nowrap class="testTop"><screen:servletLink processor="ProblemList" styleclass="topLink">Problem Sets</screen:servletLink></td>
        <td width="1" class="testTop">&#160;</td>
        <td nowrap class="testTop"><screen:servletLink processor="BuildCandidateList" styleclass="topLink">Candidates</screen:servletLink></td>
        <td class="testTop" width="49%">&#160;</td>
   </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/i/corp/clear.gif" alt="" width="10" height="2" alt="" border="0"></td></tr>
</table>
<!-- Menu bar ends here -->
