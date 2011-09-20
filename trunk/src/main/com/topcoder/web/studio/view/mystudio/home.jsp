<%--
  - Author: TCSDEVELOPER, isv
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders studio site top section.
  -
  - Version 1.1 (Studio Enhancements Release Assembly 1) Change notes:
  - * Re-arranged content and updated URLs for relevant links.
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>

    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    
    <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages(); 
            });
    </script>
    <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
    <script type="text/javascript" language="javascript">

    $(document).ready(function(){
    
    
        $("#nav ul li").hoverIntent(function(){
            $(this).children("ul").slideDown("fast");
        }, function() {
            $(this).children("ul").slideUp("fast");
        });
        
        $("#nav ul ul li").hover(function() {
            $(this).parents("#nav ul li").children('a').addClass("active-item");
        }, function() {
            $(this).parents("#nav ul li").children('a').removeClass("active-item");
        });
    
    
    });
    </script>
</head>

<body>
    <div id="page-wrap">
        <div align="center">
            <jsp:include page="../top.jsp">
                <jsp:param name="section" value="my_studio" />
            </jsp:include>
        <br />
        <!-- container -->
        
        <div id="container">
            <div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle" id="myStudio">

                        <h1>My Studio</h1>

                        <div class="leftDiv">
                            <p>
                                <strong>Important Documentation</strong><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/wiki/display/tc/The+Assignment+Document">Download Assignment Document</a>
                            </p>
                            <p>
                                <strong>Tools</strong><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=MyHome">Manage TopCoder Profile</a><br/>
                                <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=AssignmentDocumentHistory">Assignment Document Status</a><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/PactsMemberServlet?module=PaymentHistory">My Payments</a>
                            </p>
                            <p>
                                <strong>RSS Feeds</strong><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=BasicRSS&c=rss_active_contests&dsid=33">Studio Active Contests</a><br/>
                                <!--
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=BasicRSS&c=rss_review_opportunities&dsid=33">Upcoming Contests in Spec Review</a><br/>
                                -->
                                <a href="https://<%=ApplicationServer.SERVER_NAME%>/bugs/sr/jira.issueviews:searchrequest-rss/temp/SearchRequest.xml?&customfield_10073=Studio+Bug&type=-2&pid=10021&status=1&status=3&status=4&sorter/field=issuekey&sorter/order=DESC&tempMax=1000">Studio Bug Race Competitions</a><br/>
                                <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums?module=RSS&categoryID=1">Studio Forums</a><br/>
                                <a href="http://community.topcoder.com/studio/feed/">Studio Blog</a>
                            </p>
                            <p>
                                <strong>Leaderboards</strong><br/>
                                <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/dr?module=ViewLeaderBoard&sc=&sd=">Studio Cup</a><br/>
                                TCO11 Studio Track (coming soon)
                            </p>

                        </div>
                        
                        <div class="rightDiv">
                            <p>
                                <strong>What all Competitors Should Know...</strong><br/><br/>
                                We want you to succeed here at TopCoder Studio. Please take a moment to read the
                                following important information about competing. If you have questions, reach out to
                                your fellow members in the <a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums">forums</a>
                                or email us at
                                <a href="mailto:studioadmin@topcoder.com?subject=TopCoder%20Studio%20General%20Questions">studioadmin@topcoder.com</a>.</p>

                            <p class="myStudioLinks">
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/new-member-guide/">New Member Guide</a><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/the-process/assignment-document-and-terms/">Competition Terms</a><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/the-process/copyright-questions/">Copyright Questions</a><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/types-of-competitions/">Types of Competitions</a><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/the-process/how-to-submit-to-a-contest/">Formatting Your Submission</a><br/>
                                <a href="http://community.topcoder.com/studio/the-process/font-policy/">Font Policy</a><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/the-process/submission-limits-and-ranking/">Submission Limits and Ranking</a><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/the-process/screening/">Screening</a><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/the-process/winner-selection/">Winner Selection</a><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/the-process/final-fixes/">Final Fixes</a><br/>
                                <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/the-process/getting-paid/">Getting Paid</a><br/>
                            </p>    
                        </div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../foot.jsp"/>


</body>
</html>
