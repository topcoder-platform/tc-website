<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.request.Login,
                 com.topcoder.web.corp.Constants,
                 com.topcoder.shared.security.User,
                 com.topcoder.web.common.security.SessionPersistor,
                 com.topcoder.web.common.security.BasicAuthentication,
                 com.topcoder.web.corp.model.SessionInfo"
         autoFlush="false" %>
<jsp:usebean id="SessionInfo" class="com.topcoder.web.corp.model.SessionInfo" scope="request" />
<%
   boolean isHomePage = "true".equals(request.getParameter("isHomePage"));
%>

<a name="top"></a>
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">
    <tr valign="middle">
        <td class="login" width="99%">&nbsp;</td>
        <td class="login" nowrap>
    <% if (SessionInfo.isGuest()) {  // no logged user %>
            <strong>You are not logged in.</strong>
&#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=LoginPage" class="loginLinks" target="_parent">Login</a>
&#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Registration" class="loginLinks">Register</a>
    <% } else { %>
            <strong><jsp:getProperty name="SessionInfo" property="Handle" /> is logged in.</strong>
&#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Logout" class="loginLinks" target="_parent">Logout</a>
&#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Registration" class="loginLinks">Update Profile</a>
    <% } %>

&#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=about&d3=index" class="loginLinks">About Corporate Services</a>
&#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=contact&d3=index" class="loginLinks">Contact Us</a>
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
        <td width="100%" nowrap align="right">
<% if( SessionInfo.isGuest() ) { %>
           <table border="0" cellpadding="0" cellspacing="0" align="right">
                <tr valign="middle"><form name="frmMiniLogin" method="POST" action="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Login">
                    <td nowrap class="loginText" align="right">User Name:&#160;&#160;</td>
                    <td colspan="2" align="left"><input maxlength="15" size="12" name="<%=Login.KEY_USER_HANDLE%>" type="TEXT" onkeypress="submitEnter(event, document.frmMiniLogin)"></td>
                </tr>

                <tr valign="middle">
                    <td nowrap class="loginText" align="right">Password:&#160;&#160;</td>
                    <td align="left"><input maxlength="15" size="12" name="<%=Login.KEY_USER_PASS%>" type="Password" onkeypress="submitEnter(event, document.frmMiniLogin)"></td>
                    <td nowrap class="loginText">&#160;&#160;<a href="javascript:document.frmMiniLogin.submit();" class="loginText">Login&#160;&gt;</a>
                        <input name="<%=Login.KEY_LOGINMODE%>" type="hidden" value="1"></td></form>
                </tr>
            </table>
<% } else { %>
            &#160;
<% } %>
        </td>
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
    </tr>
    <tr><td height="4" class="headStripe" colspan="5"><img src="/images/clear.gif" alt="" height="4" alt="" border="0"></td></tr>
</table>
<!-- Header ends -->

<!-- Main Navigation bar begins -->
<table width="100%" border="0" cellpadding="3" cellspacing="0">
    <tr valign="middle">
        <td class="topNav" width="49%">&#160;</td>

<% if (isHomePage) { %>
        <td class="topNavOn" nowrap>&nbsp;&nbsp;Home&nbsp;&nbsp;</td>
<% } else { %>
        <td class="topNav" nowrap>&nbsp;&nbsp;<a href="/" class="topLink">Home</a>&nbsp;&nbsp;</td>
<%  } %>

        <td class="topNav" nowrap>&nbsp;&nbsp;<a href="/testing/" class="topLink">Testing Application Management Tool</a>&nbsp;&nbsp;</td>
        <td class="topNav" nowrap>&nbsp;&nbsp;<a href="/tces/?task=MainTask" class="topLink">Recruiting Reporting Tool</a>&nbsp;&nbsp;</td>
        <td class="topNav" nowrap>&nbsp;&nbsp;<a href="http://www.topcodersoftware.com" class="topLink">TopCoder Software</a>&nbsp;&nbsp;</td>
        <td class="topNav" width="49%">&#160;</td> 
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" alt="" border="0"></td></tr>
</table>
<!-- Main Navigation bar ends -->
