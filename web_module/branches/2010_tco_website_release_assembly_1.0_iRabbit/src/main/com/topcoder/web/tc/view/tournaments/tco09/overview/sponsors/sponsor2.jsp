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
                                                <jsp:param name="tertiaryTab" value="sponsor2"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">SNIA XAM Initiative</h2>
                                                                    <p>The Storage Networking Industry Association (SNIA) is a not–for–profit global organization, made up of some 400 member companies and 7,000 individuals spanning virtually the entire storage industry. SNIA's mission is to lead the storage industry worldwide in developing and promoting standards, technologies, and educational services to empower organizations in the management of information.&nbsp; The SNIA XAM (eXtensible Access Method) Initiative has recently released an industry standard, XAM API, and a software developer kit to implement this standard.&nbsp;&nbsp; </p>
                                                                    <p>The SNIA XAM Initiative is proud to welcome the world's top programming talent to tap into your ideas and test your programming skills to accelerate the creation of tools and solutions based on XAM. Living in an era of rampant information explosion and the need to manage, secure, and access vast amounts of data is exceeding the capabilities of traditional data technologies based on file systems and databases.&nbsp;&nbsp; </p>
                                                                    <p><strong>XAM Standard Solves Vendor Lock-in and Traditional Technology Limitations: </strong><br />
                                                                   	The XAM standard puts power back in the hands of IT by providing a common interface for applications to seamlessly interoperate across XAM-enabled fixed-content or SAN &nbsp;storage devices. The XAM standard empowers IT and service providers to deploy a variety of storage media from multiple vendors and even migrate content from one storage platform to another.&nbsp; </p>
                                                                    <p>XAM solves key problems for specialized storage and write once, read many devices providing long-term data retention by storing information in non-modifiable format on disk.&nbsp; Unfortunately, these systems require integration with applications that write to them. This forces datacenters and service providers to be locked-in to one vendor's fixed-content platform, or incur the cost of integrating applications across multiple fixed-media platform interfaces. </p>
                                                                    <p><strong>XAM Features:</strong></p>
                                                                    <ul>
                                                                      <li>XAM stores content as &quot;objects&quot; that consist of data and annotated metadata. An example is an X-ray image that is stored as the data component, while the patient's name and other medical record details are stored as attached metadata. Metadata could be stored in a uniform format that can be indexed and searchable by independent tools. Also, metadata can help record and save important contextual information about the data, which may be used to interpret and make use of the data      many years later;</li>
                                                                      <li>Metadata &amp; data fields inside a XAM object can be defined as modifiable or non-modifiable. Changes to a field marked non-modifiable will result in a new version of the XAM object&nbsp; being created&nbsp; in the underlying storage device.&nbsp; This allows XAM objects to meet authenticity and chain of custody tracking requirements for e-discovery and medial environments.</li>                                                                      <li>XAM generates a globally unique name (address) for      each object, which is independent of the current computing environment,      organization, location, or technology. As a consequence, objects may move      around freely in time, changing their physical or technological location,      all transparent to their current owner. This property is a fundamental      enabler for transparent information lifecycle management (ILM).</li>
                                                                    </ul>
                                                              <p><strong>The Topcoder SNIA XAM coding challenge offers developers the opportunity to:</strong></p>
                                                                <ul>
                                                                  <li>Create innovative ideas and applications for XAM</li>
                                                                  <li>Create innovative tools to speed the implementation of XAM</li>
                                                                  <li>Inspire developers to participate in industry standards development</li>
                                                                  <li>Create XAM vendor modules for new platforms, low cost platforms and cloud computing</li>
                                                                  <li>Integrate XAM libraries and XAM VIMs into operating systems and other relevant &nbsp;data computing stacks</li>
                                                                </ul>
                                                              <p>Some idea categories for applications are the USA’s approach to Electronic Health Records, the ability to move user created data across various social media sites, enabling federated searches across Web-based digital libraries, metadata organization to improve the quality of results in an e-Discovery case, and improve how national governments and libraries will preserve data for future generations.&nbsp; </p>
                                                              <p><strong>The SNIA XAM Initiative has created a community of resources to rapidly immerse yourself in understanding XAM, getting questions answered, and working with the XAM software:</strong></p>
                                                                  <ul>
                                                                    <li>SNIA XAM Developers Group - <a href="http://groups.google.com/group/xam-developers-group">http://groups.google.com/group/xam-developers-group</a> </li>
                                                                    <li>SNIA XAM Initiative - <a href="http://www.snia.org/forums/xam/">http://www.snia.org/forums/xam/</a> </li>
                                                                    <li>SNIA XAM 1.0 Final Technical Position Specifications – <a href="http://www.snia.org/forums/xam/technology/specs">http://www.snia.org/forums/xam/technology/specs</a></li>
                                                                    <li>SNIA XAM Software Developers Kit Working Draft Release – <a href="http://www.snia.org/forums/xam/technology/software">http://www.snia.org/forums/xam/technology/software</a> </li>
                                                                  </ul>
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
