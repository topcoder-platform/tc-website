<%--
  - Author: vangavroche, TCSASSEMBLER
  - Version: 1.1 (Release Assembly - TopCoder Password Recovery Revamp v1.0)
  - Copyright (C) 2010 - 2013 TopCoder Inc., All Rights Reserved.
  -
  - Changes in 1.1 (Release Assembly - TopCoder Password Recovery Revamp v1.0 )
  - - Change the entry link of password recovery from /tc?module=RecoverPassword" to /tc?module=FindUser".
  - - Add this code document
  - 
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.truveo.controller.request.Login" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Truveo Developer Challenge :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_truveo"/>
    </jsp:include>

    

    <script type="text/javascript">
        function preloadTabs() {
            var img = new Image();
            img.src = '/i/events/truveo/tabs/registerOn.png';
            img.src = '/i/events/truveo/tabs/submitOn.png';
            img.src = '/i/events/truveo/tabs/apisOn.png';
            img.src = '/i/events/truveo/tabs/discussOn.png';
        }
    </script>
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

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">

                <jsp:include page="truveoTop.jsp"/>

                <div class="content" align="right">
                    <div class="contentTexture">
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxFull">

                <h1>Login</h1>

                <div align="center">
                    <div align="left" style="width:500px;">
                        <p><b>Forgot your password?</b><br/>
                            If you cannot remember your password
                            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=FindUser" class="bodyText">click
                                here</a>
                            and we can help you restore your account.</p>

                        <br /><br />
                        <strong>New to TopCoder Truveo?</strong><br />
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
                                            <input type="image" src="/i/events/truveo/interface/btnLogin.png"/>
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