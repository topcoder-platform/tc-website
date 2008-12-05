<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Referrals</title>
<meta http-equiv="refresh" content="0;http://tcstudioblogs.com/?page_id=70"
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
            <jsp:param name="node" value="my_topcoder"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="myTCBody">

<DIV ALIGN="CENTER"><IMG SRC="/i/referral_header.gif" WIDTH="510" HEIGHT="40" BORDER="0"/></DIV>
<P><STRONG>The TopCoder Referral Program is designed to increase the number of top-performing creative talents who participate in TopCoder Studio competitions, and to reward those members who spread the word.</STRONG></P>

<p style="color:#FF0000;font-weight:bold;">As of December 5, 2008 at 5pm (EST), the TopCoder Referral Program will only be available for referring new members of TopCoder who compete and win TopCoder Studio competitions.  In other words, TopCoder is discontinuing the Referral Program for all competitions other than for TopCoder Studio.  By way of example, if a Referred Member signs up on December 6, 2008 and wins both a storyboard design competition and a component design competition on December 10, 2008, the Referring Member will receive a referral payment for the Storyboard Competition, but not for the Component Competition.  For members referred prior to December 5, the original referral program for all competitions will continue for 12 months from the referred member’s registration.</p>

<div style="float:right; width: 200px; background-color:#EEEEEE; border: 1px solid #999999; padding: 10px; margin: 10px;">
<STRONG>Example #1</STRONG><br>
You refer 3 new members. During the next 12 months, each of the 3 members you referred wins $500 in Studio competitions, totaling $1,500 in prize money awarded. You will receive a commission of $150. 
<br><br>
<STRONG>Example #2</STRONG><br>
You refer a new member who wins one of the grand prizes of $25,000 in a TopCoder event or contest. You will receive $2,500!!! 
</div>


<P><STRONG><font size="4">How it works</font></STRONG></P>
<p>On the member registration page, there is a "Referring Member" field. If you tell an individual to register with TopCoder Studio, ask him or her to provide your handle in the "Referring Member" field.</p>

<p>The referring member (you) will receive a referral commission equal to 10% of any amounts earned or won by the referred member during the 12 months following registration.</p>

<p>TopCoder will keep track of all member commissions earned and will pay them out at the end of each quarter. 
The "Referring Member" field in the registration cannot be changed once the registration process has been completed. Therefore, please ensure that any referred member provides the correct handle upon registering with TopCoder.</p>


<P><STRONG><font size="4">Official Rules</font></STRONG></p>

<p>Any eligible TopCoder member whose TopCoder handle was provided in the "Referring Member" field of the TopCoder registration process will be placed into the Referral Program.</p>

<p>TopCoder will pay a referral commission equal to 10% of any amount earned or won by a referred member during the 365-day period following the initial registration date of the referred member. No additional referral compensation will be paid for a referred member's winnings or any other type of compensation or benefit following the one-year anniversary of the referred member's registration. </p>

<p>To receive a referral commission, the referring TopCoder member must be 18 years of age or older and must not have been permanently suspended from participating in any TopCoder competitions. Payment is contingent upon TopCoder receiving a completed affidavit of eligibility, verifying the referring member's eligibility to participate in the Referral Program, and a completed appropriate tax form.</p>

<p>The "Referring Member" field in the registration may not be changed once the registration process has been completed.
TopCoder prohibits members from "spamming" individuals with unsolicited emails in an attempt to entice people to register and participate at TopCoder. Sending such unsolicited emails may lead to your termination from the TopCoder Referral Program and other disciplinary action up to the permanent suspension or banning of your TopCoder account.</p>

<p>TopCoder reserves the right to modify or cancel the TopCoder Referral Program at any time for any reason. TopCoder also reserves the right to disqualify any TopCoder member from the TopCoder Referral Program at any time for any reason.</p>


        </div>
        <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="default"/>
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
