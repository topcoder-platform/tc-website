<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="csf.tld" prefix="csf" %>
<%@ taglib uri="/WEB-INF/tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
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

<jsp:include page="top.jsp"/>

<jsp:include page="primaryNav.jsp">
<jsp:param name="selectedTab" value="schedule"/>
</jsp:include>

<div id="main">
    <div class="pageHeader">
        <span class="pageName">Schedule</span>
    </div>
<h2>Competition #1: BT Business CSF Mashup Design Competition</h2>

<ul>
<li><strong>Submission Start Date:</strong> March 6, 2007</li>
<li><strong>Submission End Date:</strong> March 16, 2007</li>
<li><strong>Review & Revision Start Date:</strong> March 23, 2007</li>
<li><strong>Review & Revision End Date:</strong> March 27, 2007</li>
<li><strong>Winner Announced:</strong> April 2, 2007</li>
</ul>


<p><strong>Other competitions will be added to the schedule soon, so check back often!</strong></p>


</div>
    
<jsp:include page="foot.jsp"/>
</div>
</div>

</body>
</html>