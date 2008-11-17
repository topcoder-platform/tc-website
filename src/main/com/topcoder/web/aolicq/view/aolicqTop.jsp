<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.aolicq.controller.request.Login" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %> 
<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
%>
    <script type="text/javascript">
        function submitEnter2(e) {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
                document.frmLogin2.submit();
                return false;
            } else return true;
        }
    </script>

<div id="inner-container">
            <c:choose>
                <c:when test="${sessionInfo.anonymous}">
                    <div id="login">
                    <%-- Login --%>
                        <form method="post" name="frmLogin2" action="${sessionInfo.secureAbsoluteServletPath}" >
                            <input type="hidden" name="module" id="module" value="Login" />
    <%--                        <a href="javascript:document.frmLogin2.submit()" class="topButton" title="Log In"><span>Log In</span></a> --%>
                            <input name="<%=Login.USER_NAME%>" maxlength="15" type="text" id="username" value="TopCoder Handle" onkeypress="submitEnter2(event)" class="textfield" />
                            <input name="<%=Login.PASSWORD%>" maxlength="30" type="password" id="password" onkeypress="submitEnter2(event)" class="textfield" />
                            <input type="button" class="login-button" name="login" onclick="javascript:document.frmLogin2.submit()" />
                            
                            <p class="login-links"><a href="https://<%=ApplicationServer.SERVER_NAME%>/reg/?module=Main&rt=2">Register</a><br />
                            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword ">Forgot Password</a></p>
                        </form>
                    <%-- End Login --%>
                    </div>
                </c:when>
                <c:otherwise>
                <div id="login">
                    <p class="login-greeting">
                    <%-- User Link --%>
                    <strong>Hello <tc-webtag:handle coderId='${sessionInfo.userId}'/></strong>
                    | <strong><a class="" href="http://<%=ApplicationServer.AOLICQ_SERVER_NAME%>/?module=Logout">Logout</a></strong>
                    </p>
                    <%-- End User Link --%>
                    </div>
                </c:otherwise>
            </c:choose> 
<%--            <form id="login">
                <input name="username" type="text" id="username" />
                <input type="password" name="username" id="password" />
                <input type="button" class="login-button" name="login" />
                <p class="login-links"><a href="https://www.topcoder.com/reg/?module=Main&rt=2">Register</a><br /><a href="http://www.topcoder.com/tc?module=RecoverPassword ">Forgot Password</a></p>
            </form>  --%>
            <h2 class="killerapp">$100,000 Killer App Challenge</h2>
</div>
<div id="contentwrapper">

