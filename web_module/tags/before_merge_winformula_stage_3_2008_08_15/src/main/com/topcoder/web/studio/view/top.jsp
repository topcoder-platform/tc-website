<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<%
    String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>

<% if (section.equals("home")) {%>
<!-- logoBox -->
<div id="header_data">
    <div class="logoBox">
        <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>"><img src="/i/v2/studio_logo.png" alt="TopCoder Studio" /></a>
    </div>
</div>
<% } else { %>
<!-- header_data -->
<div id="header_data">
    <c:choose>
        <c:when test="${sessionInfo.anonymous}">
            <div class="loginBox">
                <%--have to use the constant because this page can be used with multiple servlets --%>
                <form method="post" name="frmLogin" action="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>">
                    <input type="hidden" name="module" value="Login" />
                        <table class="login" cellspacing="0" cellpadding="0">
                        <tbody>
                        <tr>
                            <td width="100%">Handle:</td>
                            <td><input name="<%=Login.USER_NAME%>" size="8" maxlength="15" type="text" value=""/></td>
                        </tr>
                        <tr>
                            <td>Password:</td>
                            <td><input name="<%=Login.PASSWORD%>" size="8" maxlength="30" type="password" value=""/></td>
                        </tr>
                        </tbody>
                        </table>
                        <table cellspacing="0" cellpadding="0">
                        <tr>
                            <td><input type="checkbox" id="remember" name="<%=Login.REMEMBER_USER%>"/> Remember me</td>
                            <td class="valueC"><input type="image" src="/i/v2/btn_go.png"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><span><a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/" title="Register">Register</a> | <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword" title="Forgot your password?">Forgot your password?</a></span></td>
                        </tr>
                        </table>
                </form>
            </div>
        </c:when>
        <c:otherwise>
            <div class="loginBox">
                <div class="loggedIn">
                    <div class="handleE">Hello, <studio:handle coderId="${sessionInfo.userId}"/></div>
                    <div class="handleW">&nbsp;</div>
                    <br clear="all"/>
                    <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?<%=Constants.MODULE_KEY%>=Logout">Logout</a>
                    | <a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/?nrg=false">Update my profile</a>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    <!-- logoBox -->
    <div class="logoBox">
        <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>"><img src="/i/v2/studio_logo.png" alt="TopCoder Studio" /></a>
    </div>
</div>
<% } %>
