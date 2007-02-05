<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="java.util.Date" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page isErrorPage="true" %>
<% if (exception == null) exception = (Throwable) request.getAttribute("exception");
    if (exception != null) exception.printStackTrace();
    String message = (String) request.getAttribute(BaseServlet.MESSAGE_KEY);
    String url = (String) request.getAttribute(BaseServlet.URL_KEY);
%>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/main.css"/>
    <link type="text/css" rel="stylesheet" href="/css/stats.css"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>
    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript"></script>
    <script type="text/javascript"> _uacct = "UA-321688-2";
    urchinTracker(); </script>
    <script type="text/javascript" src="/js/popup.js"></script>
</head>

<body>

<div align="center">
<div id="content">

<div class="top">
    <div class="msLogo">
        <a href="/"><img src="/i/microsoft.png" alt="Microsoft"></a>
    </div>
    <div class="csfLogo">
        <a href="/"><img src="/i/csf.png" alt="Connected Services Framework Competition Series"></a>
    </div>
    <a href="http://www.topcoder.com/tc?module=LinkTracking&amp;link=http://www.networkmashups.com/&amp;refer=csf_site_sandbox_logo"><img src="/i/sandboxLogo.gif" alt="Connected Services Sandbox"></a>
</div>

<div id="primaryNav">
<ul>
<li style="border-top: 1px solid rgb(204, 204, 204);"><a href="/" onfocus="this.blur();">Home</a></li>
<li><a href="/?module=Static&d1=schedule" onfocus="this.blur();">Schedule</a></li>
<li><a href="/?module=Static&d1=rules" onfocus="this.blur();">Rules</a></li>
<li><a href="/?module=Static&d1=competitions" onfocus="this.blur();">Competitions</a></li>
<li style="border-bottom: 1px solid rgb(204, 204, 204); background-image: none;"><a href="/forums" onfocus="this.blur();">Discuss the Competitions</a></li>
</ul>
<a href="http://www.topcoder.com" style="margin-left: 5px;"><img src="/i/pbtc.png" alt="Powered by TopCoder"></a>
</div>

<div id="main">
    <div class="pageHeader">
        <span class="pageName">Error</span>
    </div>

                <div align="center">
                    <div style="width:500px; padding: 50px 0px 100px 0px;">
                        <%=message == null ? "An error has occurred when attempting to process your request." : "<b>" + message + "</b>"%>
                        <br><br>
                        You may click <a href="javascript:history.back();">here</a> to return to the last page you were
                        viewing.
                        <br><br>
                        If you have a question or comment, please email
                        <A href="mailto:csf@topcoder.com?subject=Microsoft CSF Error">csf@topcoder.com</A>.
                        <br><br>
                        <%=new Date().toString()%>
                    </div>
                </div>

</div>
    
<div align="center">
    <div style="padding-left: 0px; padding-top: 15px;">
        Copyright &#169; Microsoft Corporation, 2006. All Rights Reserved
    </div>
    <div style="padding-left: 5px; padding-top: 5px;">
        <a id="ctl00_Copyright_HyperLink1" class="footerLink" href="http://privacy.microsoft.com/">Privacy Policy</a>
        &nbsp;&nbsp;|&nbsp;&nbsp;<a id="ctl00_Copyright_HyperLink2" class="footerLink" href="http://www.networkmashups.com/TermsOfUse.aspx">Terms of Use</a>
        &nbsp;&nbsp;|&nbsp;&nbsp;<a id="ctl00_Copyright_HyperLink4" class="footerLink" href="mailto:csf@topcoder.com">Contact Us</a>
        &nbsp;&nbsp;|&nbsp;&nbsp;<a id="ctl00_Copyright_HyperLink5" class="footerLink" href="http://www.networkmashups.com/Feedback.aspx">Feedback</a>
    </div>
</div>
</div>
</div>

</body>
</html>