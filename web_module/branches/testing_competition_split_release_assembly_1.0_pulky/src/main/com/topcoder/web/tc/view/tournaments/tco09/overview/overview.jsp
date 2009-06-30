<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows an overview page for the tournament.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Tournament Overview</title>

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
                        <jsp:param name="mainTab" value="overview"/>
                    </jsp:include>
                    
                    <div id="content">
                            <div class="contentTopLeft"><div class="contentTopRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                            <div id="contentInner" class="contentInner">
                            
                                <div id="contentInnerInner">

                                    <jsp:include page="topArea.jsp"/>
                                
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <jsp:include page="../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="overview"/>
                                            </jsp:include>
                                            
                                            <jsp:include page="../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="overview"/>
                                                <jsp:param name="tertiaryTab" value=""/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                
                                                    
                                                    <div id="mainContentInner">
                                                        <p align="center"><a href="http://sensations.aol.com/"><img src="/i/tournament/tco09/aol-sensations-510x54.png" alt="AOL/TOpCoder Sensations Developer Challenge" /></a></p>
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Overview</h2>
                                                                <p>The 2009 TopCoder Open is now complete.  Congratulations to all champions!</p>
                                                                <p><img src="/i/tournament/tco09/winners/tco09-winner-all.png" alt="TCO09 Champions" /></p>
                                                                <p>Algorithm Champion: <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=22675094" target="_blank">crazyb0y</a><br />
                                                                  Architecture Champion: <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=310233" target="_blank">Standlove</a><br />
                                                                  Assembly Champion: <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14882871" target="_blank">pulky</a><br />
                                                                  Component Design Champion: <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=21932422" target="_blank">saarixx</a><br />
                                                                  Component Development Champion: <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=20076717" target="_blank">assistant</a><br />
                                                                  Marathon Champion: <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15805598" target="_blank">KOTEHOK</a><br />
                                                                  Mod Dash Champion: <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9998760" target="_blank">PE</a><br />
                                                                  Specification Champion: <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=252022" target="_blank">AleaActaEst</a><br />
                                                                Studio Champion: <a href="http://studio.topcoder.com/?module=ViewMemberProfile&amp;ha=djnapier" target="_blank">djnapier</a></p>
                                                                <p>Thanks to the TopCoder staff and members for another awesome event!</p>
                                                                <p>If you missed anything, check out the  <a href="http://www.topcoder.com/tco09/blog/">TCO09 Blog,</a> <a href="http://www.topcoder.com/tco09/blog/photos/">photos</a> and <a href="http://www.topcoder.com/tco09/blog/movies/">videos</a>.</p>
                                                                <p>Many of the TopCoder and Sponsor roundtables were <a href="http://www.topcoder.com/tco09/blog/livevideo/">streamed live</a>, including a Q&A with TopCoder founder, Jack Hughes - so check out the archived versions!</p>
                                                                <p>We hope all competitors enjoyed the TCO09!</p>
                                                            </div>
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
