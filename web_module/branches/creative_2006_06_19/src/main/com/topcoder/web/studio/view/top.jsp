<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<div class="topBox">
    <div class="logoBox">
        <A href="/"><img src="/i/studio/studio_logo.gif" alt="TopCoder Studio"/></A>
    </div>

    <div class="loginBox" align="center">
        <img src="/i/studio/layout/loginBoxN.gif" alt="" style="display:block;"/>

        <div style="width:250px; background: #E7E5BC;" align="left">
            <div style="padding: 4px 10px 4px 10px;">

                <c:choose>
                    <c:when test="${sessionInfo.anonymous}">
                        <strong>Member Login:</strong><br>

                        <form method="post" name="frmLogin" action="${sessionInfo.secureAbsoluteServletPath}">
                            <input type="hidden" name="module" value="Login">

                            <input name="<%=Login.USER_NAME%>" size="10" maxlength="15" type="text" value=""/>
                            <input name="<%=Login.PASSWORD%>" size="10" maxlength="15" type="password" value=""/>
                            <button onclick="document.frmLogin.submit();return false;">Login</button><br/>
                            <span class="small"><input type="checkbox" id="remember" name="<%=Login.REMEMBER_USER%>"/>Remember me&nbsp;&nbsp;&nbsp;<A href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=PasswordEmail">Forgot
                                your password?</A></span>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <div align="center">
                            Hello, <tc-webtag:studioHandle coderId="${sessionInfo.userId}"/><br>
                            <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?<%=Constants.MODULE_KEY%>=Logout">Logout</A>
                            | <A href="http://<%=ApplicationServer.SERVER_NAME%>/reg/?nrg=false">Update my profile</A>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <img src="/i/studio/layout/loginBoxS.gif" alt="" style="display:block;"/>
    </div>
</div>
