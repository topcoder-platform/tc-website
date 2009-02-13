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

<span class="title">Payment Methods</span>
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
