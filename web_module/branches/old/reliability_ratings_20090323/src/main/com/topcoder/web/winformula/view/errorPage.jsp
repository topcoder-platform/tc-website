<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="java.util.Date" %>
<%@ page isErrorPage="true" %>
<% if (exception == null) exception = (Throwable) request.getAttribute("exception");
    if (exception != null) exception.printStackTrace();
    String message = (String) request.getAttribute(BaseServlet.MESSAGE_KEY);
    String url = (String) request.getAttribute(BaseServlet.URL_KEY);
%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challenge :: Powered by TopCoder - Error</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="nav.jsp">
        <jsp:param name="tabLev1" value="" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        
        
            <h1>Error</h1>
            <div class="full-content">
                <div align="center">
                    <div style="width:500px; padding: 50px 0px 100px 0px;">
                        <%=message == null ? "An error has occurred when attempting to process your request." : "<b>" + message + "</b>"%>
                        <br /><br />
                        You may click <a href="javascript:history.back();">here</a> to return to the last page you were
                        viewing.
                        <br /><br />
                        If you have a question or comment, please email
                        <a href="service@topcoder.com?subject=TopCoder Winformula Error">service@topcoder.com</a>
                                                 and be sure to include this timestamp: <%=new Date().toString()%>.
                    </div>
                    <%=new Date().toString()%>
                </div>
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