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

                                    <jsp:include page="../topArea.jsp"/>
                                
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <jsp:include page="../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="onsite"/>
                                            </jsp:include>

                                            <jsp:include page="../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="onsite"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Important Information Needed</h2>
                                                                	<p>&nbsp;</p>
                                                                        <div class="subtitle">
                                                                            <h3 class="subtitle">Please read all instructions carefully before proceeding.</h3>
                                                                          <p>Congratulations on your performance in the 2009 TopCoder Open.</p>
                                                                                <p><strong>To be completed by 5:00PM EDT (GMT/UTC -4) Monday, April 27, 2009:</strong></p>
                                                                                    <ol>
                                                                                      <li><strong>UPDATE YOUR MEMBER PROFILE - </strong>your member profile <strong><em>must be accurate and complete.</em></strong> You will not receive any cash or prizes unless your profile is complete.</li>
                                                                                        <li><strong>CONFIRMATION OF ATTENDANCE/PROOF OF TRAVEL DOCUMENTS - </strong>Please <a href="mailto:jford@topcoder.com">email Jessie D'Amato Ford</a> to confirm your attendance onsite. If you have advanced as a finalist in more than one competition, please note in your confirmation if you will compete in both and please choose which competition you will compete in if the two competitions overlap onsite. If you require a passport and/or visa to visit the United States, you must show proof of your documents via a scanned copy of the necessary documents. This proof can be emailed.</li>
                                                                                        <li><strong>QUESTIONNAIRE - </strong>View the <a href="http://www.topcoder.com/tc?module=ViewSurvey&amp;sid=28564">2009 TopCoder Open Questionnaire.</a> NOTE: All questions are mandatory and may be included in the 2009 TCO Program or used in onsite introductions, at TopCoder's sole discretion.</li>
                                                                                        <li><strong>VIDEO – </strong>Please upload a video to the <a href="http://www.youtube.com/user/TopCoderOpen2009">TCO09 channel</a> if you have not done so already.   Video must include your name, handle, and country.  Since these will be showcased onsite, make sure the sound is audible and the lighting is good.   Please send the link of your video to <a href="mailto:jford@topcoder.com">Jessie D'Amato Ford.</a> If you have difficulty with the video requirement, please email <a href="mailto:jford@topcoder.com">Jessie D'Amato Ford.</a><br />
</li>
                                                                                        <li><strong>AFFIDAVIT - </strong>must be affirmed online or notarized and postmarked on or before Monday, April 27 Documents that are sent must arrive at TopCoder by May 22, 2009. See Affidavits page for status of affidavits due.</li>
                                                                                        <li><strong>TAX FORM - </strong>must be mailed to TopCoder Payments and postmarked on or before Monday, April 27 They can be mailed to: TopCoder, Inc., Attn: Payments, 95 Glastonbury Blvd, Glastonbury, CT 06033, USA. If you already have a tax form on file with TopCoder, you do not have to send in a new one.<br /><br />
                                                                                        	You must complete, sign and return the appropriate tax form (Form W-9 or Form W-8BEN). If you don't know which form applies to you, please refer to the instructions below:
                                                                                            <br /><br />
                                                                                            <strong>Instructions</strong><br />
                                                                                            Form W-9 Instructions: <a href="https://www.topcoder.com/contest/iw9.pdf">here</a> (W9)<br />
                                                                                            Form W-8BEN Instructions: <a href="https://www.topcoder.com/contest/iw8ben.pdf">here</a> (W8)<br />
                                                                                            <br />
                                                                                            <strong>Tax Forms</strong><br />
                                                                                            Form W-9 <a href="https://www.topcoder.com/contest/fw9.pdf">here</a> (W9)<br />
                                                                                            Form W-8BEN <a href="https://www.topcoder.com/contest/fw8ben.pdf">here</a> (W8)                                                                                      </li>
                                                                                        <li><strong>TRAVEL FORM - </strong>Once you confirm your attendance, Jessie will send you the travel form to fill out.  Please note that once you submit the travel form, you flight will be booked.</li>
                                                                                        <li><strong>MEMBER PHOTO - </strong>Please submit your headshot if you do not already have one on file <a href="https://www.topcoder.com/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto">here.</a></li>
                                                                                    </ol>
                                                                          <p><strong>Reminder, you will not be able to attend the onsite event unless all above items are completed by 5:00 PM EDT on April 27, 2009.</strong></p>
                                                                                <p>If you have questions, please contact <a href="mailto:jford@topcoder.com">Jessie D'Amato Ford.</a></p>
                                                            </div>
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
