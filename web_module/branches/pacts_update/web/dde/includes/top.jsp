<%@ page import="com.topcoder.dde.util.ApplicationServer,
                 com.topcoder.dde.user.User" %>

<!--Header begins-->
<%
   boolean isHomePage = "true".equals(request.getParameter("isHomePage"));
%>

<a name="top"></a>
<table width="100%" border=0 cellpadding=0 cellspacing=0>
    <tr>
        <td class=homeTopBar align=right>
            <strong><%= (session.getAttribute("TCUSER")== null ? "" : "Hello, <strong>" + ((User)session.getAttribute("TCUSER")).getRegInfo().getUsername() + "</strong>") %></strong>

<% if (session.getAttribute("TCUSER") == null) { %>

    <% if ("/login.jsp".equals(request.getParameter("page_name"))) { %>
            <strong>Login</strong>
    <% } else { %>
            <a href="/login.jsp" class="loginLinks">Login</a>
    <% } %>

    <% if ("registration.jsp".equals(request.getParameter("page_name"))) { %>
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
