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
    <meta name="description" content="Overview of how to start competing in graphic and web design competitions at TopCoder Studio" />
    <meta name="keywords" content="topcoder, studio, graphic competitions, graphic design contests, graphic design, web design, logo, contests, compete, prizes, cash, clients" />
    <title>TopCoder Studio | How it Works</title>

     <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_studio"/>
    </jsp:include>
    <script src="js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
    <script src="js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
    <script src="js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
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
                <jsp:param name="section" value="howitworks" />
            </jsp:include>
        <br />
        <!-- container -->
        <div id="container">
            <div id="wrapper">
    
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">
                        <h2 class="how-it-works-title">Clients have multiple designs to choose from. Designers have multiple ways to win.</h2>

                        <p>At TopCoder Studio our community of global designers compete in individual competitions held by contest holders, along with larger monthly and annual tournaments held by TopCoder.</p>

                        <p>By tapping into a pool of creative people with multiple specialties, our clients benefit from
                            new approaches and innovative concepts from a global community. Our competitors are here not
                            just to win, but to learn new skills, consult with peers, and earn the chance to be
                        called one of the best designers in the world.</p>

                        <div class="leftDiv">
                            <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/studio/what-is-studio/">
                                <img src="/i/v4/member_resources.jpg" alt="Member Resources" width="466" height="153"/></a>
                        </div>
                        <div class="rightDiv">
                            <a href="http://<%=ApplicationServer.SERVER_NAME%>/home/direct">
                                <img src="/i/v4/tc_direct.jpg" alt="TC Direct" width="466" height="153"/></a>
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
