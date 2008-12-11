<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>TopCoder High School 2008</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../../script.jsp"/>
</head>
<body>
<%ResultSetContainer info = (ResultSetContainer) ((Map) request.getAttribute("info")).get("Affidavit_Info");%>

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value=""/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    <div id="main"><div id="mainwrapper">
    
        <div id="title">
            <h2>Important Information Needed</h2>
        </div><%-- #title --%>
        
        <div id="content">

<h2>Please read all instructions carefully before proceeding.</h2>

<p>
    Congratulations on your performance in the 2008 TopCoder&#174; High School Tournament.
</p>

<p><strong>To be completed by 5:00PM EST (GMT/UTC -5) Monday, February 18, 2008:</strong></p>

<ol>
    <li>
        <p><strong>UPDATE YOUR MEMBER PROFILE</strong> - your member profile <u>must be accurate
            and complete</u>. You will not receive any cash or a t-shirt unless your profile is complete.

        </p>
    </li>
    <li>
        <p><strong>Confirmation of attendance/proof of travel documents</strong> - Please email <a href="mailto:jdamato@topcoder.com">Jessie D'Amato Ford</a>
            to confirm your attendance onsite.  If you require a passport and/or visa to visit the
            United States, you must show proof of your documents via a scanned copy of the necessary documents.</p>
    </li>
    <li>
        <p>
            <strong>QUESTIONNAIRE</strong> - View the <a href="/tc?module=ViewSurvey&amp;sid=21920">
            2008 TopCoder High School Competitor Questionnaire</a>. NOTE: All questions are mandatory and may be included in the 
            2008 TCHS Program or used in onsite introductions, at TopCoder's sole discretion.
        </p>
    </li>
    <li>
        <p>
            <strong>AFFIDAVIT</strong> - must be affirmed online or notarized and postmarked on or before Monday, February 18, 2008. Documents that 
            are sent must arrive at TopCoder by March 7, 2008. See <a href="/PactsMemberServlet?module=AffidavitHistory">Affidavits
            page</a> for status of affidavits due.
        </p>
    </li>

    <li>
        <% if (info.getIntItem(0, "has_tax_form") == 0) {%>
        <p><strong>TAX FORM</strong> - must be mailed to TopCoder Payments and postmarked on or before  Monday, February 18, 2008.
            They can be mailed to: TopCoder, Inc., Attn: Jessie D'Amato Ford, 95 Glastonbury Blvd, Glastonbury, CT 06033, USA.
        </p>

        <p>You must complete, sign and return the appropriate tax form (Form W-9 or Form W-8BEN). If you don't
            know which form
            applies to you, please refer to the instructions below:</p>

        <p>Instructions<br/>
            Form W-9 Instructions: <a href="/contest/iw9.pdf">here (W9)</a><br/>
            Form W-8BEN Instructions: <a href="/contest/iw8ben.pdf">here (W8)</a></p>

        <p>Tax Forms<br/>
            Form W-9 <a href="/contest/fw9.pdf">here (W9)</a><br/>
            Form W-8BEN <a href="/contest/fw8ben.pdf">here (W8)</a></p>
        <% } else { %>
        <p><strong>TAX FORM</strong>
            We already have your tax form on file. You do NOT need to complete and return another form.</p>
        <% }%>
    </li>
    <li>
        <p>
            <strong>TRAVEL FORM</strong> - View the
            <a href="${sessionInfo.secureAbsoluteServletPath}?module=TourneyInfo&amp;d1=tournaments&amp;d2=tchs08&amp;d3=docs&amp;d4=hsTravelInfo">Travel
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

    <li>
        <p><strong>Letter</strong></p>

    <p>Letter from your secondary school on official stationary that states you are currently a full time student.
        The letter must be written in English and signed by an official school staff member. The letter must be sent
        directly by a school official to TopCoder, Inc., Attn: Jessie D'Amato Ford, 95 Glastonbury Blvd, Glastonbury,
        CT, 06033, USA, and must arrive no later than March 7, 2008.</p>

    </li>
    <li>
        <p><strong>Travel Waiver</strong></p>
        <p>Must be completed for all competitors. TopCoder must receive the original signed Travel Waiver. The document
            must be postmarked by February 18, 2008, and must be sent in such a manner that it will arrive at TopCoder no
            later than March 7, 2008.   Please select the correct travel waiver.  If you will be 18 as of Friday, March
            14 than please select the 18+ waiver.
        </p>
        <p>
            <a href="/pdfs/tournaments/tchs08/TopCoder_High_School_travel_waiver_minor.pdf">Download this version if you are under 18 years old.</a>
            <br /><a href="/pdfs/tournaments/tchs08/TopCoder_High_School_travel_waiver.pdf">Download this version if you are 18+ years old.</a>
        </p>
    </li>




</ol>

<p>
                            <strong>Reminder, you will not advance as an onsite finalist unless all above
                            items are completed by 5:00 PM EDT on Monday, February 18, 2008.</strong>
</p>

<p>If you have questions, please contact <a href="mailto:jdamato@topcoder.com">Jessie D'Amato Ford</a>.</p>


        </div><%-- #content --%>
        
        <jsp:include page="../footer.jsp" />

        </div></div>


</div><%-- #wrapper --%>

</body>
</html>