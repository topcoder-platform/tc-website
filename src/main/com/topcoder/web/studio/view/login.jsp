<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>
     <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages(); 
            });
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

    $(document).ready(function(){
    
    
        $("#nav ul li").hoverIntent(function(){
            $(this).children("ul").slideDown("fast");
        }, function() {
            $(this).children("ul").slideUp("fast");
        });
        
        $("#nav ul ul li").hover(function() {
            $(this).parents("#nav ul li").children('a').addClass("active-item");
        }, function() {
            $(this).parents("#nav ul li").children('a').removeClass("active-item");
        });
    
    
    });
    </script>
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
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="top.jsp"/>
        <br />
        <!-- container -->
        <div id="container">
            <div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <h1>Login</h1>

                <div align="center">
                    <div align="left" id="tc-login">
                        <p><strong>Forgot your password?</strong><br/>
                            If you cannot remember your password
                            <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=RecoverPassword" class="bodyText">click here</a> and we can help you restore your account.</p>
                        <br />
                        <strong>New to TopCoder Studio?</strong><br />
                        <a href="https://<%=ApplicationServer.SERVER_NAME%>/reg/">Register now</a>. After you complete the registration process, we will send your account activation code via email.
                        <br /><br />

                        <form method="post" name="frmLogin" action="${sessionInfo.servletPath}">
                            <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>">
                            <input type="hidden" name="module" value="Login">

                            <div align="center">
                                <span class="tc-alert"><%= message %></span>
                                <table cellpadding="2" cellspacing="0" border="0">
                                    <tr>
                                        <td class="name" align="right">Handle:</td>
                                        <td class="value"><input type="text" name="<%=Login.USER_NAME%>" value="" maxlength="30" size="30" onkeypress="submitEnter(event)" class="textfield"></td>
                                    </tr>
                                    <tr>
                                        <td class="name" align="right">Password:</td>
                                        <td class="value"><input type="password" name="<%=Login.PASSWORD%>" value="" maxlength="30" size="30" onkeypress="submitEnter(event)" class="textfield"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="left"><input type="checkbox" name="<%=Login.REMEMBER_USER%>" id="rememberme"> <label for="rememberme">Remember Me</label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><input type="image" src="/i/v2/interface/btnLogin.png"/></td>
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


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>


</body>
</html>
