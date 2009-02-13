<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="support"/>
                <jsp:param name="level2" value="algPayment"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyText">
        <img src="/i/clear.gif" alt="" width="1" height="10" border="0" /><br/>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="support"/>  
           <jsp:param name="image1" value="white"/>  
           <jsp:param name="title" value="How to Get Paid"/>  
        </jsp:include>

        <h2>TopCoder Payment Methods and Requirements</h2>

<span class="bodySubtitle">How Algorithm Competition Payments Work</span><br>
You must provide the following in order for TopCoder to pay you for winnings earned from an Algorithm Competition: 
   <ul>
   <li><b>Valid member profile information</b> - Checks will be mailed via first class mail through the United States Postal Service, so please make sure your member profile is current.</li>
   <li><b>Notarized affidavit</b> - You must submit to TopCoder ONE notarized affidavit during your tenure as a competing TopCoder member.  A notarized affidavit is one that has been signed and stamped by a Notary Public (or similar official person in other countries).  A Notary Public is defined as "A person legally empowered to witness and certify the validity of documents and to take affidavits and depositions."  In the US and Canada, you can find a Notary Public at most post offices, banks and college/university registrar offices.  Outside the US and Canada, you can get your affidavit notarized at any US Embassy.<br>
   <b>Note</b>: Getting an affidavit notarized is a ONE TIME issue.  While you may incur costs to obtain a notarized affidavit, know that you will not have to do it again in the future.  TopCoder will not pay for any costs related to the notarization of affidavits.</li>
   </li>
   <li><b>Tax form</b> - You must submit to TopCoder the appropriate completed <A href="#taxform">tax form</A>.</li>
   <li><b>Affirmed affidavit</b> - Once you have a notarized affidavit on file with TopCoder, you can affirm online all future affidavits.  You must affirm affidavits within 60 days; otherwise they will expire and you will not receive payment for the associated contest. </li>
   </ul>
Please email questions to <A href="mailto:payments@topcoder.com">payments@topcoder.com</A>.
<br><br>
<span class="bodySubtitle">Payment Methods</span><br>
Members can be paid by the following methods:
   <ol>
   <li><b>Check</b><br>
   Checks will be mailed to the address contained in your TopCoder member profile via first class mail through the United States Postal Service.</li>
   <li><b>Wire transfer (electronic funds transfer)</b>
      <ul>
      <li>Payment is made directly to your bank account and is usually available within 1-5 business days.</li>
      <li>The following information is required to establish payment via wire transfer:
         <ul>
         <li>Bank Name</li>
         <li>Bank Address (city and country at a minimum)</li>
         <li>Beneficiary's Name</li>
         <li>Beneficiary's Address (city and country at a minimum)</li>
         <li>Beneficiary's Account #</li>
         <li>SWIFT Code (if available)</li>
         </ul>
      </li>
      <li>There is a US $20 charge for each wire transfer, which will be deducted from the amount owed to you.</li>
      <li>To sign up for wire transfer payments, email us at <A href="mailto:payments@topcoder.com">payments@topcoder.com</A>.</li>
      </ul>
   </li>
   <li><b>PayPal&#174;</b>
      <table cellpadding="0" cellspacing="0" border="0" class="bodyText">
      <tr><td>
      <ul>
      <li>There is no charge to receive payments via PayPal.</li>
      <li>Provide TopCoder with the email address you used to establish your PayPal account.</li>
      <li>If you do not have an account, <A href="https://www.paypal.com/us/auction/pal=F4B23WRCCNZVE">click here</A> to sign up.</li>
      <li>Funds are transferred via e-check and are generally available within a few business days.</li>
      <li>To receive your payments via PayPal, email us at <A href="payments@topcoder.com">payments@topcoder.com</A>.</li>
      </ul>
      </td>
      <td valign="top">
      <A href="https://www.paypal.com/us/auction/pal=F4B23WRCCNZVE"><img src="/i/interface/paypal.gif" alt="PayPal" border="0"/></A>
      </td>
      </table>
   </li>
   </ol>

<b>Note</b>: All member payments will be made via check unless you notify TopCoder of a different preferred payment method.
<br><br>
<A name="taxform"></A>
<span class="bodySubtitle">Tax Forms</span><br>
   <ol>
   <li>Form W-9 should be completed by all U.S. citizens, including U.S resident aliens.
      <ul>
      <li><A href="/contest/fw9.pdf">Click here for Form W-9</A></li>
      <li><A href="/contest/iw9.pdf">Click here for Form W-9 Instructions</A></li>
      </ul>
   </li>
   <li>Form W-8BEN should be completed by all foreign persons, including non-resident aliens and foreign nationals.
      <ul>
      <li><A href="/contest/fw8ben.pdf">Click here for Form W-8BEN</A></li>
      <li><A href="/contest/iw8ben.pdf">Click here for Form W-8BEN Instructions</A></li>
      </ul>
      <b>Important Tax Note</b>: TopCoder will withhold taxes (currently at a rate of 29%) for payments made to foreign persons who perform work in the U.S., unless such person claims a treaty benefit.
   </li>
   </ol>

<span class="bodySubtitle">Claiming Tax Treaty Benefits</span><br>
Members claiming a reduction of or exemption from income tax withholding must provide a valid U.S. tax identification number and complete the following:
   <ol>
   <li>Part II of Form W-8BEN</li>
   <li>Form W8-ECI
      <ul>
      <li><A href="/i/development/downloads/fw8eci.pdf">Click here for Form W-8ECI</A></li>
      <li><A href="/i/development/downloads/iw8eci.pdf">Click here for Form W-8ECI Instructions</A></li>
      </ul>
   </li>
   <li>Form 8233
      <ul>
      <li><A href="/i/development/downloads/f8233.pdf">Click here for Form 8233</A></li>
      <li><A href="/i/development/downloads/i8233.pdf">Click here for Form 8233 Instructions</A></li>
      </ul>
   </li>
   </ol>

<span class="bodySubtitle">Tax Questions</span><br>
<A href="/?t=support&c=form_faq">Click here</A> for TopCoder tax form FAQs.
<br><br>
Please email other tax questions to <A href="mailto:payments@topcoder.com">payments@topcoder.com</A>.
<br><br>
<b>Send notarized affidavits and tax forms to:</b><br>
TopCoder, Inc.<br>
Attn: Payments<br>
703 Hebron Avenue<br>
Glastonbury, CT 06033
         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
