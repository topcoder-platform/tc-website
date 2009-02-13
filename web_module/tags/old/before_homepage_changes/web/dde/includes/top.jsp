
<!--Header begins-->
<%
   boolean isHomePage = "true".equals(request.getParameter("isHomePage"));
%>

<a name="top"></a>
<table width="100%" border="0" cellpadding="3" cellspacing="0" class="search">
    <tr valign="middle">
        <td class="login" width="99%">&nbsp;</td>
        <td class="login" nowrap>
            <strong><%= (tcUser == null ? "" : "Hello, <strong>" + tcUser.getRegInfo().getUsername() + "</strong>") %></strong>

<% if (tcUser == null) { %>

    <% if (page_name == "/login.jsp") { %>
            <strong>Login</strong>
    <% } else { %>
            <a href="/login.jsp" class="loginLinks">Login</a>
    <% } %>

    <% if (page_name == "registration.jsp") { %>
            &#160;&#160;|&#160;&#160;<strong>Register</strong>
    <% } else { %>
            &#160;&#160;|&#160;&#160;<a href="/registration/registration.jsp" class="loginLinks">Register</a>
    <% } %>

<% } else { %>
            &#160;&#160;|&#160;&#160;<a href="/login.jsp?a=logout" class="loginLinks">Logout</a>
<% } %>

            &#160;&#160;|&#160;&#160;<a href="http://www.topcoder.com" class="loginLinks">Home</a>
        </td>
        <td class="login" nowrap="nowrap">&nbsp;</td>
    </tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr valign="middle">
        <td width="15"><img src="/images/clear.gif" width="15" height="1" alt="" border="0"></td>
        <td width="206">

<% if (isHomePage) { %>
        <img src="/images/logo.gif" width="206" height="49" border="0" alt="TopCoder" vspace="5">
<% } else { %>
        <a href="http://www.topcoder.com" class="globalNavSmall" target="_parent"><img src="/images/logo.gif" width="206" height="49" border="0" alt="TopCoder" vspace="5"></a>
<%  } %>

        </td>
        <td width="99%" align="right" valign="bottom"><img src="/images/homeBannerHead.gif" alt="Superior Software Through Competition" width="541" height="22" border="0"></td>
        <td width="10"><img src="/images/clear.gif" width="10" height="75" alt="" border="0"></td>
    </tr>
    <tr><td height="4" class="headStripe" colspan="5"><img src="/images/clear.gif" alt="" height="4" alt="" border="0"></td></tr>
</table>
<!-- Header ends -->
