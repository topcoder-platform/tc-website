<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows marathon track schedule page.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Marathon Competition</title>

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
                        <jsp:param name="mainTab" value="marathon"/>
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
                                                <jsp:param name="mainTab" value="marathon"/>
                                                <jsp:param name="secondaryTab" value="schedule"/>
                                            </jsp:include>
                
                                            <jsp:include page="../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="marathon"/>
                                                <jsp:param name="secondaryTab" value="schedule"/>
                                                <jsp:param name="tertiaryTab" value=""/>
                                            </jsp:include>
                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                
                                                    
                                                    <div id="mainContentInner">
                                                        <div>
                                                        <!-- SECONDARY NAV2 CONTENT  -->
                                                            <div class="pageContent">
                                                                <h2 class="title">Marathon Competition Schedule</h2>
                                                                <div>
                                                                    <p><strong>Registration</strong></p>
                                                                    <p>Registration for the 2009 TopCoder Open Marathon Competition will open at 9:00 a.m. EST on Wednesday, February 11, 2009 and will close at 9:00 a.m. EDT on Wednesday, February 25, 2009.</p>
                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <th class="first">&nbsp;</th>
                                                                            <th>Online Rounds</th>
                                                                            <th>Start</th>
                                                                            <th>End</th>
                                                                            <th># of Participants</th>
                                                                            <th># of Advancers</th>
                                                                            <th class="last">&nbsp;</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Round 1</td>
                                                                            <td class="first last alignText">Wednesday,<br /> February 25, 2009<br />12:00 p.m.*</td>
                                                                            <td class="first last alignText">Wednesday,<br /> March 4, 2009<br />
                                                                              12:00 p.m.*</td>
                                                                            <td class="first last alignText">Unlimited</td>
                                                                            <td class="first last alignText">300</td>
                                                                            <td class="last">&nbsp;</td>
                                                                      </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Round 2</td>
                                                                            <td class="first last alignText">Wednesday,<br />                                                                             
                                                                             March 11, 2009<br />
                                                                               12:00 p.m.**</td>
                                                                            <td class="first last alignText">Wednesday,<br /> 
                                                                            March18, 2009<br />
                                                                              12:00 p.m.**</td>
                                                                            <td class="first last alignText">300</td>
                                                                            <td class="first last alignText">100</td>
                                                                            <td class="last">&nbsp;</td>
                                                                      </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Round 3</td>
                                                                            <td class="first last alignText">Wednesday,<br /> 
                                                                            March 25, 2009<br />
                                                                            12:00 p.m.**</td>
                                                                            <td class="first last alignText">Wednesday,<br /> 
                                                                            April 8, 2009<br />
                                                                              12:00 p.m.**</td>
                                                                            <td class="first last alignText">100</td>
                                                                            <td class="first last alignText">10</td>
                                                                            <td class="last">&nbsp;</td>
                                                                      </tr>
                                                                    </table>
                                                                    <br /><br />
                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <th class="first">&nbsp;</th>
                                                                            <th>Onsite Finals</th>
                                                                            <th>Start</th>
                                                                            <th>End</th>
                                                                            <th># of Participants</th>
                                                                            <th class="last">&nbsp;</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Finals</td>
                                                                            <td class="first last alignText">Tuesday, June 2, 2009<br />
                                                                            8:30 a.m.***</td>
                                                                            <td class="first last alignText">Tuesday, June 2, 2009<br />5:00 p.m.***</td>
                                                                            <td class="first last alignText">10</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                    <br /><br />
                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <th class="first">&nbsp;</th>
                                                                            <th colspan="2">Important Dates</th>
                                                                            <th class="last">&nbsp;</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Last day to request a visa letter</td>
                                                                            <td class="first last alignText">April 15, 2009 at 5:00 p.m.**</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Finalists documents due</td>
                                                                            <td class="first last alignText">April 27, 2009 at 5:00 p.m.**</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                    </table></p>
                                                                    <p><em>*Times listed in Eastern Standard Time (UTC/GMT -5).<br />
                                                                        **Times listed in Eastern Daylight Time (UTC/GMT -4).<br />
                                                                        ***Times listed in Pacific Daylight Time (UTC/GMT -7).
                                                                        </em></p>
                                                                    <p>In the event that a round must be cancelled for any reason, the round will start the following day at the same time.</p>
                                                                </div>
                                                            </div>
                                                        <!-- SECONDARY NAV2 CONTENT  -->
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
