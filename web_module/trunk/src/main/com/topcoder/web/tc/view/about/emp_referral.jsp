<%@  page
 language="java"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Working at TopCoder</title>

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
                <jsp:param name="node" value="working_tc"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="99%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="about_tc"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Working at TopCoder"/> 
        </jsp:include>
<br><br>
            <table border="0" cellspacing="0" cellpadding="0"  width="100%">
                <tr valign="top">
                    <td align="center"><img src="/i/about/emp_ref_promo_2.gif" alt="" width="500" height="150" border="0" /></td>
                </tr>
                <tr valign="top">
                    <td class="bodyText" width="100%"><br />
<!-- <H2>Help yourself by doing your friend a favor!</H2> -->
TopCoder knows that not only is our community filled with exceptional developers, but that everyone within the community has a friend who is equally as exceptional.  We'd like to know them, too!
<br><br>
<span class="bodySubTitle">How it works</span><br>
TopCoder is actively seeking high quality, experienced full time Project Managers and Application Architects to work on our ever-growing list of clients.  If you know someone who is interested in working as a PM or Architect, tell us.  If they're hired by TopCoder, you get paid!  The referring member (you) will receive $1,000 for every full time PM and/or Architect that we hire based on your referral.  
<br><br>
Don't delay &mdash; contact us at <a href="mailto:employeereferral@topcoder.com">employeereferral@topcoder.com</a> and let us know that you have an interested candidate.  We'll get in touch with you to receive the rest of the information.
<br><br>

<span class="bodySubTitle">Official Rules</span><br>
The following are the official rules for the Employee Referral Program:
<ul>
<li>Any TopCoder member can refer potential employee candidates.</li>
<li>Referrals will be honored for six months from the original referral date.</li>
<li>Referrals are accepted only for full time Project Manager and Application Architect positions as described on the Working at TopCoder page.</li>
<li>Candidates already credited to some other source (advertising, employment agency or their own initiative) are not eligible for referrals.</li>
<li>If more than one member refers the same candidate, the referral award will be given to the first member to refer the candidate.</li>
<li>Only candidates who are legal residents of the United States and Canada are eligible for the referral fee.</li>
<li>To be eligible as a referral, a candidate must not have been employed on TopCoder's payroll or as an independent contractor with TopCoder within the previous 12 months of member referral.</li>
<li>To receive a referral commission, the TopCoder member must be 18 years of age or older at the time of the referral and must not have been permanently suspended from participating in any TopCoder competitions.</li>
<li>TopCoder will pay a total referral commission of $1,000 as follows:
    <ul>
    <li>$500 upon the start date of the referred candidate</li>
    <li>$500 after 90 days if the referred candidate is still employed with TopCoder, Inc.</li>
    </ul>
    </li>
<li>Payment is contingent upon TopCoder receiving a completed affidavit of eligibility, verifying the member's eligibility to participate in the Employee Referral Program, and a completed appropriate tax form.</li>
<li>TopCoder prohibits members from "spamming" individuals with unsolicited emails in an attempt to entice them to work for TopCoder. Sending such unsolicited emails may lead to TopCoder account termination.</li>
<li>All inquiries concerning program rules, procedures and eligibility should be sent to <a href="mailto:employeereferral@topcoder.com">employeereferral@topcoder.com</a>.</li>
</ul>
<br />
TopCoder reserves the right to modify or cancel the Employee Referral Program, in whole or in part, at any time for any reason. 
                    </td>
                </tr>
            </table>
 
            <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
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
