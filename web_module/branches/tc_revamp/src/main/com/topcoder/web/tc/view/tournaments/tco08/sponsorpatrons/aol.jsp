<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="sponsors"/>
    <jsp:param name="tabLev3" value="aol"/>
    </jsp:include>


        
        
        <h2>AOL</h2>
        
        <div style="float: right;">
            <h3 style="border-bottom: 1px solid #b7b3b3;">Chat Session Transcripts</h3>
            <strong>
                <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=aolChat20080506">SRM 401</a>
            </strong>
        </div>
        <div style="padding-bottom:10px;">
            <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com/' refer='tco08_aol' />"><img alt="TCO08 Sponsored by AOL" src="/i/tournament/tco08/aol_logo.png" /></a>
        </div>
        <p>AOL is a global Web services company that operates some of the most popular Web destinations and offers a comprehensive suite of free software and services. An avid supporter of the development community, AOL is pleased to continue its close association with TopCoder.</p>
        <p>AOL is committed to providing developers around the world with access to its open APIs and technology platforms, making it easy for developers to build collaborative applications and mashups. With platforms including Open AIM, ICQ, WINAMP, MapQuest, and Xdrive, the AOL Developer Network provides direct access to a broad range of authentication, messaging, music, mapping, video, storage, social networking and mobile solutions.  To power up your application, please visit <a target="_blank" href="<tc-webtag:linkTracking link='http://dev.aol.com/' refer='tco08_aol' />">http://dev.aol.com/</a>.</p>
        <p>A majority-owned subsidiary of Time Warner Inc. (NYSE:TWX), AOL LLC and its subsidiaries have operations in the U.S., Europe, Canada and Asia.</p>
        
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
