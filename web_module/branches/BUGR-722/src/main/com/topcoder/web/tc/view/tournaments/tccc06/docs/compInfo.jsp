<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
</head>
<%ResultSetContainer info = (ResultSetContainer) ((Map) request.getAttribute("info")).get("Affidavit_Info");%>

<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp">
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="details"/>
    <jsp:param name="tabLev3" value=""/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
<tr valign=top>
<td valign=top align=center>
<div class=bodySpacer>

<p class=bigTitle>Important Information Needed</p>
<span class=bodySubtitle>Please read all instructions carefully before proceeding.</span><br/>

<p>
    Congratulations on your performance in the 2006 TopCoder&#174; Collegiate Challenge, Sponsored by AOL&#174;.
</p>

<p><span class=bodySubtitle>To be completed by 5:00PM EDT (GMT/UTC -4) Tuesday, October 3, 2006:</span></p>

<ol>
    <li>
        <p><span class=bodySubtitle>UPDATE YOUR MEMBER PROFILE</span> - your member profile <u>must be accurate
            and complete</u>. You will not receive any cash prizes or a t-shirt unless your profile is complete.

        </p>
    </li>
    <li>
        <p>
            <span class=bodySubtitle>QUESTIONNAIRE</span> - View the <a href="/tc?module=ViewSurvey&sid=218">2006
            TopCoder Collegiate Challenge Questionnaire</a>. NOTE: All questions are mandatory. The answers to
            1-5 may be included in the 2006 TCCC Program or
            used in onsite introductions, at TopCoder's sole discretion. The answers to questions 6 - 15 will
            be provided to AOL.
        </p>
    </li>
    <li>
        <p>
            <span class=bodySubtitle>AFFIDAVIT</span> - must be affirmed online or notarized
            and postmarked on or before Tuesday, October 3. Documents that are sent must arrive at
            TopCoder by October 20, 2006. See <a href="/PactsMemberServlet?t=affidavit&c=affidavit_history">Affidavits
            page</a>
            for status of affidavits & tax forms due.
        </p>
    </li>

    <li>
        <% if (info.getIntItem(0, "has_tax_form") == 0) {%>
        <p><span class=bodySubtitle>TAX FORM</span> - must be faxed (to 860.657.4276), scanned and
            sent via email (<a href="mailto:payments@topcoder.com">payments@topcoder.com</a>), or
            postmarked on or before October 3. If sent by mail,
            it must be received at TopCoder by October 20, 2006.</p>

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
        <p><span class=bodySubtitle>TAX FORM</span>
            We already have your tax form on file. You do NOT need to complete and return another form.</p>
        <% }%>
    </li>
    <li>
        <p>
            <span class=bodySubtitle>Letter</span> from your college/university on official stationary that states you
            are a current
            full time student. The letter must be signed by an official university staff member.
            Alternatively, you can submit a photocopy of your ISIC card. Either the letter or
            the ISIC must be sent directly to TopCoder, Inc., Attn: Jessie D'Amato Ford, 703 Hebron Avenue (now 95 Glastonbury Blvd),
            Glastonbury, CT, USA 06033.
            Please revisit the
            <a href="http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tccc06&d3=comp_rules" target="_blank">component
                rules</a> for more information.
        </p>
    </li>

    <li>
        <p>
            <span class=bodySubtitle>TRAVEL FORM</span> - View the
            <a href="${sessionInfo.secureAbsoluteServletPath}?module=TourneyInfo&d1=tournaments&d2=tccc06&d3=docs&d4=compTravelInfo">Travel
                Information Page.</a>
        </p>
    </li>

    <li>
        <p><span class=bodySubtitle>MEMBER PHOTO</span></p>

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
                            <span class=bodySubtitle>Reminder, you will not advance as an onsite finalist unless all above
                            items are completed by 5:00 PM EDT on Tuesday, October 3, 2006.</span>
</p>

<p>If you have questions, please contact <a href="mailto:jdamato@topcoder.com">Jessie D'Amato Ford</a>.</p>

<p><br/></p>


</div>
</td>


<!-- Right Column-->
<td width=170 align=right>
    <jsp:include page="../right.jsp">
        <jsp:param name="level1" value="all"/>
    </jsp:include>
</td>

</tr>

</table>


<jsp:include page="../../../foot.jsp"/>

</body>

</html>
