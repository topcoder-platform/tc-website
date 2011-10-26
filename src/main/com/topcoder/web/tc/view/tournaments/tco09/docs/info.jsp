<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Schedule of Onsite Events" area="overview" menu="onsite" subMenu="schedule"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
</head>

<body>

<div id="wrapper" class="homepage singlePage"><!-- the outest whole website wrapper -->

    <jsp:include page="../includes/logo.jsp"/>

    <div id="content">
        <div class="contentInner">

            <jsp:include page="../includes/menu.jsp"/>

            <div id="mainbody" class="singleMainBody"><!-- below menu ,main content -->
                <span class="leftTop"></span><!-- main content left top corner -->
                <span class="rightTop"></span><!-- main content right top corner -->
                <span class="leftBottom"></span><!-- main content left bottom corner -->
                <span class="rightBottom"></span><!-- main content right bottom corner -->

                <jsp:include page="subMenu.jsp"/>

                <div class="bigColumn">
			<div class="text">
			<h2 class="pageTitle">Important Information Needed*</h2><!-- page title -->                      
                        </div>
                        
                        
                        <div class="text">
							<p><strong>Please read all instructions carefully before proceeding.</strong></p>
                          <p>Congratulations on your performance in the 2010 TopCoder Open.</p>
                            <p><strong>To be completed by 17:00 UTC -4 Monday, August 23, 2010:</strong></p>
                            <ol class="textlist">
                              <li><strong>UPDATE YOUR MEMBER PROFILE -</strong><strong>&nbsp;</strong>your member profile&nbsp;<em><strong>must be accurate and complete.</strong></em>&nbsp;You will not receive any cash or prizes unless your profile is complete.</li>
                              <li><strong>CONFIRMATION OF ATTENDANCE/PROOF OF TRAVEL DOCUMENTS -</strong><strong>&nbsp;</strong>Please&nbsp;<a href="mailto:jford@topcoder.com"><strong>email Jessie D'Amato Ford</strong></a>&nbsp;to confirm your attendance onsite. If you have advanced as a finalist in more than one competition, please note in your confirmation if you will compete in both and please choose which competition you will compete in if the two competitions overlap onsite. If you require a passport and/or visa to visit the United States, you must show proof of your documents via a scanned copy of the necessary documents. This proof can be emailed.</li>
                              <li><strong>QUESTIONNAIRE -</strong><strong>&nbsp;</strong>View the&nbsp;<a href="http://www.topcoder.com/tc?module=ViewSurvey&amp;sid=30680"><strong>2010 TopCoder Open Questionnaire.</strong></a>&nbsp;NOTE: All questions are mandatory and may be included in the 2010 TCO Program or used in onsite introductions, at TopCoder's sole discretion.</li>
                              <li><strong>Affidavit of Eligibility and Liability and Publicity</strong> <strong>Release</strong> - TopCoder must receive the original copy of a notarized affidavit unless a notarized affidavit is already on file with TopCoder. The document must be postmarked by August 23, 2010, and must be sent in such a manner that it will arrive at TopCoder no later than September 23, 2010.</li>
                              <li><strong>TAX FORM -</strong><strong>&nbsp;</strong>must be mailed to TopCoder Payments and postmarked on or before Monday, August 23. They can be mailed to: TopCoder, Inc., Attn: Payments, 95 Glastonbury Blvd, Glastonbury, CT 06033, USA. If you already have a tax form on file with TopCoder, you do not have to send in a new one.<br />
                                <br />
                                You must complete, sign and return the appropriate tax form (Form W-9 or Form W-8BEN). If you don't know which form applies to you, please refer to the instructions below:&nbsp;<br />
                                <br />
                                <strong>Instructions</strong><br />
                                Form W-9 Instructions:&nbsp;<a href="https://www.topcoder.com/contest/iw9.pdf"><strong>here</strong></a>&nbsp;(W9)<br />
                                Form W-8BEN Instructions:&nbsp;<a href="https://www.topcoder.com/contest/iw8ben.pdf"><strong>here</strong></a>&nbsp;(W8)<br />
                                <br />
                                <strong>Tax Forms</strong><br />
                                Form W-9&nbsp;<a href="https://www.topcoder.com/contest/fw9.pdf"><strong>here</strong></a>&nbsp;(W9)<br />
                                Form W-8BEN&nbsp;<a href="https://www.topcoder.com/contest/fw8ben.pdf"><strong>here</strong></a>&nbsp;(W8)</li>
                              <li><strong>TRAVEL FORM -</strong><strong>&nbsp;</strong>Once you confirm your attendance, Jessie will send you the travel form to fill out. Please note that once you submit the travel form, your flight will be booked.</li>
                              <li><strong>MEMBER PHOTO -</strong><strong>&nbsp;</strong>Please submit your headshot if you do not already have one on file&nbsp;<a href="https://www.topcoder.com/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto"><strong>here.</strong></a></li>
                            </ol>
                            <p>&nbsp;<strong>If TopCoder already has a notarized affidavit, tax form, or Assignment Agreement on file for an Onsite Competitor, the Onsite Competitor may affirm such document online.</strong></p>
                            <p><strong>Reminder, you will not be able to attend the onsite event unless all above items are completed by 17:00 UTC-4 on August 23, 2010.</strong></p>
                            <p>If you have questions, please contact&nbsp;<a href="mailto:jford@topcoder.com"><strong>Jessie D'Amato Ford.</strong></a></p>
<p>&nbsp;</p>
                            
                            
                            
                            
                            
                        </div>
                </div>

                <jsp:include page="../includes/sponsors.jsp"/>

                <div class="clear"></div>
            </div>
            <!--End .mainbody-->

        </div>
        <!--End .contentInner-->
    </div>
    <!--End .content-->

    <jsp:include page="../includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
