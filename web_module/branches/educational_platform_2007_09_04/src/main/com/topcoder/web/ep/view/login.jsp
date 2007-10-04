<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.reg.controller.request.Login" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder :: Education Platform</title>
    <meta http-equiv="content-type" 
        content="text/html;charset=utf-8" />
    <meta http-equiv="Content-Style-Type" content="text/css" />
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/ep/main.css" />
    <link type="text/css" rel="stylesheet" href="/css/ep/default.css" />
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

<div align="center">
    <!-- widther -->
    <div id="widther">
        <img src="/i/ep/widtherN.png" alt="" style="display:block;" />
        <!-- spacer -->
        <div id="pageFrame">

            <!-- header -->
            <div id="pageHeader">
                <a href="#" id="logo">&nbsp;</a>
                <div class="schoolName">
                    TopCoder College Platform<br />
                    <a href="#">University of TopCoder</a>
                </div>
            </div>

            <div id="pageContent" align="left">
                <img src="/i/ep/contentNW.png" alt="" class="NW" />
                <img src="/i/ep/contentNE.png" alt="" class="NE" />
                <div class="spacer">

                    <div align="center">
                        <div class="window" style="width: 420px;" align="left">
                            <div class="spacer">
                                <h1><span class="bg"><span class="spacer">Log in</span></span></h1>

                                <form method="post" name="frmLogin" action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>">
                                    <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>" />
                                    <input type="hidden" name="module" value="Login" />

                                    <div align="center">
                                        <p class="bigRed"><%= message %></p>
                                        <div align="left" style="width: 240px; margin: 20px 0 2px 0;">
                                            <div style="float: left; width: 80px;"><strong>Username:</strong></div>
                                            <input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="15" size="12" onkeypress="submitEnter(event)" />
                                        </div>
        
                                        <div align="left" style="width: 240px; margin: 0px 0 2px 0;">
                                            <div style="float: left; width: 80px;"><strong>Password:</strong></div>
                                            <input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="30" size="12" onkeypress="submitEnter(event)" />
                                        </div>
    
                                        <div align="left" style="width: 240px; margin: 0px 0 10px 0;">
                                            <div style="float: left; width: 80px;"><strong>&nbsp;</strong></div><input id="remember" name="rem" type="checkbox" />Remember me
                                        </div>
    
                                        <div align="left" style="width: 240px; margin: 0px 0 10px 0;">
                                            <div style="float: left; width: 80px;"><strong>&nbsp;</strong></div><a href="#" onclick="document.frmLogin.submit();return false;" class="bodyText"><img src="/i/ep/buttons/log_in.png" alt="Log in" /></a>
                                        </div>
    
                                        <div style="border: 1px solid #cccccc; background: #eeeeee; padding: 10px;" align="left">
                                            <div style="margin-bottom: 10px;">
                                                <strong>Forgot your password?</strong>
                                                <br />If you cannot remember your password <a href="#">click here</a> and we can help you restore your account.
                                            </div>
    
                                            <div>
                                                <strong>New to TopCoder?</strong>
                                                <br /><a href="#">Register now</a>. After you complete the registration process, we will send your account activation code via email.
                                            </div>
                                        </div>
                                    </div>

                                    <script type="text/javascript">
                                        document.frmLogin.<%=Login.USER_NAME%>.focus();
                                    </script>

                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <img src="/i/ep/contentSW.png" alt="" class="SW" />
                <img src="/i/ep/contentSE.png" alt="" class="SE" />
            </div>

            <!-- footer -->
            <div id="pageFooter">
                <div class="spacer">
                    <a href="#">Home</a>
                    &nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">About CPP</a>
                    &nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Contact Us</a>
                    &nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Privacy</a>
                    &nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">Terms</a>
                </div>
            </div>

        </div>
        <img src="/i/ep/widtherS.png" alt="" style="display:block;" />
    </div>
</div>

</body>
</html>