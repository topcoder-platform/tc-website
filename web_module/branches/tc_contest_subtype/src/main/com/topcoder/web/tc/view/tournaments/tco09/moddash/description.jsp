<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows moddash track description page.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Mod Dash</title>

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- External CSS -->
<link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" media="screen" href="css/screen-ie6.css" />
<![endif]-->

<!-- External JavaScripts -->
<script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
<script type="text/javascript" src="/js/arena.js"></script> 
<style type="text/css">
<!--
.style2 {color: #FF0000}
-->
</style>
</head>

<body id="page">

    <div id="wrapper">
        <div id="wrapperInner">
            <div id="wrapperContent">
                
                <div id="wrapperContentInner">
                
                    <jsp:include page="../header.jsp"/>
                    
                    <jsp:include page="../mainNav.jsp" >
                        <jsp:param name="mainTab" value="moddash"/>
                    </jsp:include>
                    
                    <div id="content">
                            <div class="contentTopLeft"><div class="contentTopRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                            <div id="contentInner" class="contentInner">
                            
                                <div id="contentInnerInner">
                                
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <jsp:include page="../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="moddash"/>
                                                <jsp:param name="secondaryTab" value="description"/>
                                            </jsp:include>
                                            
                                            <jsp:include page="../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="moddash"/>
                                                <jsp:param name="secondaryTab" value="description"/>
                                                <jsp:param name="tertiaryTab" value=""/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                
                                                    
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Welcome to the Mod Dash&#153; Competition!</h2>
                                                                    <p>We opened up our bug fix process to the community over the past few months, and now it is facing it's inaugural year as a competition track for the 2009 TopCoder Open. This competition will run for eight (8) weeks and placement will be based on a point system. Work on fixing these bugs and you could be one of the eight (8) to win a free trip to compete at The Mirage, Las Vegas, Nevada.</p>
                                                              <div class="subtitle">
                                                                            <h3 class="subtitle">What is Mod Dash?</h3>
                                                                                <p>Project teams, clients and members are able to log bugs they find and changes they need in software developed and supported by TopCoder.&nbsp; As often as we can, we will communicate these modifications to our member community.&nbsp; Issues that are open to the community will be posted on the<strong> </strong>Active Mod Dash page - simply an RSS feed of issues that are logged into Jira - our issue tracking system.&nbsp; By clicking on an issue you will be taken to a details page where you will find more information including relevant source code, documentation and examples of how to reproduce the issue. . </p>
                                                                            <h3 class="subtitle">The Competition Process</h3>
                                                                                <p>The submissions will be reviewed and tested by the TopCoder project team that posted the Mod Dash and/or member reviewers.&nbsp;Submissions will be reviewed in the order they are received.&nbsp;The first submission that successfully solves the issue and includes all updates to documentation and test cases will be declared the winner and awarded the stated prize amount as well as points toward the TCO. The top eight (8) point earners during the 8-week competition timeframe will earn a spot in the finals to compete in Las Vegas, Nevada June 1-4, 2009. </p>
                                                                                <p>TopCoder will decide (at TopCoder's sole discretion) whether a submission successfully solves an issue. TopCoder may at any time (and at TopCoder's sole discretion) withdraw any bug posting, or engage its own or another developer to fix any bug.</p>
                                                                                <p>When is the competition? See the <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=moddash&d4=schedule">schedule.</a></p>
                                                                                <p>It is important for you to read the <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=moddash">official rules and regulations</a> for important details.<span class="style1"></span></p>
                                                                <p>The competition is free and you must be a member who is 18 years or older, as well as meet all eligibility criteria, in order to participate.</p>
                                                                        </div>
                                                            </div><!-- End .pageContent -->
                                                        </div>
                                                        
                                                    </div><!-- End #mainContentInner -->
                                                    
                                                </div><!-- End #mainContent -->
                                                
                                                <jsp:include page="../sponsors.jsp"/>
                                                
                                            </div><!-- End .bottomAreaContent -->
                                        
                                        </div></div>
                                    </div><!-- End .bottomArea -->
                                    
                                </div><!-- End #contentInnerInner -->
                            
                            </div><!-- End #contentInner -->
                            
                            <div class="contentBottomLeft"><div class="contentBottomRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                    </div><!-- End #content -->
                
                </div><!-- End #wrapperContentInner -->
                
            </div>
        </div><!-- End #wrapperInner -->
    </div><!-- End #wrapper -->

<jsp:include page="../footer.jsp"/>
</body>
</html>
