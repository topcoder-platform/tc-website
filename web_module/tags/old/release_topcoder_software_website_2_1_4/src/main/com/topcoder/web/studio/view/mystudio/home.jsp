<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="../top.jsp"/>
            <jsp:include page="../topNav.jsp">
                <jsp:param name="node" value="myStudio"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

                        <h1>My Studio</h1>
        
                        <h3>Documentation:</h3>
        
                        <p><a target="_blank" href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/The+Assignment+Document">Download Assignment Document</a></p>
                        <p><a href="${sessionInfo.servletPath}?module=AssignmentDocumentHistory">View Assignment Document Status</a></p>
                        
                        <%--
                        <h3>Tools</h3>
        
                        <p>
                            <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/review">Online Review</a>
                        </p>
                        --%>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>

    </div>
</body>
</html>