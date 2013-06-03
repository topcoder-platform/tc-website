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

                        <div class="center">


                            <div class="leftDiv">
                                <a class="learnMore" href="javascript:;">
                                   <p class="small">Get to know the ins &amp; outs of TopCoder Studio!</p>
                                </a>
                                <a class="register" href="javascript:;">
                                    <p class="small">Register with TopCoder to access TopCoder Studio</p>
                                </a>
                                <div class="clear"></div>
                                <h2>New To Studio? As a member you can...</h2>
                                <ul class="list">
                                    <li class="bullet1">Access and compete in our current design competitions</li>
                                    <li class="bullet2">View past competitions and winning submissions</li>
                                    <li class="bullet3">Have full access to the community forums</li>
                                </ul>
                            </div>
                            <div class="rightDiv">
                                <div class="loginDiv">
                                    <span class="tc-alert"><%= message %></span>
                                    <form method="post" name="frmLogin" action="${sessionInfo.servletPath}">
                                        <input type="hidden" name="<%=BaseServlet.NEXT_PAGE_KEY%>" value="<%= StringUtils.htmlEncode(nextpage) %>">
                                        <input type="hidden" name="module" value="Login">
                                        <div class="innerDiv">
                                            <div class="row">
                                                <div class="label">Handle:</div>
                                                <div class="value"><input type="text" name="<%=Login.USER_NAME%>" id="txtHandle" class="text"/></div>
                                                <div class="clear"></div>
                                            </div>

                                            <div class="row">
                                                <div class="label">Password:</div>
                                                <div class="value"><input type="password" name="<%=Login.PASSWORD%>" id="txtPassword" class="text"/></div>
                                                <div class="clear"></div>
                                            </div>
                                            <div class="row">
                                                <div class="label">&nbsp;</div>
                                                <div class="value">
                                                    <input type="checkbox" class="check" name="<%=Login.REMEMBER_USER%>" id="remember"/>
                                                    <label for="remember">Remember Me</label>
                                                    <a class="login" href="javascript:;">Log in</a>
                                                </div>
                                                <div class="clear"></div>
                                            </div>
                                            <div class="hr"></div>
                                            <h3>Forgot your password?</h3>
                                            <p>If you cannot remember your password, <a href="javascript:;" class="link">click here</a> and we can help you restore your account.</p>
                                        </div>
                                    </form>    
                                </div>
                                <div class="clear"></div>
                            </div>

                            <script type="text/javascript">
                                document.frmLogin.<%=Login.USER_NAME%>.focus();
                            </script>

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
