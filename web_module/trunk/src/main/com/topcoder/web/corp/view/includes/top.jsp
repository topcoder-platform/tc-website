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
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#333333">    
    <tr valign="middle">
        <td width="100%" align="right" class="globalNav" nowrap="0"> 
            <a href="http://www.topcodersoftware.com" target="_blank" class="globalNav">topcodersoftware.com</a>
    <% if( activeUser.isAnonymous() ) {  // no logged user %>
            &#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=LoginPage" class="globalNav" target="_parent">Login</a>
    <% } else { %>
            &#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Logout" class="globalNav" target="_parent">Logout</a>
    <% } %>

<% if (isHomePage) { %>
            &#160;&#160;|&#160;&#160;<a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=index" target="_parent" class="globalNav">Home</a>
<% } else { %>
            &#160;
<%  } %>
        </td>
        <td width="15" bgcolor="#333333"><img src="/i/clear.gif" width="30" height="1" border="0" /></td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr valign="middle">
        <td width="15"><a name="top"></a><img src="/i/clear.gif" width="15" height="1" border="0" /></td>
        <td width="206">

<% if (isHomePage) { %>
        <a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Static&d1=index" target="_parent"><img src="/i/logo_corp.gif" width="206" height="49" border="0" vspace="10" /></a>
<% } else { %>
        <img src="/i/logo_corp.gif" width="206" height="49" border="0" vspace="10" />
<%  } %>

        </td>
        <td width="20" bgcolor="#000000"><img src="/i/clear.gif" width="1" height="1" border="0" hspace="15" /></td>
        <td width="100%" nowrap="nowrap" align="right" bgcolor="#000000">
<% if( activeUser.isAnonymous() ) { %>
           <table border="0" cellpadding="0" cellspacing="0">
                <tr valign="middle"><form name="frmMiniLogin" method="POST" action="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Login">
                    <td nowrap="nowrap" class="loginText" align="right">User Name:&#160;&#160;</td>
                    <td colspan="2" align="left"><input maxlength="15" size="12" name="<%=Login.KEY_USER_HANDLE%>" type="TEXT" onkeypress="submitEnter(event, document.frmMiniLogin)" /></td>
                </tr>

                <tr valign="middle">
                    <td nowrap="nowrap" class="loginTextBig" align="right">Password:&#160;&#160;</td>
                    <td align="left"><input maxlength="15" size="12" name="<%=Login.KEY_USER_PASS%>" type="Password" onkeypress="submitEnter(event, document.frmMiniLogin)" /></td>
                    <td nowrap="nowrap" class="loginText">&#160;&#160;<a href="javascript:document.frmMiniLogin.submit();" class="loginText">Login&#160;&gt;</a>
                        <input name="<%=Login.KEY_LOGINMODE%>" type="hidden" value="1" /></td></form>
                </tr>
            </table>
        </td>
        <td width="10" bgcolor="#000000"><img src="/i/clear.gif" width="10" height="1" border="0" /></td>
    </tr>
</table>           

<% } else { %>

&#160;

<% } %>
        </td>        
    </tr>             
</table>

<!-- Main Navigation bar begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
      <td background="/i/graybv_lite_bg.gif" bgcolor="#666666"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Registration"><img src="/i/menu_<%=activeUser.isAnonymous()?"reg":"update"%>.gif" width="170" height="21" border="0" /></a></td>
      <td background="/i/graybv_lite_bg.gif" bgcolor="#666666"><a href="#"><img src="/i/menu_screen.gif" width="247" height="21" border="0" /></a></td> 
      <td width="100%" background="/i/graybv_lite_bg.gif" bgcolor="#666666"><img src="/i/clear.gif" width="1" height="21" border="0"/></td>  
   </tr>
</table>
<!-- Main Navigation bar ends -->
