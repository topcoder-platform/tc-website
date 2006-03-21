<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
<title>Development FAQ</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="dev_getting_paid"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td class="bodyText" WIDTH="100%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br />

<h2>TopCoder Payment Methods and Requirements</h2>
                                    
<p><span class="bodySubtitle">How Component Payments Work</span><br/>
TopCoder begins the payment process for a component phase (design or development) once the review process finishes.  This can happen in one of two ways:
</p>
<ul>
<li>The review process completes normally.  In this case, the component will enter component preparation (you will receive an email about this).  The component will exit component preparation no later than 5pm Eastern US time on the following business day.  At this point, the payment process will begin.</li>
<li>The review process does not complete normally.  This happens when no submissions pass screening or no submissions pass review.  In this case, the component will be removed for reposting.  This will happen no later than 5pm Eastern US time on the business day following the end of the screening phase (if no submissions passed screening) or the appeals response phase (if no submissions passed review).  At this point, the payment process will begin.</li>
</ul>
<p>
Once the payment process begins, TopCoder will send out your payment within 14 days.  It may take longer to reach you, depending on your preferred payment method (checks generally take the longest).  We recommend that you use the <a href="#eligibility">PayPal method</a>, since it is free of charge and faster than checks.
<br /><br />
Additionally, the appropriate completed <A href="/?&amp;t=support&amp;c=form_faq">tax form</A> must be on file in order to receive your payments.
</p>
<p>Please email any other questions to <A href="mailto:payments@topcoder.com" class="bodyText">payments@topcoder.com</A>.</p>

<p><span class="bodySubtitle">Payment Methods</span><br/>
Members can be paid by the following methods:</p>

<ol>
<li>Check<br/>
Checks will be mailed to the address contained in your TopCoder member profile via first class mail through the United States Postal Service.</li>

<li>Wire transfer (electronic funds transfer)</li>
<ul>
<li>Payment is made directly to your bank account and is usually available within 1-5 business days.</li>
<li>The following information is required to establish payment via wire transfer:</li>
<ul>
<li>Bank Name</li>
<li>Bank Address (city and country at a minimum)</li>
<li>Beneficiary's Name</li>
<li>Beneficiary's Address (city and country at a minimum)</li>
<li>Beneficiary's Account #</li>
<li>SWIFT Code (if available)</li>
</ul>
<li>There is a US $20 charge for each wire transfer, which will be deducted from the amount owed to you.</li>
<li>To sign up for wire transfer payments, email us at <A href="mailto:payments@topcoder.com" class="bodyText">payments@topcoder.com</A>.</li>
</ul>

<a name="eligibility"></a>
            <li>PayPal&#174;</li>
<table cellpadding="0" cellspacing="0" border="0" width="500">
<tr>
<td width="100%" class="bodyText">
<ul>
<li>There is no charge to receive payments via PayPal.</li>
<li>Provide TopCoder with the email address you used to establish your PayPal account.</li>
<li>If you do not have an account, click <A href="https://www.paypal.com/us/auction/pal=F4B23WRCCNZVE" target="_blank">here</A> to sign up.</li>
<li>Funds are transferred via e-check and are generally available within a few business days.</li>
<li>To receive your payments via PayPal, email us at <A href="mailto:payments@topcoder.com" class="bodyText">payments@topcoder.com</A>.</li>
</ul>
</td>
<td align="right" valign="top" class="bodyText"><A href="https://www.paypal.com/us/auction/pal=F4B23WRCCNZVE" target="_blank"><img src="/i/development/paypal.gif" alt="" width="88" height="33" border="0"/></A></td>
</tr>
</table>
</ol>

<p>Note:  All member payments will be made via check unless you notify TopCoder of a different preferred payment method.</p>

<p><span class="bodySubtitle">Payment Requirements</span><br/>
You must provide the following in order for TopCoder to pay you:</p>

<ol>
<li>Valid member profile information.  Checks will be mailed via first class mail through the United States Postal Service, so please make sure your member profile is current.</li>
<li>A completed applicable tax form.</li>
<li>Form W-9 should be completed by all U.S. citizens, including U.S resident aliens.</li>
<ul>
<li><A href="/contest/fw9.pdf" target="_blank">Click here for Form W-9</A></li>
<li><A href="/contest/iw9.pdf" target="_blank">Click here for Form W-9 Instructions</A></li>
</ul>
<li>Form W-8BEN should be completed by all foreign persons, including non-resident aliens and foreign nationals.</li>
<ul>
<li><A href="/contest/fw8ben.pdf" target="_blank">Click here for Form W-8BEN</A></li>
<li><A href="/contest/iw8ben.pdf" target="_blank">Click here for Form W-8BEN Instructions</A></li>
</ul>
</ol>

<p><strong>Important Tax Note:</strong><br/>
TopCoder will withhold taxes (currently at a rate of 29%) for payments made to foreign persons who perform work in the U.S., unless such person claims a treaty benefit.</p>

<p><span class="bodySubtitle">Claiming Tax Treaty Benefits</span><br/>
Members claiming a reduction of or exemption from income tax withholding must provide a valid U.S. tax identification number and complete the following:</p>

<ol>
<li>Part II of Form W-8BEN</li>
<li>Form W8-ECI</li>
<ul>
<li><A href="/i/development/downloads/fw8eci.pdf" target="_blank">Click here for Form W-8ECI</A></li>
<li><A href="/i/development/downloads/iw8eci.pdf" target="_blank">Click here for Form W-8ECI Instructions</A></li>
</ul>
<li>Form 8233</li>
<ul>
<li><A href="/i/development/downloads/f8233.pdf" target="_blank">Click here for Form 8233</A></li>
<li><A href="/i/development/downloads/i8233.pdf" target="_blank">Click here for Form 8233 Instructions</A></li>
</ul>
</ol>

<p><strong>Questions</strong><br/>
Click <a href="/tc?module=Static&d1=help&d2=formsFaq">here</a> for TopCoder tax form FAQs</p>

<p>Please email any other questions to <A href="mailto:payments@topcoder.com" class="bodyText">payments@topcoder.com</A>.</p>

<p><strong>Send tax forms to:</strong><br/><br/>
TopCoder, Inc.<br/>
Attn: Payments<br/>
703 Hebron Avenue<br/>
Glastonbury, CT 06033</p>


            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="180">
            <jsp:include page="../right.jsp"/>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="2"><img src="/i/clear.gif" width="2" height="1" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
