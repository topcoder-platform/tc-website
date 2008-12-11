<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>2008 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body id="page_sub">
<%ResultSetContainer info = (ResultSetContainer) ((Map) request.getAttribute("info")).get("Affidavit_Info");%>

<div id="wrapper">


    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="joinus"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>


        <h2>Important Information Needed</h2>

            <div class="sub_content">

                <h3>Please read all instructions carefully before proceeding.</h3>

                <p>
                    Congratulations on your performance in the 2008 TopCoder Open.
                </p>
                
                <p><strong>To be completed by 5:00PM EDT (GMT/UTC -4) Wednesday, March 26, 2008:</strong></p>
                
                <ol>
                    <li>
                        <p><strong>UPDATE YOUR MEMBER PROFILE</strong> - your member profile <u>must be accurate
                            and complete</u>. You will not receive any cash or prizes or a t-shirt unless your profile is complete.
                
                        </p>
                    </li>
                    <li>
                        <p><strong>Confirmation of attendance/proof of travel documents</strong> - Please email <a href="mailto:jdamato@topcoder.com">Jessie D'Amato Ford</a>
                            to confirm your attendance onsite. If you have advanced as a finalist in more than one competition, please note in your
                            confirmation if you will compete in both and please choose which competition you will compete in if the two competitions
                            overlap onsite. If you require a passport and/or visa to visit the United States, you must show proof of your documents
                            via a scanned copy of the necessary documents.  This proof can be emailed.
                
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>QUESTIONNAIRE</strong> - View the <a href="/tc?module=ViewSurvey&amp;sid=22020">2008
                            TopCoder Open Questionnaire</a>. NOTE: All questions are mandatory and may be included in the 2008 TCO Program or
                            used in onsite introductions, at TopCoder's sole discretion.
                        </p>
                    </li>
                    <li>
                        <p>
                            <strong>AFFIDAVIT</strong> - must be affirmed online or notarized
                            and postmarked on or before Wednesday, March 26. Documents that are sent must arrive at
                            TopCoder by April 26, 2008. See <a href="/PactsMemberServlet?module=AffidavitHistory">Affidavits
                            page</a>
                            for status of affidavits due.
                        </p>
                    </li>
                
                    <li>
                        <% if (info.getIntItem(0, "has_tax_form") == 0) {%>
                        <p><strong>TAX FORM</strong> - must be mailed to TopCoder Payments and postmarked on or before Wednesday, March 26.
                            They can be mailed to:  TopCoder, Inc., Attn:  Payments, 95 Glastonbury Blvd, Glastonbury, CT 06033, USA.
                        </p>
                
                        <p>You must complete, sign and return the appropriate tax form (Form W-9 or Form W-8BEN). If you don't
                            know which form
                            applies to you, please refer to the instructions below:</p>
                
                        <p>Instructions<br />
                            Form W-9 Instructions: <a href="/contest/iw9.pdf">here (W9)</a><br />
                            Form W-8BEN Instructions: <a href="/contest/iw8ben.pdf">here (W8)</a></p>
                
                        <p>Tax Forms<br />
                            Form W-9 <a href="/contest/fw9.pdf">here (W9)</a><br />
                            Form W-8BEN <a href="/contest/fw8ben.pdf">here (W8)</a></p>
                        <% } else { %>
                        <p><strong>TAX FORM</strong>
                            We already have your tax form on file. You do NOT need to complete and return another form.</p>
                        <% }%>
                    </li>
                    <li>
                        <p>
                            <strong>TRAVEL FORM</strong> - View the
                            <a href="${sessionInfo.secureAbsoluteServletPath}?module=TourneyInfo&amp;d1=tournaments&amp;d2=tco08&amp;d3=docs&amp;d4=travelInfo">Travel
                                Information Page.</a>
                        </p>
                    </li>
                
                    <li>
                        <p><strong>MEMBER PHOTO</strong></p>
                
                        <p>
                            <% if (info.getIntItem(0, "has_image") == 0) {%>
                            <p>We do not have your headshot on file. Click below to submit your headshot.</p>
                
                            <div align="center">
                                <a href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto"><img src="/i/m/nophoto_submit.gif" width="126" height="140" border="0"/></a>
                            </div>
                            <% } else {%>
                            We have a head shot on file. If you'd like to change it click
                            <a href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto">here</a>
                            <% }%>
                        </p>
                    </li>
                
                
                </ol>
                
                <p>
                    <strong>Reminder, you will not advance as an onsite finalist unless all above
                    items are completed by 5:00 PM EDT on Wednesday, March 26, 2008.</strong>
                </p>
                
                <p>If you have questions, please contact <a href="mailto:jdamato@topcoder.com">Jessie D'Amato Ford</a>.</p>
                

            </div><%-- .sub_content --%>
        
    </div><%-- #content --%>
<jsp:include page="../footer.jsp" />
</div>

</body>

</html>
