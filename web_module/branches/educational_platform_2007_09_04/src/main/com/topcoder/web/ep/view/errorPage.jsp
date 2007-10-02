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
    <title>TopCoder Educational Platform</title>
    <link type="text/css" rel="stylesheet" href="/css/main.css">
    <link type="text/css" rel="stylesheet" href="/css/stats.css">
</head>

<body>

<div align="center">
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
                <A href="service@topcoder.com?subject=TopCoder Educational Platform Error">service@topcoder.com</A>
                                         and be sure to include this timestamp: <%=new Date().toString()%>.
            </div>
            <%=new Date().toString()%>
        </div>

    </div>
</div>

</body>
</html>