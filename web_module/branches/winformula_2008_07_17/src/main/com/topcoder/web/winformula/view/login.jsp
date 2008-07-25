<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.winformula.controller.request.Login" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challange :: Powered by TopCoder - Log In</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
    <script type="text/javascript" src="js/scripts.js"></script>
    <script type="text/javascript" src="/js/arena.js"></script>
    <script type="text/javascript">
        function submitEnter(e) {
            var keycode;
            if (window.event) keycode = window.event.keyCode;
            else if (e) keycode = e.which;
            else return true;
            if (keycode == 13) {
                document.frmLogin.submit();
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
                <p>If you are not a TopCoder member and would like to register for the Winning Formula Challenge, you may <a href="http://<%=ApplicationServer.SERVER_NAME%>/reg/" target="_blank">sign up for free</a>. View our <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>/?module=Static&amp;d1=howToCompete">How to Compete</a> page for more information.</p>
                <div class="form-content">
                    <form>
                        <dl>
                            <dt>
                                <label for="username2">Username:</label>
                            </dt>
                            <dd><input name="username2" type="text" id="username2" /></dd>
                        </dl>
                        <dl>
                            <dt>
                                <label for="password2">Password:</label>
                            </dt>
                            <dd><input name="password2" type="password" id="password2" /></dd>
                        </dl>
                        <dl>
                            <dd><input type="checkbox" name="rememberme" id="rememberme" /><label for="rememberme">Remember me</label></dd>
                        </dl>
                        <dl>
                            <dt>&nbsp;</dt>
                            <dd><div class="floatLeft"><a href="#" class="learnButton" title="Log In"><span>Log In</span></a></div></dd>
                        </dl>
                        <dl><dd><a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword">Forgot your username or password?</a></dd></dl>
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
































<%--
<body>

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">

                <jsp:include page="winformulaTop.jsp"/>

                <div class="content" align="right">
                    <div class="contentTexture">
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxFull">

                <h1>Login</h1>

                <div align="center">
                    <div align="left" style="width:500px;">
                        <p><b>Forgot your password?</b><br/>
                            If you cannot remember your password
                            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword" class="bodyText">click
                                here</a>
                            and we can help you restore your account.</p>

                        <br /><br />
                        <strong>New to TopCoder Winformula?</strong><br />
                        <a href="https://<%=ApplicationServer.SERVER_NAME%>/reg/?module=Main&amp;rt=9">Register now</a>. After you complete
                        the
                        registration process,
                        we
                        will send your account activation code via email.
                        <br /><br />

                        <form method="post" name="frmLogin" action="${sessionInfo.secureAbsoluteServletPath}">
                            <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>" />
                            <input type="hidden" name="module" value="Login" />

                            <div align="center">
                                <span class="bigRed"><%= message %></span>
                                <table cellpadding="2" cellspacing="0" border="0">
                                    <tr>
                                        <td class="name" align="right">
                                            Handle:
                                        </td>
                                        <td class="value">
                                            <input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="name" align="right">
                                            Password:
                                        </td>
                                        <td class="value">
                                            <input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="30" size="12" onkeypress="submitEnter(event)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="checkbox" name="<%=Login.REMEMBER_USER%>" />
                                            Remember
                                            Me</td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" align="center">
                                            <input type="image" src="/i/events/winformula/interface/btnLogin.png"/>
                                        </td>
                                    </tr>
                                </table>

                                <br /><br />

                                <script type="text/javascript">
                                    document.frmLogin.<%=Login.USER_NAME%>.focus();
                                </script>

                            </div>
                        </form>
                    </div>
                </div>


                        </div>
                        <div style="clear: both;">&nbsp;</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="tcFoot.jsp"/>

</body>
</html>
--%>