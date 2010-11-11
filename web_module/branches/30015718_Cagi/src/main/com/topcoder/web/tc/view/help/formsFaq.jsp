<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>
<META http-equiv="refresh" content="0;URL=http://www.topcoder.com/wiki/pages/viewpage.action?pageId=4096369">

<jsp:include page="../script.jsp" />
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
            <jsp:param name="node" value="algo_faqs"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyText">
         <jsp:include page="../page_title.jsp" >
         <jsp:param name="image" value="alg_support_faqs"/>
         <jsp:param name="title" value="Forms W-9 & W-8BEN FAQ"/>
         </jsp:include>

<span class="bigTitle">Forms W-9 & W-8BEN FAQ</span>
<br><br>
<A name="form"></A>
<p><span class="bodySubtitle">Which form do I need to complete?</span></p>

<table width="500" align="center" cellspacing="2" cellpadding="5" class="formFrame">
<tr>
<td class="sidebarTitle" width="40%">If you are a(n)</td>
<td class="sidebarTitle" width="20%" align="center">Complete Form W-9<br/><br/><A href="/contest/iw9.pdf" target="_blank">Instructions</A><br/><br/><A href="/contest/fw9.pdf" target="_blank">Form</A></td>
<td class="sidebarTitle" width="20%" align="center">Complete Form W-8BEN<br/><br/><A href="/contest/iw8ben.pdf" target="_blank">Instructions</A><br/><br/><A href="/contest/fw8ben.pdf" target="_blank">Form</A></td>
<td class="sidebarTitle" width="\20%" align="center">Complete Form W-8ECI<br/><br/><A href="/i/development/downloads/iw8eci.pdf" target="_blank">Instructions</A><br/><br/><A href="/i/development/downloads/fw8eci.pdf" target="_blank">Form</A></td>
</tr>
<tr>
<td class="sidebarText">U.S. person, including a U.S. citizen and resident alien</td>
<td class="sidebarText" align="center">X</td>
<td class="sidebarText" align="center">&#160;</td>
<td class="sidebarText" align="center">&#160;</td>
</tr>
<tr>
<td class="sidebarText">Foreign person, non-resident alien or foreign national performing work outside the U.S.</td>
<td class="sidebarText" align="center">&#160;</td>
<td class="sidebarText" align="center">X</td>
<td class="sidebarText" align="center">&#160;</td>
</tr>
<tr>
<td class="sidebarText">Foreign person, non-resident alien or foreign national performing work in the U.S. <strong>and not claiming tax treaty benefits</strong></td>
<td class="sidebarText" align="center">&#160;</td>
<td class="sidebarText" align="center">X</td>
<td class="sidebarText" align="center">&#160;</td>
</tr>
<tr>
<td class="sidebarText">Foreign person, non-resident alien or foreign national performing work in the U.S. <strong>and claiming exemption from or reduced income tax withholding</strong></td>
<td class="sidebarText" align="center">&#160;</td>
<td class="sidebarText" align="center">&#160;</td>
<td class="sidebarText" align="center">X</td>
</tr>
</table>

<p>NOTE:  IT IS YOUR RESPONSIBILITY TO DETERMINE WHICH FORM APPLIES TO YOU. TOPCODER CAN NOT PROVIDE ANY GUIDANCE ON WHICH FORM YOU SHOULD COMPLETE.</p>

<p>If you have further questions regarding which form you should complete, refer to the Instructions for each form, or consult an attorney or other expert for advice.
<!--            <A href="#top"><img src="/i/events/verizon2003/button_backtotop.gif" alt="back to top" width="83" height="23" border="0" align="right"/></A>-->
</p>

<A name="w9"></A>
<p><span class="bodySubtitle">Why do I need to complete Form W-9?</span><br/>
TopCoder must receive your correct tax identification number (TIN), also known as your social security number, to report to the IRS income paid to you. If you provide TopCoder with your correct TIN, make the proper certifications, and report all your taxable interest and dividends on your tax return, payments you receive from TopCoder will not be subject to backup withholding (currently at a rate of 29%).</p>

<p>Payments you receive from TopCoder will be subject to backup withholding if certain circumstances exist. (See Form W-9 for the list of circumstances that would require TopCoder to withhold taxes on your earnings and/or winnings.)
<!--            <A href="#top"><img src="/i/events/verizon2003/button_backtotop.gif" alt="back to top" width="83" height="23" border="0" align="right"/></A>-->
</p>

<A name="w8ben"></A>
<p><span class="bodySubtitle">Why do I need to complete Form W-8BEN?</span><br/>
Foreign persons are not subject to U.S. income tax withholding if performing the work outside the U.S.  If you receive certain types of income, including prize money won in TopCoder competitions, you must provide a Form W-8BEN to:</p>
<ul>
<li>Establish that you are not a U.S. person</li>
<li>Claim that you are the beneficial owner of the income for which Form W-8BEN is being provided.</li>
</ul>
<p>If you are a foreign person, non-resident alien or foreign national performing work in the U.S., TopCoder will withhold taxes (currently at a rate of 29%).  You may claim exemption from or reduction of your withholding due to an income tax treaty benefit by completing Form W-8ECI and Form 8233, in addition to Form W-8BEN.</p>

<p>TOPCODER CAN NOT TELL YOU WHETHER THE COUNTRY YOU ARE A RESIDENT OF HAS AN INCOME TAX TREATY WITH THE U.S. FURTHERMORE, TOPCODER CAN NOT ASSIST YOU IN DETERMINING YOUR ABILITY TO CLAIM A REDUCED RATE OF, OR EXEMPTION FROM, WITHHOLDINGS.
<!--            <A href="#top"><img src="/i/events/verizon2003/button_backtotop.gif" alt="back to top" width="83" height="23" border="0" align="right"/></A>-->
</p>

<A name="tin"></A>
<p><span class="bodySubtitle">Am I required to provide a tax identification number (TIN)?</span><br/>
You are only required to provide a tax identification number if you are claiming a reduced rate of, or exemption from, withholding as a resident of a foreign country with which the U.S. has an income tax treaty and you are performing work in the U.S. (If you complete Part II of Form W-8BEN, you must provide a U.S. TIN.)  If you are not claiming a reduce rate of, or exemption from, withholding, you do not need to furnish a TIN.   </p>

<p>Please email any other questions to <A href="mailto:payments@topcoder.com" class="bodyText">payments@topcoder.com</A>.
<!--            <A href="#top"><img src="/i/events/verizon2003/button_backtotop.gif" alt="back to top" width="83" height="23" border="0" align="right"/></A>-->
</p>

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
