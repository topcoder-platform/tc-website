<%@ page import="com.topcoder.dde.util.ApplicationServer" %>

<!--Header begins-->
<%
   boolean isHomePage = "true".equals(request.getParameter("isHomePage"));
%>

<a name="top"></a>
<table width="100%" border=0 cellpadding=0 cellspacing=0>
    <tr>
        <td class=homeTopBar align=right>
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
    </tr>
</table>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
    <tr>
        <td class=homeLogo><a href="http://<%=ApplicationServer.TC_SERVER%>"><img src="/images/logo.gif" width="206" height="49" border="0" alt="TopCoder"></a></td>
    </tr>
</table>
<!-- Header ends -->
