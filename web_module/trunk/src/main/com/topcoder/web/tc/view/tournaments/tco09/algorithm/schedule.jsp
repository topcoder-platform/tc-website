<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows algorithm track schedule page.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Algorithm Competition</title>

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
                        <jsp:param name="mainTab" value="algorithm"/>
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
                                                <jsp:param name="mainTab" value="algorithm"/>
                                                <jsp:param name="secondaryTab" value="schedule"/>
                                            </jsp:include>
                
                                            <jsp:include page="../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="algorithm"/>
                                                <jsp:param name="secondaryTab" value="schedule"/>
                                                <jsp:param name="tertiaryTab" value=""/>
                                            </jsp:include>
                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                
                                                    
                                                    <div id="mainContentInner">
                                                        <div>
                                                        <!-- SECONDARY NAV2 CONTENT  -->
                                                            <div class="pageContent">
                                                                <h2 class="title">Algorithm Competition Schedule</h2>
                                                                <div>
                                                                    <p><strong>Registration</strong></p>
                                                                    <p>Registration for the 2009 TopCoder Open Algorithm Competition will open at 9:00 a.m. EST on Wednesday, February 11, 2009 and will close at 11:00 a.m. EDT on Wednesday, March 4, 2009.</p>
                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <th class="first">&nbsp;</th>
                                                                            <th>Online Qualifying Rounds</th>
                                                                            <th>Time</th>
                                                                            <th># of Participants</th>
                                                                            <th># of Advancers</th>
                                                                            <th class="last">&nbsp;</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Round 1</td>
                                                                            <td class="first last alignText">Tuesday, February 24, 2009<br />
                                                                               <strong>Register:</strong> 4:00 a.m. - 6:55 a.m.<br />
                                                                               <strong>START:</strong> 7:00 a.m.*</td>
                                                                            <td class="first last alignText">1,650</td>
                                                                            <td class="first last alignText">550</td>
                                                                            <td class="last">&nbsp;</td>
                                                                      </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Round 2</td>
                                                                            <td class="first last alignText">Saturday, February 28, 2009<br />
                                                                               <strong>Register:</strong> 9:00 a.m. - 11:55 a.m.<br />
                                                                               <strong>START:</strong> 12:00 p.m.*</td>
                                                                            <td class="first last alignText">1,650</td>
                                                                            <td class="first last alignText">550</td>
                                                                            <td class="last">&nbsp;</td>
                                                                      </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Round 3</td>
                                                                            <td class="first last alignText">Wednesday, March 4, 2009<br />
                                                                               <strong>Register:</strong> 6:00 p.m. - 8:55 p.m.<br />
                                                                               <strong>START:</strong> 9:00 p.m.*</td>
                                                                            <td class="first last alignText">1,650</td>
                                                                            <td class="first last alignText">550</td>
                                                                            <td class="last">&nbsp;</td>
                                                                      </tr>
                                                                    </table>
                                                                    <br /><br />
                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <th class="first">&nbsp;</th>
                                                                            <th>Online Elimination Rounds</th>
                                                                            <th>Time</th>
                                                                            <th># of Participants</th>
                                                                            <th># of Advancers</th>
                                                                            <th class="last">&nbsp;</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Round 1</td>
                                                                            <td class="first last alignText">Saturday, March 7, 2009<br />
                                                                               <strong>Register:</strong> 9:00 a.m. - 11:55 a.m.<br />
                                                                               <strong>START:</strong> <a href="http://timeanddate.com/worldclock/fixedtime.html?month=3&amp;day=7&amp;year=2009&amp;hour=12&amp;min=0&amp;sec=0&amp;p1=98">12:00 p.m.</a>*</td>
                                                                            <td class="first last alignText">Up to 1,800</td>
                                                                            <td class="first last alignText">720</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Round 2</td>
                                                                            <td class="first last alignText">Saturday, March 14, 2009<br />
                                                                               <strong>Register:</strong> 9:00 a.m. - 11:55 a.m.<br />
                                                                               <strong>START:</strong> <a href="http://timeanddate.com/worldclock/fixedtime.html?month=3&amp;day=14&amp;year=2009&amp;hour=12&amp;min=0&amp;sec=0&amp;p1=98">12:00 p.m.</a>**</td>
                                                                            <td class="first last alignText">720</td>
                                                                            <td class="first last alignText">300</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Round 3</td>
                                                                        <td class="first last alignText">Saturday, March 21, 2009<br />
                                                                               <strong>Register:</strong> 9:00 a.m. - 11:55 a.m.<br />
                                                                           <strong>START:</strong> <a href="http://timeanddate.com/worldclock/fixedtime.html?month=3&amp;day=21&amp;year=2009&amp;hour=12&amp;min=0&amp;sec=0&amp;p1=98">12:00 p.m.</a>**</td>
                                                                            <td class="first last alignText">300</td>
                                                                            <td class="first last alignText">120</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Round 4</td>
                                                                        <td class="first last alignText">Saturday, March 28, 2009<br />
                                                                               <strong>Register: </strong>9:00 a.m. - 11:55 a.m.<br />
                                                                           <strong>START:</strong> <a href="http://timeanddate.com/worldclock/fixedtime.html?month=3&amp;day=28&amp;year=2009&amp;hour=12&amp;min=0&amp;sec=0&amp;p1=98">12:00 p.m.</a>**</td>
                                                                            <td class="first last alignText">120</td>
                                                                            <td class="first last alignText">45</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Round 5</td>
                                                                        <td class="first last alignText">Saturday, April 4, 2009<br />
                                                                               <strong>Register:</strong> 9:00 a.m. - 11:55 a.m.<br />
                                                                           <strong>START:</strong> <a href="http://timeanddate.com/worldclock/fixedtime.html?month=4&amp;day=4&amp;year=2009&amp;hour=12&amp;min=0&amp;sec=0&amp;p1=98">12:00 p.m.</a>**</td>
                                                                            <td class="first last alignText">45</td>
                                                                            <td class="first last alignText">18</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                    </table>
                                                                    <br /><br />
                                                                    <table class="data" width="100%" cellpadding="0" cellspacing="0">
                                                                        <tr>
                                                                            <th class="first">&nbsp;</th>
                                                                            <th>Onsite Finals</th>
                                                                            <th>Start</th>
                                                                            <th># of Participants</th>
                                                                            <th># of Advancers</th>
                                                                            <th class="last">&nbsp;</th>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Semifinals</td>
                                                                            <td class="first last alignText">Wednesday, June 3, 2009<br />
                                                                              <a href="http://timeanddate.com/worldclock/fixedtime.html?month=6&amp;day=3&amp;year=2009&amp;hour=15&amp;min=0&amp;sec=0&amp;p1=127">3:00 p.m.</a>***</td>
                                                                            <td class="first last alignText">18</td>
                                                                            <td class="first last alignText">8</td>
                                                                            <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Championship Round</td>
                                                                            <td class="first last alignText">Thursday, June 4, 2009<br />
                                                                              <a href="http://timeanddate.com/worldclock/fixedtime.html?month=6&amp;day=4&amp;year=2009&amp;hour=12&amp;min=30&amp;sec=0&amp;p1=127">12:30 p.m.</a>***</td>
                                                                            <td class="first last alignText">8</td>
                                                                            <td class="first last alignText">&nbsp;</td>
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
                                                                            <td class="first last alignText">April 15, 2009 at <a href="http://timeanddate.com/worldclock/fixedtime.html?month=4&amp;day=15&amp;year=2009&amp;hour=17&amp;min=0&amp;sec=0&amp;p1=98">5:00 p.m.</a>**</td>
                                                                          <td class="last">&nbsp;</td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="first">&nbsp;</td>
                                                                            <td class="first last alignText">Finalists documents due</td>
                                                                            <td class="first last alignText">April 27, 2009 at <a href="http://timeanddate.com/worldclock/fixedtime.html?month=4&amp;day=27&amp;year=2009&amp;hour=17&amp;min=0&amp;sec=0&amp;p1=98">5:00 p.m.</a>**</td>
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
