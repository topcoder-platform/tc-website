<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<%
    String section = request.getParameter("section") == null ? "" : request.getParameter("section");
%>

<div class="topBox">
    <div class="logoBox">
        <A href="/"><img src="/i/studio_logo.gif" alt="TopCoder Studio"/></A>
    </div>

    <% if (section.equals("")) {%>
    <div class="loginBox" align="center">
        <img src="/i/layout/loginBoxN.gif" alt="" style="display:block;"/>

        <div style="width:250px; background: #E7E5BC;" align="left">
            <div style="padding: 0px 10px 0px 10px;">

                <c:choose>
                    <c:when test="${sessionInfo.anonymous}">

                        <div style="float:right;" class="small">
                            <A href="https://<%=ApplicationServer.SERVER_NAME%>/reg/">Register now!</A>
                        </div>
                        <strong>Member Login:</strong><br>

                        <%--have to use the constant because this page can be used with multiple servlets --%>
                        <form method="post" name="frmLogin" action="https://<%=ApplicationServer.STUDIO_SERVER_NAME%>">
                            <input type="hidden" name="module" value="Login">
                            <table cellpadding="1" cellspacing="0">
                                <tbody>
                                    <tr>
                                        <td class="small">Handle:</td>
                                        <td class="small" colspan="2">Password:</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input name="<%=Login.USER_NAME%>" size="8" maxlength="15" type="text" value=""/>
                                        </td>
                                        <td>
                                            <input name="<%=Login.PASSWORD%>" size="8" maxlength="15" type="password" value=""/>
                                        </td>
                                        <td>
                                            <input type="image" src="/i/layout/btn_login.gif" onmouseover="this.src='/i/layout/btn_login_on.gif'" onmouseout="this.src='/i/layout/btn_login.gif'">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <span class="small">
                                            <input type="checkbox" id="remember" name="<%=Login.REMEMBER_USER%>"/>Remember me
                                            &nbsp;&nbsp;&nbsp;<A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword">Forgot
                                                your password?</A>
                                            </span>
                                        </td>
                                    </tr>

                                </tbody>
                            </table>
                        </form>

                    </c:when>
                    <c:otherwise>
                        <div align="center">
                            <strong>Hello, <studio:handle coderId="${sessionInfo.userId}"/></strong><br>
                            <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?<%=Constants.MODULE_KEY%>=Logout">Logout</A>
                            | <A href="http://<%=ApplicationServer.SERVER_NAME%>/reg/?nrg=false">Update my profile</A>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <img src="/i/layout/loginBoxS.gif" alt="" style="display:block;"/>
    </div>
    <% } %>
</div>
