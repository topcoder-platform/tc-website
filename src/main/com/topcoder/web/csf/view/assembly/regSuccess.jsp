<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="csf"/>
    </jsp:include>
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

        <jsp:include page="../top.jsp"/>

        <jsp:include page="../primaryNav.jsp">
            <jsp:param name="selectedTab" value="competitions"/>
        </jsp:include>

        <div id="main">
            <div class="pageHeader">
                <span class="pageName">Registration Successful</span>
            </div>
            
<div class="linkBox">
    <a href="http://csf.topcoder.com/forums?module=ThreadList&amp;forumID=6">Discuss this</a>
</div>

<div class="breadcrumb">
    <a href="/?module=Static&d1=competitions">Competitions</a>
    > <a href="/?module=Static&d1=assembly&d2=activeContests">Active Assembly Competitions</a>
    > Microsoft Session Manifest Tool
</div>

<div align="center" style="margin: 100px 0px 140px 0px;">
<strong>Thank you for registering.</strong>
</div>

        </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>

</body>
</html>