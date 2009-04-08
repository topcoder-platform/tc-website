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
                                                <jsp:param name="tertiaryTab" value="sponsor1"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">IEEE USA</h2>
                                                                <p><strong>Since everyone else is looking out for #1, we're looking out for you.</strong><br />
                                                                    Through years of record layoffs and bleak employment prospects for U.S. engineers, one organization has been there helping to protect and create jobs for the IEEE's 235,000 U.S. members and all U.S. electrical, electronics and computer engineers. IEEE-USA is working three jobs to make your career more rewarding.</p>
                                                          			<p><strong>Working to Support Your Career</strong><br />
                                                       			    IEEE-USA bolsters the professional standing and careers of U.S. engineers in many ways.</p>
                                                              <p>We spearhead career workshops and a biennial professional development conference to help engineers develop resilience in a changing job market. We oversee local consultants' networks and an online salary and fringe benefits survey. We sponsor skills banks, along with global employment services.</p>
                                                              <p>Join the World's Largest Technical Professional Association.</p>
                                                              <p>IEEE is the world's largest technical society, bringing members access to the industry's most essential technical information, networking opportunities, career development tools, and many other exclusive benefits. </p>
                                                              <p><strong>Community<br />
                                                              </strong>Some idea categories for applications are the USA’s approach to Electronic Health Records, the ability to move user created data across various social media sites, enabling federated searches across Web-based digital libraries, metadata organization to improve the quality of results in an e-Discovery case, and improve how national governments and libraries will preserve data for future generations.&nbsp; </p>
                                                        <p>No matter where you live, IEEE is there, with more than 300 local IEEE sections, 1,300 technical chapters, and 300 annual IEEE conferences worldwide. As a member, you'll have the opportunity to attend your local section or chapter meetings, volunteer for leadership positions, or attend a conference to meet industry leaders and practitioners, encounter the latest research, and present your papers to an international audience.</p>
                                                        <p>IEEE career and employment resources offer great opportunities for IEEE members. Whether you are a job seeker, consultant or entrepreneur, the IEEE Job Site, Consultants Database, and career publications offer you the edge you need to succeed. IEEE also offers technical and professional online courses from the top universities and corporate educational institutions at exclusive discounts for IEEE members. <br />
                                                          You make a difference when you join IEEE.</p>
                                                        <p>IEEE membership helps support the IEEE mission of promoting the engineering profession for the benefit of humanity and the profession. Membership also enables affordable student membership, funds university program accreditation and helps introduce technology careers to young people around the world. </p>
                                                        <p><a href="http://www.ieee.org/web/membership/join/join.html" target="_blank">JOIN IEEE</a> </p>
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
