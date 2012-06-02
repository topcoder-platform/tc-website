<%@  page
 language="java"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Employee Referrals</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="referrals"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">

<div align="center" style="margin-bottom: 10px;">
<img src="/i/my_home/empReferrals20070517.jpg" alt="" border="0" />
</div>

<span class="bigTitle">Overview</span>
<br><br>
TopCoder knows that not only is our community filled with exceptional developers, but that everyone within the community has a friend who is equally as exceptional. We'd like to know them, too!&nbsp; <br><br>
<span class="bodySubTitle">How it works</span><br>
TopCoder is actively seeking a high quality, experienced full time Platform Manager to work on our ever-growing list of clients. If you know someone who is interested in working as a PM, tell us. If they're hired by TopCoder, you get paid! The referring member (you) will receive $1,000 for the full time PM that we hire based on your referral.&nbsp; <br><br>
Don't delay &mdash; contact us at&nbsp;<a href="mailto:jobs@topcoder.com">jobs@topcoder.com</a>&nbsp;and let us know that you have an interested candidate. We'll get in touch with you to receive the rest of the information.&nbsp;<br><br>

<span class="bodySubTitle">Official Rules</span><br>
The following are the official rules for the Employee Referral Program:
<ul>
<li>Any TopCoder member can refer potential employee candidates.&nbsp;</li>
<li>Referrals will be honored for six months from the original referral date.&nbsp;</li>
<li>Referrals are accepted only for the full time Platform Manager position as described on the Working at TopCoder page.&nbsp;</li>
<li>Candidates already credited to some other source (advertising, employment agency or their own initiative) are not eligible for referrals.&nbsp;</li>
<li>If more than one member refers the same candidate, the referral award will be given to the first member to refer the candidate.&nbsp;</li>
<li>Only candidates who are legal residents of the United States and Canada are eligible for the referral fee.&nbsp;</li>
<li>To be eligible as a referral, a candidate must not have been employed on TopCoder's payroll or as an independent contractor with TopCoder within the previous 12 months of member referral.&nbsp;</li>
<li>To receive a referral commission, the TopCoder member must be 18 years of age or older at the time of the referral and must not have been permanently suspended from participating in any TopCoder competitions.&nbsp;</li>
<li>TopCoder will pay a total referral commission of $1,000 as follows:&nbsp; $1,000 after 90 days if the referred candidate is still employed with TopCoder, Inc.&nbsp;</li>
<li>Payment is contingent upon TopCoder receiving a completed affidavit of eligibility, verifying the member's eligibility to participate in the Employee Referral Program, and a completed appropriate tax form.&nbsp;</li>
<li>TopCoder prohibits members from "spamming" individuals with unsolicited emails in an attempt to entice them to work for TopCoder. Sending such unsolicited emails may lead to TopCoder account termination.&nbsp;</li>
<li>All inquiries concerning program rules, procedures and eligibility should be sent to&nbsp;<a href="mailto:jobs@topcoder.com">jobs@topcoder.com</a>.&nbsp;</li>
</ul>
<br />
TopCoder reserves the right to modify or cancel the Employee Referral Program, in whole or in part, at any time for any reason. 

<br><br>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="about"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
