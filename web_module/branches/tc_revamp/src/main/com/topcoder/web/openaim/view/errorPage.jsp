<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="java.util.Date" %>
<%@ page isErrorPage="true" %>
<% if (exception == null) exception = (Throwable) request.getAttribute("exception");
    if (exception != null) exception.printStackTrace();
    String message = (String) request.getAttribute(BaseServlet.MESSAGE_KEY);
    String url = (String) request.getAttribute(BaseServlet.URL_KEY);
%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Open AIM Developer Challenge :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_openaim"/>
    </jsp:include>

    

    <script type="text/javascript">
        function preloadTabs() {
            var img = new Image();
            img.src = '/i/events/openaim/tabs/registerOn.png';
            img.src = '/i/events/openaim/tabs/submitOn.png';
            img.src = '/i/events/openaim/tabs/apisOn.png';
            img.src = '/i/events/openaim/tabs/discussOn.png';
        }
    </script>

</head>

<body>

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">

                <jsp:include page="openaimTop.jsp"/>

                <div class="content" align="right">
                    <div class="contentTexture">
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxFull">

                <h1>Error</h1>

                <div align="center">
                    <div style="width:500px; padding: 50px 0px 100px 0px;">
                        <%=message == null ? "An error has occurred when attempting to process your request." : "<b>" + message + "</b>"%>
                        <br /><br />
                        You may click <a href="javascript:history.back();">here</a> to return to the last page you were
                        viewing.
                        <br /><br />
                        If you have a question or comment, please email
                        <a href="service@topcoder.com?subject=TopCoder Open AIM Error">service@topcoder.com</a>
                                                 and be sure to include this timestamp: <%=new Date().toString()%>.
                    </div>
                    <%=new Date().toString()%>
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