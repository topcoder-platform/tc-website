<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.csf.Constants" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>

<% if (section.equals("admin")) {%>
<% } else { %>
<% } %>

<div class="top">
    <div class="msLogo">
        <a href="/"><img src="/i/microsoft.png" alt="Microsoft"/></a>
    </div>

    <% if (section.equals("") || section.equals("admin")) {%>
    <c:choose>
        <c:when test="${sessionInfo.anonymous}">
            <div class="topLinkBox" style="padding-right: 0px;">
                <img src="/i/layout/headerBullet.png" alt="bullet"/>&nbsp;<a href="mailto:csf@topcoder.com?subject=CSF%20Help">Help</a>
            </div>
            <div class="topLinkBox">
                <img src="/i/layout/headerBullet.png" alt="bullet"/>&nbsp;<A href="<tc-webtag:linkTracking link="http://www.networkmashups.com/Signup.aspx" refer="csf_site_register_link"/>">Register</A>
            </div>
            <div class="topLinkBox">
                <img src="/i/layout/headerBullet.png" alt="bullet"/>&nbsp;<a href="/?module=Login">Login</a>
            </div>
            <div class="topLinkBox">
                <img src="/i/layout/headerBullet.png" alt="bullet"/>&nbsp;<a href="/">Home</a>
            </div>
        </c:when>
        <c:otherwise>
            <div class="topLinkBox" style="padding-right: 0px;">
                <img src="/i/layout/headerBullet.png" alt="bullet"/>&nbsp;<a href="mailto:csf@topcoder.com?subject=CSF%20Help">Help</a>
            </div>
            <div class="topLinkBox">
                <img src="/i/layout/headerBullet.png" alt="bullet"/>&nbsp;<a href="http://<%=ApplicationServer.CSF_SERVER_NAME%>/?<%=Constants.MODULE_KEY%>=Logout">Logout</a>
            </div>
            <div class="topLinkBox">
                <img src="/i/layout/headerBullet.png" alt="bullet"/>&nbsp;<a href="/">Home</a>
            </div>
            <div class="topLinkBox">
                Hello,
                <csf:handle coderId="${sessionInfo.userId}"/>
            </div>
        </c:otherwise>
    </c:choose>
    <% } %>


    <div class="csfLogo">
        <a href="/"><img src="/i/csf.png" alt="Connected Services Framework Competition Series"/></a>
    </div>
    <A href="<tc-webtag:linkTracking link="http://www.networkmashups.com/" refer="csf_site_sandbox_logo"/>"><img src="/i/sandboxLogo.gif" alt="Connected Services Sandbox"/></A>
</div>