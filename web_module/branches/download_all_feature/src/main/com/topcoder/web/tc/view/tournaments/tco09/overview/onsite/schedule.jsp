<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows onsite schedule page.
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
                                                <jsp:param name="secondaryTab" value="onsite"/>
                                            </jsp:include>

                                            <jsp:include page="../../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="onsite"/>
                                                <jsp:param name="tertiaryTab" value="schedule"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>   
                                                            <div class="pageContent">
                                                                <h2 class="title">Schedule of Onsite Events*</h2>
                                                                    <br /><div>
                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <th class="first">&nbsp;</th>
                                                                            <th colspan="2">Monday, June 1, 2009</th>
                                                                            <th class="last">&nbsp;</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText" width="40%">8:00 p.m. - 9:30 p.m.</td>
                                                                            <td class="first last alignText" width="60%">Welcome Reception</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                    <br /><br />
                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <th class="first">&nbsp;</th>
                                                                            <th colspan="2">Tuesday, June 2, 2009</th>
                                                                            <th class="last">&nbsp;</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText" width="40%">8:30 a.m. - 5:00 p.m.</td>
                                                                            <td class="first last alignText" width="60%">Marathon Finals</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">10:30 a.m. - 12:00 p.m.</td>
                                                                            <td class="first last alignText">Mod Dash Round 1</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">12:00 p.m. - 1:30 p.m.</td>
                                                                            <td class="first last alignText">Lunch</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">12:30 p.m. - 5:00 p.m.</td>
                                                                            <td class="first last alignText">Studio Finals 1</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                          <td class="first">&nbsp;</td>
                                                                          <td class="first last alignText">1:00 p.m. - 1:45 p.m.</td>
                                                                          <td class="first last alignText">Innovating Technical Writing Through Competitions Round Table</td>
                                                                          <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                          <td class="first">&nbsp;</td>
                                                                          <td class="first last alignText">2:00 p.m. - 2:45 p.m.</td>
                                                                          <td class="first last alignText">Specification and Conceptualization Round Table</td>
                                                                          <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                          <td class="first">&nbsp;</td>
                                                                          <td class="first last alignText">3:00 p.m. - 3:45 p.m.</td>
                                                                          <td class="first last alignText">Architecture and Assembly Round Table</td>
                                                                          <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">5:00 p.m. - 6:00 p.m.</td>
                                                                            <td class="first last alignText">Dinner</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                          <td class="first">&nbsp;</td>
                                                                          <td class="first last alignText">6:00 p.m. - 10:00 p.m.</td>
                                                                          <td class="first last alignText">Competitor Game Room and Poker Tournament</td>
                                                                          <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                    <br /><br />
                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <th class="first">&nbsp;</th>
                                                                            <th colspan="2">Wednesday, June 3, 2009</th>
                                                                            <th class="last">&nbsp;</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText" width="40%">8:30 a.m. - 1:00 p.m.</td>
                                                                            <td class="first last alignText" width="60%">Studio Finals 2</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">10:30 a.m. - 12:00 p.m.</td>
                                                                            <td class="first last alignText">Mod Dash Round 2</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">12:00 p.m. - 1:30 p.m.</td>
                                                                            <td class="first last alignText">Lunch</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                          <td class="first">&nbsp;</td>
                                                                          <td class="first last alignText">2:00 p.m. - 2:45 p.m.</td>
                                                                          <td class="first last alignText">Components Round Table</td>
                                                                          <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                          <td class="first">&nbsp;</td>
                                                                          <td class="first last alignText">3:00 p.m. - 3:45 p.m.</td>
                                                                          <td class="first last alignText">AOL/TopCoder Sensations Developer Challenge Forum</td>
                                                                          <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">2:30 p.m. - 5:00 p.m.</td>
                                                                            <td class="first last alignText">Algorithm Semifinal</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">5:00 p.m. - 6:00 p.m.</td>
                                                                            <td class="first last alignText">Dinner</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                    <br /><br />
                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <th class="first">&nbsp;</th>
                                                                            <th colspan="2">Thursday, June 4, 2009</th>
                                                                            <th class="last">&nbsp;</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText" width="40%">9:30 a.m. - 11:00 a.m.</td>
                                                                          <td class="first last alignText" width="60%">Mod Dash Round 3</td>
                                                                          <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                          <td class="first">&nbsp;</td>
                                                                          <td class="first last alignText">11:00 a.m. - 11:45 a.m.</td>
                                                                          <td class="first last alignText">TopCoder Q &amp; A, Featuring Jack Hughes, Founder, and TopCoder staff</td>
                                                                          <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">12:00 p.m. - 1:30 p.m.</td>
                                                                            <td class="first last alignText">Lunch</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">12:30 p.m. - 3:00 p.m.</td>
                                                                            <td class="first last alignText">Algorithm Finals</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">3:30 p.m. - 4:00 p.m.</td>
                                                                            <td class="first last alignText">Winner Announcements</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">7:00 p.m. - 9:00 p.m.</td>
                                                                            <td class="first last alignText">Awards Reception</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                  </table>
                                                                  <p><strong>Please note all competition rounds here include 30 minute set up time.</strong></p>
                                                                  <p><em>*Schedule subject to change with or without notice.</em></p>
                                                                </div>
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
