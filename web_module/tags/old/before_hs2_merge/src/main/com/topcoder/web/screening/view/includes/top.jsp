<%@ taglib uri="screening.tld" prefix="screen" %>
<a name="top"></a>

<!-- Logo Bar Include Begins -->
<jsp:usebean id="requestInfo" class="com.topcoder.web.screening.model.RequestInfo" />
<% boolean isHomePage = "true".equals(request.getParameter("isHomePage")); %>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr valign="middle">
        <td colspan="3" width="100%" align="right" height="15" class="globalNavSmall"><a name="top"></a>

<% if(requestInfo.isLoggedIn()) { %>
            <screen:servletLink processor="Logout" target="_top" styleclass="globalNavSmall">Logout</screen:servletLink>&#160;&#160;|&#160;&#160;
<%} else {%>
            <screen:servletLink processor="Login" target="_top" styleclass="globalNavSmall">Login</screen:servletLink>&#160;&#160;|&#160;&#160;
<%}%>
            <screen:servletLink target="_top" styleclass="globalNavSmall">Home</screen:servletLink><img src="/i/clear.gif" width="20" height="1" border="0"/>
        </td>
    </tr>
    
    <tr>
        <td width="15" bgcolor="#000000"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
        <td width="206" bgcolor="#000000">
<% if (isHomePage) { %>
            <img src="/i/logo_testing.gif" width="206" height="49" border="0" vspace="13"/>
<% } else { %>
            <screen:servletLink target="_top"><img src="/i/logo_testing.gif" width="206" height="49" border="0" vspace="13"/></screen:servletLink>
<%  } %>
        </td>
        <td width="100%" bgcolor="#000000"><img src="/i/clear.gif" width="1" height="1" border="0"/></td>
   </tr>
</table>

<!-- Menu bar begins here -->
<table width="100%" border="0" cellpadding="3" cellspacing="0">
    <tr valign="top">
        <td width="15" class="testTop">&#160;</td>
        <td nowrap="nowrap" class="testTop"><screen:servletLink processor="PopulateSession" styleclass="testTopNav">Create a New Session</screen:servletLink></td>
        <td width="1" class="testTop">&#160;</td>
        <td nowrap="nowrap" class="testTop"><screen:servletLink processor="ProfileList" styleclass="testTopNav">Test Profiles</screen:servletLink></td>
        <td width="1" class="testTop">&#160;</td>
        <td nowrap="nowrap" class="testTop"><screen:servletLink processor="ProblemList" styleclass="testTopNav">Problem Sets</screen:servletLink></td>
        <td width="1" class="testTop">&#160;</td>
        <td nowrap="nowrap" class="testTop"><screen:servletLink processor="BuildCandidateList" styleclass="testTopNav">Candidates</screen:servletLink></td>
        <td width="100%" class="testTop">&#160;</td>
   </tr>
</table>
<!-- Menu bar ends here -->
