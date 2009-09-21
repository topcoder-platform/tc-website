<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows specific information about sponsor 1.
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
                    <jsp:include page="../../header.jsp"/>
                    
                    <jsp:include page="../../mainNav.jsp" >
                        <jsp:param name="mainTab" value="overview"/>
                    </jsp:include>
                    
                    <div id="content">
                            <div class="contentTopLeft"><div class="contentTopRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                            <div id="contentInner" class="contentInner">
                            
                                <div id="contentInnerInner">

                                    <jsp:include page="../topArea.jsp"/>
                                
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <jsp:include page="../../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="sponsors"/>
                                            </jsp:include>

                                            <jsp:include page="../../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="sponsors"/>
                                                <jsp:param name="tertiaryTab" value="sponsor3"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Facebook</h2>
                                                                
                                                                <h3 class="subtitle"><a href="tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=sponsors&d5=sponsor3-chat">TCO Chat Session Transcript</a></h3>
                                                                	<p><object width="576" height="324" ><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://www.facebook.com/v/183757000483" /><embed src="http://www.facebook.com/v/183757000483" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="576" height="324"></embed></object></p>
                                                                	<p>Facebook is hiring brilliant engineers who like to build. Because we’re growing so quickly, there is enormous opportunity for individuals to have an impact and to grow as our service and our company grows. What matters here is what you contribute, not your credentials.</p>
                                                                	<p>No one has ever done what we are trying to do at such speed and scale, and we do it all with less than two hundred engineers. Our active user to engineer ratio is over 1,000,000:1... and growing, and you just won’t get that personal impact at any other company.</p>
                                                                	<p>We also move as fast as we can to launch things quickly, try new things and then iterate to make them better. We would rather take risks and break a few things in the process than move slowly. The code you write one day can be used by hundreds of millions of users that same night.</p>
                                                                	<p>Everyone at Facebook makes daily decisions in their work to solve the most impactful problems in the fastest, most efficient way possible and to build solutions that will scale to reach hundreds of millions of users around the world. One engineer built the photos application on the service, and Facebook is now the largest photo sharing site on the Web. Another engineer built Facebook Video in a one night Hackathon. The feature now has hundreds of thousands of video uploads every day.</p>
                                                                	<p>We've got 200 million users so far, but we have so much more to do and build... and that's where your kung fu comes into play. Come build with us, we’re hiring.</p>
                                                                	<p><a href="/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=sponsors&d5=eventSponsor3Confirm" class="applyNowBtn"></a></p>
                                                          </div>
                                                      </div>
                                                    </div><!-- End #mainContentInner -->
                                                </div><!-- End #mainContent -->                                                 
                                                
                                                <jsp:include page="../../sponsors.jsp"/>
                                                
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

<jsp:include page="../../footer.jsp"/>
</body>
</html>
