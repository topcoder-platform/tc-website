<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.request.Login,
                 com.topcoder.web.corp.Constants,
                 com.topcoder.shared.security.User,
                 com.topcoder.web.common.security.SessionPersistor,
                 com.topcoder.web.common.security.BasicAuthentication "
         autoFlush="false" %>
<% BasicAuthentication auth = new BasicAuthentication(new SessionPersistor(request.getSession(true)), request, response);
   User activeUser = auth.getActiveUser();
   boolean isHomePage = "true".equals(request.getParameter("isHomePage"));
%>

<a name="top"/>
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">    
    <tr valign="middle">
        <td class="login" width="99%">&nbsp;</td>
        <td class="login" nowrap="nowrap">
    <% if (activeUser.isAnonymous()) {  // no logged user %>
           <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=LoginPage" class="globalNavSmall" target="_parent">Login</a>
            &#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Registration" class="loginLinks">Register</a>
    <% } else { %>
            <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Logout" class="loginLinks" target="_parent">Logout</a>
            &#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Registration" class="loginLinks">My Account</a>
    <% } %>

            &#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=about&d2=index" class="loginLinks">About TopCoder Corp Services</a>
            &#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=contact&d2=index" class="loginLinks">Contact Us</a>
        </td>
        <td class="login" width="10">&nbsp;</td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr valign="middle">
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0" /></td>
        <td width="206">

<% if (isHomePage) { %>
        <img src="/i/logo_corp.gif" width="206" height="49" border="0" vspace="5" />
<% } else { %>
        <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=corp&d2=index" class="globalNavSmall" target="_parent"><img src="/i/logo_corp.gif" width="206" height="49" border="0" vspace="10" /></a>
<%  } %>

        </td>
        <td width="20"><img src="/i/clear.gif" width="1" height="1" border="0" hspace="15" /></td>
        <td width="100%" nowrap="nowrap" align="right">
<% if( activeUser.isAnonymous() ) { %>
           <table border="0" cellpadding="0" cellspacing="0" align="right">
                <tr valign="middle"><form name="frmMiniLogin" method="POST" action="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Login">
                    <td nowrap="nowrap" class="loginText" align="right">User Name:&#160;&#160;</td>
                    <td colspan="2" align="left"><input maxlength="15" size="12" name="<%=Login.KEY_USER_HANDLE%>" type="TEXT" onkeypress="submitEnter(event, document.frmMiniLogin)" /></td>
                </tr>

                <tr valign="middle">
                    <td nowrap="nowrap" class="loginText" align="right">Password:&#160;&#160;</td>
                    <td align="left"><input maxlength="15" size="12" name="<%=Login.KEY_USER_PASS%>" type="Password" onkeypress="submitEnter(event, document.frmMiniLogin)" /></td>
                    <td nowrap="nowrap" class="loginText">&#160;&#160;<a href="javascript:document.frmMiniLogin.submit();" class="loginText">Login&#160;&gt;</a>
                        <input name="<%=Login.KEY_LOGINMODE%>" type="hidden" value="1" /></td></form>
                </tr>
            </table>
<% } else { %>
            &#160;
<% } %>
        </td>
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
    </tr>
    <tr><td height="4" class="headStripe" colspan="5"><img src="/images/clear.gif" alt="" height="4" border="0" /></td></tr>
</table>
<!-- Header ends -->

<!-- Main Navigation bar begins -->
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="topNavBar">
    <tr valign="middle">
<% if (isHomePage) { %>

<% } else { %>
        <td class="topNav" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<a href="index.jsp" class="topNav">Home</a></td>
<%  } %>
        <td class="topNav" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<a href="/testing/" class="topNav">Testing Application Management Tool</a></td>
        <td class="topNav" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<a href="/tces/?task=MainTask" class="topNav">Recruiting Reporting Tool</a></td>
        <td class="topNav" nowrap="nowrap">&nbsp;&nbsp;&nbsp;<a href="http://www.topcodersoftware.com" class="topNav">TopCoder Software</a></td>
        <td class="topNav" width="99%">&#160;</td>  
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr><td width="100%" height="2" class="nonBreadcrumb"><img src="/images/clear.gif" alt="" width="10" height="2" border="0" /></td></tr>
</table>
<!-- Main Navigation bar ends -->

