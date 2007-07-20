<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ page isErrorPage="true" %>
<% if (exception == null) exception = (Throwable) request.getAttribute("exception");
    if (exception != null) exception.printStackTrace();
    String message = (String) request.getAttribute(BaseServlet.MESSAGE_KEY);
    String url = (String) request.getAttribute(BaseServlet.URL_KEY);
%>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <link type="text/css" rel="stylesheet" href="/css/main.css">
    <link type="text/css" rel="stylesheet" href="/css/stats.css">
</head>

<body>

<div align="center">
    <div id="contentOut" class="contentOut">
        <div class="topBox">
            <div class="logoBox">
                <A href="/"><img src="/i/studio_logo.gif" alt="TopCoder Studio"/></A>
            </div>
        </div>


        <div id="topNav">

            <A href="/">Home</A>
            <A href="/?module=ViewActiveContests">Contests</A>
            <A href="/forums">Forums</A>
            <A href="/?module=Static&d1=support&d2=getStarted">Support</A>
            <A href="/?module=Static&d1=contactUs">Contact Us</A>
        </div>

        <div id="contentIn" class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <h1>Error</h1>

                <div align="center">
                    <div style="width:500px; padding: 50px 0px 100px 0px;">
                        <%=message == null ? "An error has occurred when attempting to process your request." : "<b>" + message + "</b>"%>
                        <br><br>
                        You may click <a href="javascript:history.back();">here</a> to return to the last page you were
                        viewing.
                        <br><br>
                        If you have a question or comment, please email
                        <A href="service@topcoder.com?subject=TopCoder Studio Error">service@topcoder.com</A>.
                    </div>
                    <%=new Date().toString()%>
                </div>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>

        <div class="foot">
            <a href="/?module=Static&amp;d1=home">home</a>
            | <a href="/?module=Static&amp;d1=contactUs">contact us</a>
            | <a href="http://www.topcoder.com/tc?module=Static&d1=about&d2=index">about TopCoder</a>
        </div>
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>