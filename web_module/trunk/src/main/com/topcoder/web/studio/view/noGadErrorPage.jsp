<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="java.util.Date" %>
<%@ page isErrorPage="true" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="top.jsp"/>
            <jsp:include page="topNav.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                <h1>Error</h1>

                <div align="center">
                    <div style="width:500px; padding: 50px 0px 100px 0px;">
                        <p style="text-align:center;"><strong>Before you can submit for this contest you must send us<br />a signed copy of the Assignment Document:</strong><br /><br />
                        <a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/The+Assignment+Document">Download the Assignment Document</a> and <a href="${sessionInfo.servletPath}?module=Static&amp;d1=gadContactPage">Send in your signed copy</a><br /><br />
                        <strong>If you've already sent us your document:</strong><br /><br />
                        <a href="${sessionInfo.servletPath}?module=AssignmentDocumentHistory">Check on the status of my Assignment Document</a><br /><br />
                        <strong>For any other questions:</strong><br /><br />
                        <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=assignmentDocFaq">Read the FAQ</a></p>
                    </div>
                    <%=new Date().toString()%>
                </div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>

    </div>
</body>
</html>