<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>
<%ResultSetContainer info = (ResultSetContainer) ((Map) request.getAttribute("info")).get("Affidavit_Info");%>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="algorithm"/>
                    <jsp:param name="tabLev2" value="description"/>
                    <jsp:param name="tabLev3" value=""/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">

                        <h1><span>Important Information Needed</span></h1>

<h2>Please read all instructions carefully before proceeding.</h2>

<p>
    Congratulations on your performance in the 2007 TopCoder&#174; Open, Sponsored by AOL&#174;.
</p>

<p><strong>To be completed by 5:00PM EDT (GMT/UTC -4) Friday, May 18, 2007:</strong></p>

<ol>
    <li>
        <p><strong>UPDATE YOUR MEMBER PROFILE</strong> - your member profile <u>must be accurate
            and complete</u>. You will not receive any cash or prizes or a t-shirt unless your profile is complete.

        </p>
    </li>
    <li>
        <p><strong>Confirmation of attendance/proof of travel documents</strong> - Please email <a href="mailto:jdamato@topcoder.com">Jessie D'Amato Ford</a>
            to confirm your attendance onsite.  For anyone that has advanced as a finalist in more than one competition,
            please note which competition you will compete in onsite. If you require a passport and/or visa to visit the
            United States, you must show proof of your documents via a scanned copy of the necessary documents.</p>
    </li>
    <li>
        <p>
            <strong>QUESTIONNAIRE</strong> - View the <a href="/tc?module=ViewSurvey&amp;sid=16630">2007
            TopCoder Open Questionnaire</a>. NOTE: All questions are mandatory. The answers to
            1-6 may be included in the 2007 TCO Program or
            used in onsite introductions, at TopCoder's sole discretion. 
        </p>
    </li>
    <li>
        <p>
            <strong>AFFIDAVIT</strong> - must be affirmed online or notarized
            and postmarked on or before Friday, May 18. Documents that are sent must arrive at
            TopCoder by June 3, 2007. See <a href="/PactsMemberServlet?module=AffidavitHistory">Affidavits
            page</a>
            for status of affidavits due.
        </p>
    </li>

    <li>
        <% if (info.getIntItem(0, "has_tax_form") == 0) {%>
        <p><strong>TAX FORM</strong> - must be mailed to TopCoder Payments and postmarked on or before Friday, May 18.
            They can be mailed to:  TopCoder, Inc., Attn:  Payments, 703 Hebron Avenue (now 95 Glastonbury Blvd), Glastonbury, CT 06033, USA.
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
            <a href="${sessionInfo.secureAbsoluteServletPath}?module=TourneyInfo&amp;d1=tournaments&amp;d2=tco07&amp;d3=docs&amp;d4=algTravelInfo">Travel
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
                            items are completed by 5:00 PM EDT on Friday, May 18, 2007.</strong>
</p>

<p>If you have questions, please contact <a href="mailto:jdamato@topcoder.com">Jessie D'Amato Ford</a>.</p>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
