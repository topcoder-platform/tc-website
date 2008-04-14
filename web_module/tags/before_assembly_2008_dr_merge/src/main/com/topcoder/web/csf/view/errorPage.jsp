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

        <jsp:include page="primaryNav.jsp">
            <jsp:param name="selectedTab" value=""/>
        </jsp:include>

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
                <a id="ctl00_Copyright_HyperLink1" class="footerLink" href="http://privacy.microsoft.com/">Privacy
                    Policy</a>
                &nbsp;&nbsp;|&nbsp;&nbsp;<a id="ctl00_Copyright_HyperLink2" class="footerLink" href="http://www.networkmashups.com/TermsOfUse.aspx">Terms
                of Use</a>
                &nbsp;&nbsp;|&nbsp;&nbsp;<a id="ctl00_Copyright_HyperLink4" class="footerLink" href="mailto:csf@topcoder.com">Contact
                Us</a>
                &nbsp;&nbsp;|&nbsp;&nbsp;<a id="ctl00_Copyright_HyperLink5" class="footerLink" href="http://www.networkmashups.com/Feedback.aspx">Feedback</a>
            </div>
        </div>
    </div>
</div>

</body>
</html>