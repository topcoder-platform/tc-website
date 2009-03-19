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
                <span class="pageName">Competition Details</span>
            </div>
            
            <div class="linkBox">
                <a href="http://csf.topcoder.com/forums?module=ThreadList&amp;forumID=6">Discuss this</a>
            </div>
            
            <div class="breadcrumb">
                <a href="/?module=Static&d1=competitions">Competitions</a>
                > <a href="/?module=Static&d1=assembly&d2=activeContests">Active Assembly Competitions</a>
                > BT Business CSF Mashup Assembly Competition
            </div>
            
            <div align="center" style="margin: 60px 0px 140px 0px;">
                <p style="width: 400px" align="left">
                When you click <strong>Submit</strong>, you will be taken to TopCoder's Online Review site to submit for this competition.  Just log in with the same username and password you use on this site.  Your project(s) will be displayed on that page and you will be provided with an interface to send us your submissions.
                </p>
                <p style="width: 400px" align="left">
                Are you ready?
                </p>
                <div align="center">
                <a class="button" style="width: 60px;" href="/review">Submit</a>
                </div>
            </div>

        </div>

        <jsp:include page="../foot.jsp"/>
    </div>
</div>

</body>
</html>