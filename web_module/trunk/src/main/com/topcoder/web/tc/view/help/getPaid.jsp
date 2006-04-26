<%@ page import="com.topcoder.web.common.WebConstants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

    <% String node = request.getParameter(WebConstants.LEFT_NAV_KEY);
        if (node!=null&&!(node.equals("algo_get_paid")||node.equals("des_get_paid")||node.equals("dev_get_paid"))) {
            node = null;
        }
    %>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
<%-- algo_get_paid or des_getting_paid or dev_get_paid --%>
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="<%=node==null?"":node%>"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="center" class="bodyColumn">
<div class="fixedWidthBody">
<jsp:include page="/page_title.jsp" >
   <jsp:param name="image" value="support"/>
   <jsp:param name="title" value="How to Get Paid"/>
</jsp:include>

<span class="title">How to Get Paid</span>
<br><br>
TopCoder begins the payment process for algorithm, design and development contests one business day after each contest is concluded. Design and development contests are over when either the winning submission goes through a successful final review, or when the contest is closed because no submission has passed screening or review. 
<br><br>
<strong>Timing</strong><br>
Once the payment process begins, TopCoder will send out your payment within 14 days. When you actually receive your payment will depend on the payment method you select.
<br><br>
<strong>Payment Methods</strong><br>
Members can be paid by check, by wire transfer, or by PayPal®. <A href="/tc?module=Static&d1=help&d2=paymentMethods&node=<%=node==null?"":node%>">Learn more</A>.
<br><br>
<strong>Requirements</strong><br>
Before TopCoder can process payment, we must have your full name and an accurate address in your member profile, as well as the required affidavits and completed tax form on file. 
<ul>
<li>Update your <A href="/Registration">member profile</A> now.</li>
</ul>

<% if (node.equals("algo_get_paid")) { %>
To receive payments from Algorithm Competitions, you must have submitted a notarized affidavit and affirmed the affidavit from the relevant competition online (note: does not apply to design or development competitions).  
<ul>
<li><A href="/tc?module=Static&d1=help&d2=affidavits&node=<%=node==null?"":node%>">Learn more about affidavits.</A></li>
<li>Affidavits can also be used to <A href="/tc?module=Static&d1=help&d2=paymentTracking&node=<%=node==null?"":node%>">track payments</A>.</li>
</ul>
<% } %>


The tax forms we need will vary, depending on where you live. Learn more:</li>
<ul>
<li>Requirements for <A href="/tc?module=Static&d1=help&d2=taxUS&node=<%=node==null?"":node%>">U.S. persons</A>, including U.S. citizens and resident alien</li>
<li>Requirements for foreign person, non-resident alien or foreign national performing work <A href="/tc?module=Static&d1=help&d2=taxForeignUS&node=<%=node==null?"":node%>">inside the United States</A>. </li>
<li>Foreign person, non-resident alien or foreign national performing work <A href="/tc?module=Static&d1=help&d2=taxForeignNonUS&node=<%=node==null?"":node%>">outside the U.S.</A></li>
</ul>
<strong>Please note:</strong>  TopCoder can not determine which requirements apply to your situation.  You are responsible for determining which requirements apply to you, and you are responsible for completing the applicable tax form(s).  For further guidance, refer to the instructions on each tax form, or consult an attorney or other expert for advice.
<br><br>
Please email any other questions to <A href="mailto:payments@topcoder.com">payments@topcoder.com</A>.
<br><br>


<%--------------------------------------------------------------------------------------%>


<% if (node.equals("algo_get_paid")) { %>
<div style="float:right; padding: 0px 0px 10px 10px;"><a href="#top"><img src="/i/interface/back_to_top.gif" alt="back to top" /></a></div>
<A name="affidavits"></A>
<span class="subtitle">Algorithm Affidavits</span>
<br><br>
When members register for an Algorithm Competition, they are presented with an affidavit to complete. To be paid for Algorithm Competition, you must submit to TopCoder ONE <strong>notarized affidavit</strong> during your tenure as a competing TopCoder member. 
<ul>
<li>A notarized affidavit is one that has been signed and stamped by a Notary Public (or similar official person in other countries). A Notary Public is defined as "A person legally empowered to witness and certify the validity of documents and to take affidavits and depositions."</li>
<li>In the US and Canada, you can find a Notary Public at most post offices, banks and college/university registrar offices.</li>
<li>Outside the US and Canada, you can get your affidavit notarized at any US Embassy.</li>
<li>Once you have a notarized affidavit on file with TopCoder, you can affirm online all future affidavits. You must affirm affidavits within 60 days; otherwise they will expire and you will not receive payment for the associated contest.</li>
<li><strong>Note:</strong> Getting an affidavit notarized is a ONE TIME issue. While you may incur costs to obtain a notarized affidavit, know that you will not have to do it again in the future. TopCoder will not pay for any costs related to the notarization of affidavits.</li>
</ul>
Please email any other questions to <A href="mailto:payments@topcoder.com">payments@topcoder.com</A>.
<br><br>
 

<div style="float:right; padding: 0px 0px 10px 10px;"><a href="#top"><img src="/i/interface/back_to_top.gif" alt="back to top" /></a></div>
<A name="tracking"></A>
<span class="subtitle">Algorithm Payment Tracking</span>
<br><br>
Currently, members can track the process of Algorithm Competition winnings through the <A href="/PactsMemberServlet?t=affidavit&c=affidavit_history">Affidavits</A> page under "My TopCoder".
<br><br>
Our payment tracking tool (PACTs) will display one of the following categories:
<ul>
<li><strong>On Hold</strong> indicates that either a tax form or a notarized affidavits has not been received, or that the required affidavit has not been affirmed</li>
<li><strong>Pending</strong> indicates that all required documentation has been received and payment is being processed.</li>
<li><strong>Owed</strong> indicates that payment has been processed and is in queue for distribution.</li>
<li><strong>Paid</strong> indicates that TopCoder has distributed the payment, though the member may not yet have received it.</li>
</ul>
Please email any other questions to <A href="mailto:payments@topcoder.com">payments@topcoder.com</A>.
<br><br>
<% } %>

<div style="float:right; padding: 0px 0px 10px 10px;"><a href="#top"><img src="/i/interface/back_to_top.gif" alt="back to top" /></a></div>
<A name="methods"></A>
<span class="subtitle">Payment Methods</span>
<br><br>
<strong>Check</strong><br>
Checks will be mailed to the address contained in your TopCoder member profile via first class mail through the United States Postal Service. 
<ul>
<li><strong>Note:</strong> All member payments will be made via check unless you notify TopCoder of a different preferred payment method.</li>
<li>There is no cost for check payments, but please note that mail delivery of checks is the slowest payment method.</li>
</ul>

<strong>Wire transfer (electronic funds transfer)</strong><br>
Payment is made directly to your bank account and is usually available within 1-5 business days. The following information is required to establish payment via wire transfer:
<ul>
<li>Bank Name</li>
<li>Bank Address (city and country at a minimum)</li>
<li>Beneficiary's Name</li>
<li>Beneficiary's Address (city and country at a minimum)</li>
<li>Beneficiary's Account #</li>
<li>SWIFT Code (if available)</li>
</ul>
There is a US $20 charge for each wire transfer, which will be deducted from the amount owed to you. To sign up for wire transfer payments, please send an email with the subject line "Wire Transfer Signup" to <A href="mailto:payments@topcoder.com&subject=Wire Transfer Signup">payments@topcoder.com</A>.
<br><br>

<strong>PayPal&#174;</strong><br>
TopCoder does not charge to distribute payments via PayPal, and funds are generally available within a few business days. 
<ul>
<li>Can you receive funds via PayPal? Consult <A target="_blank" href="/?t=sponsor&c=link&link=https://www.paypal.com/cgi-bin/webscr?cmd=_display-approved-signup-countries-outside">this list</A>.</li>
<li>If you do not have an account, <A target="_blank" href="/?t=sponsor&c=link&link=https://www.paypal.com/cgi-bin/webscr?cmd=_registration-run">click here to sign up</A>.</li>
<li><strong>Please note:</strong> depending on the type of account you set up, you may incur fees when receiving TopCoder payments via PayPal.</li>
<li>To receive payments via PayPal, please send an email with the subject line "PayPal Signup" to <A href="mailto:payments@topcoder.com&subject=PayPal Signup">payments@topcoder.com</A>, and include the email address you used to establish your PayPal account. </li>
</ul>
Please email any other questions to <A href="mailto:payments@topcoder.com">payments@topcoder.com</A>.
<br><br>

<div style="float:right; padding: 0px 0px 10px 10px;"><a href="#top"><img src="/i/interface/back_to_top.gif" alt="back to top" /></a></div>
<A name="us"></A>
<span class="subtitle">Tax requirements for U.S. persons, including U.S. citizens and resident alien</span>
<br><br>
Form W-9 should be completed by all U.S. citizens, including U.S resident aliens.
<ul>
<li><A href="/contest/fw9.pdf">Click here for Form W-9</A></li>
<li><A href="/contest/iw9.pdf">Click here for Form W-9 Instructions</A></li>
</ul>
<strong>Why do you need to complete Form W-9?</strong><br>
TopCoder must receive your correct tax identification number (TIN), also known as your social security number, to report to the IRS income paid to you. If you provide TopCoder with your correct TIN, make the proper certifications, and report all your taxable interest and dividends on your tax return, payments you receive from TopCoder will not be subject to backup withholding (currently at a rate of 29%).
<br><br>
Payments you receive from TopCoder will be subject to backup withholding if certain circumstances exist. (See Form W-9 for the list of circumstances that would require TopCoder to withhold taxes on your earnings and/or winnings.) 
<br><br>
<strong>Please note:</strong>  TopCoder can not determine which requirements apply to your situation.  You are responsible for determining which requirements apply to you, and you are responsible for completing the applicable tax form(s).  For further guidance, refer to the instructions on each tax form, or consult an attorney or other expert for advice. 
<br><br>
Please email any other questions to <A href="mailto:payments@topcoder.com">payments@topcoder.com</A>.
<br><br>
Send tax forms via postal mail to:
<br><br>
TopCoder, Inc.<br>
Attn: Payments<br>
703 Hebron Avenue<br>
Glastonbury, CT 06033
<br><br>


 

<div style="float:right; padding: 0px 0px 10px 10px;"><a href="#top"><img src="/i/interface/back_to_top.gif" alt="back to top" /></a></div>
<A name="foreignus"></A>
<span class="subtitle">Tax requirements for foreign persons, non-resident aliens or foreign nationals performing work inside the U.S.</span>
<br><br>
Form W-8BEN should be completed by all foreign persons, including non-resident aliens and foreign nationals.
<ul>
<li><A href="/contest/fw8ben.pdf">Click here for Form W-8BEN</A></li>
<li><A href="/contest/iw8ben.pdf">Click here for Form W-8BEN Instructions</A></li>
</ul>
TopCoder will withhold taxes (currently at a rate of 29%) for payments made to foreign persons who perform work in the U.S., unless such person claims a treaty benefit.
<br><br>
<strong>Claiming Tax Treaty Benefits</strong><br>
Members claiming a reduction of or exemption from income tax withholding must provide a valid U.S. tax identification number and complete the following:
<ol>
<li>Part II of Form W-8BEN</li>
<li>Form W8-ECI</li>
   <ul>
   <li><A href="/i/development/downloads/fw8eci.pdf">Click here for Form W-8ECI</A></li>
   <li><A href="/i/development/downloads/iw8eci.pdf">Click here for Form W-8ECI Instructions</A></li>
   </ul>
<li>Form 8233</li>
   <ul>
   <li><A href="/i/development/downloads/f8233.pdf">Click here for Form 8233</A></li>
   <li><A href="/i/development/downloads/i8233.pdf">Click here for Form 8233 Instructions</A></li>
   </ul>
</ol>

<strong>Please note:</strong>  TopCoder can not determine which requirements apply to your situation.  You are responsible for determining which requirements apply to you, and you are responsible for completing the applicable tax form(s).  For further guidance, refer to the instructions on each tax form, or consult an attorney or other expert for advice.
<br><br>
Please email any other questions to <A href="mailto:payments@topcoder.com">payments@topcoder.com</A>.
<br><br>
Send tax forms via postal mail to:
<br><br>
TopCoder, Inc.<br>
Attn: Payments<br>
703 Hebron Avenue<br>
Glastonbury, CT 06033
<br><br>

 

<div style="float:right; padding: 0px 0px 10px 10px;"><a href="#top"><img src="/i/interface/back_to_top.gif" alt="back to top" /></a></div>
<A name="foreignnonus"></A>
<span class="subtitle">Tax requirements for foreign persons, non-resident aliens or foreign nationals performing work outside the U.S.</span>
<br><br>
Form W-8BEN should be completed by all foreign persons, including non-resident aliens and foreign nationals.
<ul>
<li><A href="/contest/fw8ben.pdf">Form W-8BEN</A></li>
<li><A href="/contest/iw8ben.pdf">Instructions for Form W-8BEN</A></li>
</ul>
<strong>Why do you need to complete Form W-8BEN?</strong><br>
Foreign persons are not subject to U.S. income tax withholding if performing the work outside the U.S. If you receive certain types of income, including prize money won in TopCoder competitions, you must provide a Form W-8BEN to:
<ul>
<li>Establish that you are not a U.S. person</li>
<li>Claim that you are the beneficial owner of the income for which Form W-8BEN is being provided.</li>
</ul>
If you are a foreign person, non-resident alien or foreign national performing work in the U.S., TopCoder will withhold taxes (currently at a rate of 29%). You may claim exemption from or reduction of your withholding due to an income tax treaty benefit by completing Form W-8ECI and Form 8233 (both available here), in addition to Form W-8BEN.
<br><br>
<strong>Do you need a tax identification number (TIN)?</strong><br>
You are only required to provide a tax identification number if you are claiming a reduced rate of, or exemption from, withholding as a resident of a foreign country with which the U.S. has an income tax treaty and you are performing work in the U.S. (If you complete Part II of Form W-8BEN, you must provide a U.S. TIN.) If you are not claiming a reduce rate of, or exemption from, withholding, you do not need to furnish a TIN. 
<br><br>
TopCoder can not tell you whether the country you are a resident of has an income tax treaty with the U.S. Furthermore, TopCoder can not assist you in determining your ability to claim a reduced rate of, or exemption from, withholdings.
<br><br>
<strong>Please note:</strong>  TopCoder can not determine which requirements apply to your situation.  You are responsible for determining which requirements apply to you, and you are responsible for completing the applicable tax form(s).  For further guidance, refer to the instructions on each tax form, or consult an attorney or other expert for advice.
<br><br>
Please email any other questions to <A href="mailto:payments@topcoder.com">payments@topcoder.com</A>.
<br><br>
Send tax forms via postal mail to:
<br><br>
TopCoder, Inc.<br>
Attn: Payments<br>
703 Hebron Avenue<br>
Glastonbury, CT 06033
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
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
