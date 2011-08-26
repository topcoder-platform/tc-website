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
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio : Contact Us</title>

    <jsp:include page="style.jsp">
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
            <jsp:include page="top.jsp">
            <jsp:param name="section" value="contact" />
            </jsp:include>
        <br />
        <!-- container -->
            <div id="container">
                     <div id="wrapper">
    
                    <!-- content -->
                    <div id="content">
                        <div class="contentTop">
                            <div class="contentMiddle">
            
                                <h1>Contact Us</h1>
                                <%--
                                --%>
                                <div id="contact">
                                    <div class="leftDiv">
                                        <strong>Need Designs?</strong><br/>

                                        <p>However big or small your company, from simple web banners, to logos,
                                        to full web and application UI development, TopCoder Studio can help
                                        you find the solution.</p>

                                        <p>Every day we work with Fortune 500 companies, small businesses and
                                        individuals alike, helping them tap into the resources of our Global
                                        Community to tackle issues just like yours.</p>

                                        <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/">
                                            Visit us here for more information on how to put TopCoder to work for you!
                                        </a>
                                    </div>
                                    <div class="rightDiv">
                                        <strong>Member Support</strong>
                                        <p>Be sure to check out our
                                            <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/new-member-guide/">Member Resources</a>
                                            area for information about how to compete, how to get paid and many other
                                            topics.</p>
                                        <p>Email: <a href="mailto:support@topcoder.com?subject=TopCoder%20Studio%20General%20Questions">support@topcoder.com</a></p>
                                        <p>
                                            <strong>Corporate Address</strong><br/>
                                            TopCoder, Inc.<br/>
                                            <address>95 Glastonbury Blvd<br/>
                                            Glastonbury, CT 06033 U.S.A.</address>
                                            tel: 860.633.5540<br/>
                                            fax: 860.657.4276
                                        </p>
                                    </div>
                                </div>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="foot.jsp"/>


</body>
</html>
