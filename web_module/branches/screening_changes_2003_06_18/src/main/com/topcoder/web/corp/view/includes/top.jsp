<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.request.Login,
                 com.topcoder.web.corp.Constants,
                 com.topcoder.shared.security.User,
                 com.topcoder.web.common.security.SessionPersistor,
                 com.topcoder.web.common.security.BasicAuthentication"
         autoFlush="false" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%
   boolean isHomePage = "true".equals(request.getParameter("isHomePage"));
   boolean isTCESPage = "true".equals(request.getParameter("isTCESPage"));
   boolean isSponsorPage = "true".equals(request.getParameter("isSponsorPage"));
%>

<a name="top"></a>
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">
    <tr valign="middle">
        <td class="login" width="99%">&nbsp;</td>
        <td class="login" nowrap>
    <% if (sessionInfo.isAnonymous()) {  // no logged user %>
            <strong>You are not logged in.</strong>
&#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=LoginPage" class="loginLinks" target="_parent">Login</a>
&#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Registration" class="loginLinks">Register</a>
    <% } else { %>
            <strong>Hello, <jsp:getProperty name="sessionInfo" property="Handle" />.</strong>
&#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Logout" class="loginLinks" target="_parent">Logout</a>
&#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Registration" class="loginLinks">Update Profile</a>
    <% } %>

        </td>
        <td class="login" width="10">&nbsp;</td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr valign="middle">
        <td width="15"><img src="/i/clear.gif" width="15" height="1" alt="" border="0"></td>
        <td width="206">

<% if (isHomePage) { %>
        <img src="/i/logo_corp.gif" width="206" height="49" border="0" alt="TopCoder Corporate Services" vspace="5">
<% } else { %>
        <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=index" class="globalNavSmall" target="_parent"><img src="/i/logo_corp.gif" width="206" height="49" border="0" alt="TopCoder Corporate Services" vspace="5"></a>
<%  } %>

        </td>
        <td width="20"><img src="/i/clear.gif" width="1" height="1" alt="" border="0" hspace="15"></td>
        <td width="99%" nowrap align="right">&#160;</td>
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
    </tr>
    <tr><td height="4" class="headStripe" colspan="5"><img src="/i/clear.gif" alt="" height="4" alt="" border="0"></td></tr>
</table>
<!-- Header ends -->

<!-- Main Navigation bar begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="middle">
        <td class="topNav" width="49%">&#160;</td>

<!-- Do not use until new topcoder.com home page launches
<% if (isHomePage) { %>
        <td class="topNavOn" nowrap>Home</td>
<% } else { %>
        <td class="topNav" nowrap><a href="/" class="topLink">Home</a></td>
<%  } %>
 -->

<!-- Member sites -->
        <td class="topNav" nowrap><a href="http://www.topcoder.com" class="topLink">Competition</a></td>
        <td class="topNav" nowrap><a href="http://www.topcoder.com/?t=development&c=index" class="topLink">Development</a></td>
        <td class="topNav" nowrap><a href="http://www.topcoder.com/?t=tces&c=index" class="topLink">Job Listing</a></td>

<!-- Corporate sites -->
        <td class="topNav" nowrap><a href="http://software.topcoder.com" class="topLink">Software</a></td>

<% if (isTCESPage) { %>
        <td class="topNavOn" nowrap><a href="/?module=Static&d1=corp&d2=tces_home" class="topLink">Employment Services</a></td>
<% } else { %>
        <td class="topNav" nowrap><a href="/?module=Static&d1=corp&d2=tces_home" class="topLink">Employment Services</a></td>
<%  } %>

<% if (isSponsorPage) { %>
        <td class="topNavOn" nowrap><a href="/?module=Static&d1=corp&d2=spon_prog&d3=index" class="topLink">Sponsorship</a></td>
<% } else { %>
        <td class="topNav" nowrap><a href="/?module=Static&d1=corp&d2=spon_prog&d3=index" class="topLink">Sponsorship</a></td>
<%  } %>

        <td class="topNav" width="49%">&#160;</td> 
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/i/clear.gif" alt="" width="10" height="2" alt="" border="0"></td></tr>
</table>
<!-- Main Navigation bar ends -->
