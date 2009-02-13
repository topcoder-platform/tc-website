<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Referrals</title>

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
<P><STRONG>The TopCoder Referral Program is designed to increase the number of
top-performing coders who participate in TopCoder competitions, 
and to reward those TopCoder members who spread the word.</STRONG></P>

<div style="float:right; width: 200px; background-color:#EEEEEE; border: 1px solid #999999; padding: 10px; margin: 10px;">
<STRONG>Example #1</STRONG><br>
You refer 3 new members. During the next 12 months, each of the 3 members you referred wins $500 in component design and development 
competitions, totaling $1,500 in prize money awarded. You will receive a commission of $150.
<br><br>
<STRONG>Example #2</STRONG><br>
You refer a new member who wins one of the grand prizes of $25,000 in the TopCoder Open. You will receive $2,500!!!
</div>
<P><STRONG><font size="4">How it works</font></STRONG><br>
On the member registration page, there is a "Referring Member" field. If you tell a fellow coder to register with TopCoder, 
ask him or her to provide your handle in the "Referring Member" field.</P>

<P>The referring member (you) will receive a referral commission equal to 10% of any 
amounts earned or won by the referred member during the 12 months following registration.</P>


<P>TopCoder will keep track of all member commissions earned and will pay them out at the end of each quarter. </P>

<P>The "Referring Member" field in the registration cannot be changed once the registration process has been completed. 
Therefore, please ensure that any referred member provides the correct handle upon registering with TopCoder.</P>

<P><STRONG><font size="4">Official Rules</font></STRONG><br>
Any eligible TopCoder member whose TopCoder handle was provided in the "Referring Member" field of the TopCoder registration process will be placed into the Referral Program.</P>

<P>TopCoder will pay a referral commission equal to 10% of any amount earned or won by a referred member during the 365-day 
period following the initial registration date of the referred member. No additional referral compensation will be paid 
for a referred member's winnings following the one-year anniversary of the referred member's registration.  This includes amounts won during algorithm and component competitions, logo competitions, and amounts earned by referred members as Review Board members.</P>

<P>To receive a referral commission, the TopCoder member must be 18 years of age or older and must not have been permanently 
suspended from participating in TopCoder competitions.  Payment is contingent upon TopCoder receiving a completed affidavit 
of eligibility, verifying the member's eligibility to participate in the Referral Program, and a completed appropriate tax form.</P>

<P>The "Referring Member" field in the registration may not be changed once the registration process has been completed.</P>

<P>TopCoder prohibits members from "spamming" individuals with unsolicited emails in an attempt to entice people 
to register and participate at TopCoder. Sending such unsolicited emails may lead to your termination from the TopCoder Referral Program.</P>

<P>TopCoder reserves the right to modify or cancel the TopCoder Referral Program at any time for any reason. TopCoder also reserves 
the right to disqualify any TopCoder member from the TopCoder Referral Program at any time for any reason.</P>

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
