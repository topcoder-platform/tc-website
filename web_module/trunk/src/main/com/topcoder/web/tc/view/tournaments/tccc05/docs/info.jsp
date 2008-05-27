<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 java.util.Map"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
</head>
<%ResultSetContainer info = (ResultSetContainer)((Map)request.getAttribute("info")).get("Affidavit_Info");%>

<body>

<!-- Tab barlinks-->
<jsp:include page="../links.jsp" >
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
                            Congratulations on your performance in the 2005 TopCoder Collegiate Challenge, Sponsored by Yahoo!
                        </p>

                        <p><span class=bodySubtitle>To be completed by everyone by 9:00 PM EST Wednesday, February 2:</span></p>

                            <ol>
                                <li>
                                    <p><span class=bodySubtitle>UPDATE YOUR MEMBER PROFILE</span> - your member profile <u>must be</u>
                                        accurate <u>and complete</u>.  You will not receive a cash prize or a t-shirt
                                        unless your profile is complete.
                                    </p>
                                </li>
                                <li>
                                <p>
                                    <span class=bodySubtitle>QUESTIONNAIRE</span> - Form must be completed and submitted by 9:00 PM EST on Wednesday, February 2.
                                    View the <a href="/tc?amp;module=ViewSurvey&sid=206">2005 TopCoder Collegiate Challenge Questionnaire</a>.
                                    NOTE: All questions are mandatory.  The answers to questions 1-17 may be included in the 2005 TCCC Program or
                                    used in onsite introductions, at TopCoder's discretion.  The answers to questions 18 - 22 will be
                                    provided to Yahoo!.

                                </p>
                                </li>
                                <li>
                                <p><span class=bodySubtitle>AFFIDAVIT</span> - must be affirmed online or notarized and postmarked on or before 9:00 PM EST on Wednesday, February 2.</p>
                                <p>See <a href="/PactsMemberServlet?t=affidavit&c=affidavit_history">Affidavits page</a> for status of affidavits due.</p>
                                </li>


                                <li>
                                    <p>
                                    <% if (info.getIntItem(0, "has_tax_form")==0) {%>
                                        <p><strong>TAX FORM</strong> - must be faxed to (860.657.4276), scanned and sent via email (<a href="mailto:mluce@topcoder.com">mluce@topcoder.com</a>), or postmarked on or before 9:00 PM EST on Wednesday, February 2.</p>
                                        <p>You must complete, sign and return the appropriate tax form (Form W-9 or Form W-8BEN).  If you don't know which form
                                        applies to you, please refer to the instructions below:</p>

                                        <p>Instructions<br/>
                                        Form W-9 Instructions: <a href="/contest/iw9.pdf">here (W9)</a><br/>
                                        Form W-8BEN Instructions: <a href="/contest/iw8ben.pdf">here (W8)</a></p>

                                        <p>Tax Forms<br/>
                                        Form W-9 <a href="/contest/fw9.pdf">here (W9)</a><br/>
                                        Form W-8BEN <a href="/contest/fw8ben.pdf">here (W8)</a></p>
                                    <% } else { %>
                                        <p><strong>TAX FORM</strong></p>
                                        We already have your tax form on file.  You do NOT need to complete and return another form.
                                    <% }%>
                                    </p>
                                </li>


                                <li>
                                <p><strong>HEAD SHOT</strong> - must be emailed by 9:00 PM EST on Wednesday, February 2.</p>
                                    <p>
                                    <% if (info.getIntItem(0, "has_image")==0) {%>
                                        <p>We do not have your headshot on file.  Click below to submit your headshot.</p>
                                        <div align="center"><a href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto"><img src="/i/m/nophoto_submit.gif" width="126" height="140" border="0"/></a></div>
                                    <% } else {%>
                                        We have a head shot on file. If you'd like to change it click <a href="/tc?module=UserStatic&amp;d1=my_home&amp;d2=submitPhoto">here</a>
                                    <% }%>
                                    </p>
                                </li>

                                <p>
                                <div align="center">
                                    Address to send affidavits & tax forms to:<br/>
                                    TopCoder, Inc. <br/>
                                    Attn: MaryBeth Luce<br/>
                                    703 Hebron Avenue (now 95 Glastonbury Blvd)<br/>
                                    Glastonbury, CT 06033
                                </div>
                                   </p>
                                <p><strong>Reminder, you will not receive any prize money for Round #4 unless all necessary items above are completed by 9:00 PM EST on Wednesday, February 2.  Any
                                items that need to be mailed via the postal service must be postmarked by this date.</strong></p>

                            </ol>
<%--
                            <p><strong>B. To be completed only by those who will be traveling to the onsite semifinal rounds on November 11 & 12 in Santa Clara, CA, USA.</strong></p>
                            <ol>
                                <li>
                                <p><strong>TRAVEL INFORMATION PAGE</strong> - form must be completed and submitted by 9:00 AM ET on Monday, October 18.</p>

                                <p>View the <a href="/?amp;t=affidavit&c=2004_open_travel_info">Travel Information Page.</a> Complete ALL questions.</p>
                                </li>

                            </ol>
--%>

                        <p>If you have questions, please contact <a href="mailto:mluce@topcoder.com" >MaryBeth Luce</a>.</p>
                        <p><br/></p>



        </div>
		</td>


<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../../public_right.jsp">
            <jsp:param name="level1" value="tccc05"/>
            </jsp:include>
         </td>

	</tr>

</table>




<jsp:include page="../../../foot.jsp" />

</body>

</html>
