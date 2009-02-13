<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.winformula.controller.request.Login" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Log In</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
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
</head>

<%
    String nextpage = (String) request.getAttribute(BaseServlet.NEXT_PAGE_KEY);
    String message = (String) request.getAttribute("message");
    if (message == null) message = "";
%>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="nav.jsp">
        <jsp:param name="tabLev1" value="register" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        
        
            <h1>Log In</h1>
                <h2>You must log in using your TopCoder username and password to see this page.</h2>
                <p>If you are not a TopCoder member and would like to register for the Winning Formula Challenge, you may <a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/reg/" target="_blank">sign up for free</a>. View our <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=howToCompete">How to Compete</a> page for more information.</p>
                <div class="form-content">
                    <form method="post" name="frmLogin2" action="${sessionInfo.secureAbsoluteServletPath}" >
                        <input type="hidden" name="module" value="Login" />
                        <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>" />

                         <span class="bigRed"><%= message %></span>

                        <dl>
                            <dt>
                                <label for="username2">Username:</label>
                            </dt>
                            <dd>
                            <input name="<%=Login.USER_NAME%>" maxlength="15" type="text" class="textbox" id="username2" onkeypress="submitEnter2(event)"/>
                            </dd>
                        </dl>
                        <dl>
                            <dt>
                                <label for="password2">Password:</label>
                            </dt>
                            <dd>
                            <input name="<%=Login.PASSWORD%>" maxlength="30" type="password" id="password2" onkeypress="submitEnter2(event)"/>
                            </dd>
                        </dl>
                        <dl>
                            <dd><input type="checkbox" name="rememberme" id="rememberme" /><label for="rememberme">Remember me</label></dd>
                        </dl>
                        <dl>
                            <dt>&nbsp;</dt>
                            <dd><div class="floatLeft"><a href="javascript:document.frmLogin2.submit()" class="learnButton" title="Log In"><span>Log In</span></a></div></dd>
                        </dl>
                        <dl><dd><a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword">Forgot your username or password?</a></dd></dl>
                    </form>
                </div>
        
        <%-- Main Content --%>
        </div>
        <%-- End Container --%>
        </div>

    <div id="footer">
    <%-- Footer --%>
    </div>
    
<%-- End Wrapper --%>
</div>
</body>
</html>
