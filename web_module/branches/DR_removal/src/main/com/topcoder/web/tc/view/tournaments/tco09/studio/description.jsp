<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows studio track description page.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Studio Competition</title>

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
                        <jsp:param name="mainTab" value="studio"/>
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
                                                <jsp:param name="mainTab" value="studio"/>
                                                <jsp:param name="secondaryTab" value="description"/>
                                            </jsp:include>
                                            
                                            <jsp:include page="../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="studio"/>
                                                <jsp:param name="secondaryTab" value="description"/>
                                                <jsp:param name="tertiaryTab" value=""/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                
                                                    
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Welcome to the Studio Design Competition!</h2>
                                                                    <p>The Studio Design Competition (SDC) is a place for competitors to put their design talent to the test. Designers will have 8 weeks to compete and accumulate points leading up to the Finals, being held at the Mirage Hotel in Las Vegas, Nevada, USA. Ten of the most creative competitors will win a trip to Las Vegas where they will compete in the Championship Round for the chance to win cash prizes.</p>
                                                  <div class="subtitle">
                                                                            <h3 class="subtitle">What is TopCoder Studio?</h3>
                                                                                <p>Studio challenges top creative talent from around the world to present their best concepts to clients searching for new design solutions. </p>
                                                                            <h3 class="subtitle">Clients have multiple designs to choose from. Designers have multiple ways to win. </h3>
                                                                                <p>Our clients hold competitions where designers compete for cash prizes, along with placement points that accumulate for the opportunity to win larger cash awards in our monthly tournament called the Studio Cup and the annual TCO tournament. </p>
                                                                                <p>By tapping into a pool of creative people with multiple specialties, our clients benefit from new approaches and innovative concepts from a global community. Our competitors are here not just to win prizes, but to learn new skills, consult with peers, and earn the chance to be called one of the best designers in the world. </p>
                                                                            <h3 class="subtitle">The Competition Process</h3>
                                                                                <p>The competition process ignites creativity in both the client and the Studio members. Studio helps clients specify the goals, requirements and scope of the design project. The competition is posted and Studio members submit their designs. The client then evaluates the submissions and chooses a winner (or multiple winners). The design is transferred to the client and the winners receive prizes and placement points for ongoing tournaments.</p>
                                                                                <p>Clients engage the Studio community for design work ranging from icon creation to full application user interface design. In addition to logos, banners, print, apparel and other more traditional design work, members compete in Flash, widget design, Flex 3, HTML/CSS, Javascript and other development competitions. This allows Studio to take a project from the drawing board to production.</p>
                                                                                <p>Why should you become a member of Studio? <a href="http://studio.topcoder.com/?module=Static&amp;d1=support&amp;d2=whyJoin">Find out!</a></p>
                                                                                <p>Learn more about how <a href="http://studio.topcoder.com/?module=Static&amp;d1=support&amp;d2=getStarted">TopCoder Studio works.</a></p>
                                                                                <p>When is the competition? See the <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=studio&d4=schedule">schedule.</a></p>
                                                                                <p>It is important for you to read the <a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=rules&d5=studio">official rules and regulations</a> for important details.<span class="style1"></span></p>
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
