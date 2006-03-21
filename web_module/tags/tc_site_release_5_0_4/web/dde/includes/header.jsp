<!--Header begins-->
<table border="0" cellpadding="5" cellspacing="0" width="100%" class="search">
    <tr valign="middle">
        <td class="login" width="99%">&nbsp;</td>
        <td class="login" nowrap="nowrap">
            <strong><%= (tcUser == null ? "You are not logged in." : tcUser.getRegInfo().getUsername() + " is logged in.") %></strong>
<% if (tcUser == null) { %>

    <% if (page_name == "/login.jsp") { %>
            &#160;&#160;|&#160;&#160;<strong>Login</strong>
    <% } else { %>
            &#160;&#160;|&#160;&#160;<a href="/login.jsp" class="loginLinks">Login</a>
    <% } %>

    <% if (page_name == "registration.jsp") { %>
            &#160;&#160;|&#160;&#160;<strong>Register</strong>
    <% } else { %>
            &#160;&#160;|&#160;&#160;<a href="/registration/registration.jsp" class="loginLinks">Register</a>
    <% } %>

<% } else { %>
            &#160;&#160;|&#160;&#160;<a href="/login.jsp?a=logout" class="loginLinks">Logout</a>
<% } %>

<% if (page_name == "contact.jsp") { %>
            &#160;&#160;|&#160;&#160;<strong>Contact Us</strong>
<% } else { %>
            &#160;&#160;|&#160;&#160;<a href="contact.jsp" class="loginLinks">Contact Us</a>
<% } %>
            &#160;&#160;|&#160;&#160;
        </td>
        <td class="login" nowrap="nowrap"><%@ include file="/includes/componentSearch.jsp" %></td>
    </tr>
</table>

<table border="0" cellpadding="0" cellspacing="0" width="100%" bgcolor="#000000">
    <tr valign="bottom">
        <td width="219" height="57"><a href="/pages/s_index.jsp"><img src="/images/logoTCSHome.gif" alt="TopCoder Software" width="216" height="57" border="0" /></a></td>
        <td width="99%" class="headRight"><img src="/images/homeBannerHead.gif" alt="Customized Sofware Components for the Enterprise" width="541" height="22" border="0" /></td>
    </tr>

    <tr><td height="4" class="headStripe" colspan="2" class="separator"><img src="/images/clear.gif" alt="" height="4" border="0" /></td></tr>
</table>
<!--Header ends -->
