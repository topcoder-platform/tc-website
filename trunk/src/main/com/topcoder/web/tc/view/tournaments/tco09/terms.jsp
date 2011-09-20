<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows the terms of use that the user need to agree to in order to register for the tournament.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page import="com.topcoder.web.common.model.Event,
                 com.topcoder.web.tc.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<% Event event = (Event) request.getAttribute("event"); %>
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Register Now!</title>

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
</head>

<body id="page">

    <div id="wrapper">
        <div id="wrapperInner">
            <div id="wrapperContent">
                
                <div id="wrapperContentInner">
                
                    <jsp:include page="header.jsp"/>
                    
                    <jsp:include page="mainNav.jsp" >
                        <jsp:param name="mainTab" value="overview"/>
                    </jsp:include> 
                    
                    <div id="content">
                            <div class="contentTopLeft"><div class="contentTopRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                            <div id="contentInner" class="contentInner">
                            
                                <div id="contentInnerInner">
                                
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                
                                                    
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2>Registration</h2>
                                                
                                                                        <form name="terms" method="post" action="/tco09">
                                                                            <input name="module" value="SubmitUnifiedRegistration" type="hidden" />
                                                
                                                                            <p align="center">To complete your registration for the <%=event.getDescription()%> you must
                                                                                <br /><strong>read and agree to</strong> the terms listed below.</p>
                                                
                                                                            <div align="center">
                                                                                <iframe width="600" height="300" marginwidth="5" src="/tc?module=Static&amp;d1=tournaments&amp;d2=tco09&amp;d3=termsContent&<%=Constants.TERMS_OF_USE_ID%>=<%=event.getTerms().getId()%>"></iframe>
                                                                            </div>
                                                
                                                                            <div align="center">
                                                                                <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE%>">
                                                                                    <span class="bigRed">${err}</span>
                                                                                    &nbsp;<br />
                                                                                </tc-webtag:errorIterator>
                                                                                <tc-webtag:chkBox name="<%=Constants.TERMS_AGREE%>"/>
                                                                                I agree
                                                                            </div>
                                                
                                                
                                                                            <div align="center">
                                                                                <button name="submit" value="submit" type="submit">Submit</button>
                                                                            </div>
                                                                        </form>
                                                            </div><!-- End .pageContent -->
                                                        </div>
                                                        
                                                    </div><!-- End #mainContentInner -->
                                                    
                                                </div><!-- End #mainContent -->
                                                
                                                <jsp:include page="sponsors.jsp"/>
                                                
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

<jsp:include page="footer.jsp"/>
</body>
</html>
