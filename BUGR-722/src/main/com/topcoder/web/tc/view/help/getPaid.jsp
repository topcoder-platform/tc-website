<%@ page import="com.topcoder.web.common.WebConstants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>

    <% String node = request.getParameter(WebConstants.LEFT_NAV_KEY);
        if (node!=null&&!(node.equals("algo_get_paid")||node.equals("des_get_paid")||node.equals("dev_get_paid")||node.equals("assem_get_paid")||node.equals("architecture_get_paid"))) {
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
TopCoder begins the payment process for algorithm, design, development and assembly contests one business day after each contest is concluded.  Design, development, and assembly contests are over when they are closed and removed from the online review tool.  This will happen by 5:00 PM Eastern Time on the business day following the end of final review (for a successful project) or when all submissions have failed screening or review.
<br><br>
<strong>Timing</strong><br>
Payments of $25.00 or more are distributed on or before the 15th day of the following month. For example: payments earned between November 1 and November 30 will be sent out on or before December 15.
<br><br>
Payments will be issued on the following dates for 2007:
<br><br>

<div align="center">
<table cellpadding="0" cellspacing="0" border="0" width="300" class="stat">
<tbody>
    <tr>
        <td class="header" width="50%"><strong>Earned</strong></td>
        <td class="header" width="50%"><strong>Paid **</strong></td>
    </tr>
    <tr class="light">
        <td class="value">January 1-30</td>
        <td class="value">February 15, 2007</td>
    </tr>
    <tr class="light">
        <td class="value">February 1-28</td>
        <td class="value">March 15, 2007</td>
    </tr>
    <tr class="light">
        <td class="value">March 1-31</td>
        <td class="value">April 16, 2007</td>
    </tr>
    <tr class="light">
        <td class="value">April 1-30</td>
        <td class="value">May 15, 2007</td>
    </tr>
    <tr class="light">
        <td class="value">May 1-31</td>
        <td class="value">June 15, 2007</td>
    </tr>
    <tr class="light">
        <td class="value">June 1-30</td>
        <td class="value">July 16, 2007</td>
    </tr>
    <tr class="light">
        <td class="value">July 1-31</td>
        <td class="value">August 15, 2007</td>
    </tr>
    <tr class="light">
        <td class="value">August 1-31</td>
        <td class="value">September 14, 2007</td>
    </tr>
    <tr class="light">
        <td class="value">September 1-30</td>
        <td class="value">October 15, 2007</td>
    </tr>
    <tr class="light">
        <td class="value">October 1-31</td>
        <td class="value">November 15, 2007</td>
    </tr>
    <tr class="light">
        <td class="value">November 1-30</td>
        <td class="value">December 14, 2007</td>
    </tr>
    <tr class="light">
        <td class="value">December 1-31</td>
        <td class="value">January 15, 2008</td>
    </tr>
    <tr class="light">
        <td class="value" colspan="2">&#160;</td>
    </tr>
    <tr class="light">
        <td class="value" colspan="2">** Note: The date when you actually receive your payment will depend on the payment method you select.</td>
    </tr>
</tbody>
</table>
</div>

<br><br>
The only exceptions to this schedule are: 
<ul>
<li>Payments totaling less than $25.00. Payments will be held until the total balance that is owed you reaches or exceeds $25.00, at which point the normal payment process will begin. </li>
<li>When members request that TopCoder hold payments. You may prefer one larger payment to multiple smaller ones, for example, or you may want to ensure that a check doesn't come while you're out of town - if so, please e-mail payments@topcoder.com with your handle, full name, and the timing and/or dollar amount of your hold request.</li>
</ul>
<strong>Payment Methods</strong><br>
Members can be paid by check, by wire transfer, or by PayPal®. <A href="/tc?module=Static&d1=help&d2=paymentMethods&node=<%=node==null?"":node%>">Learn more</A>.
<br><br>

<strong>Tracking Payments</strong><br>
Members can <A href="/tc?module=Static&d1=help&d2=paymentTracking&node=<%=node==null?"":node%>">track the status of their payments</A> through the <A href="/PactsMemberServlet?module=PaymentHistory">Payments</A> page under "My TopCoder".
<br><br>

<strong>Requirements</strong><br>
Before TopCoder can process payment, we must have your full name and a complete and accurate address in your member profile, as well as any required affidavits and completed tax forms on file.
<ul>
<li>Update your <A href="/reg/?nrg=false">member profile</A> now.</li>
</ul>

<% if (node.equals("algo_get_paid")) { %>
To receive payments from Algorithm Competitions, you must have submitted a notarized affidavit and affirmed the affidavit from the relevant competition online (note: does not apply to design or development competitions).  
<ul>
<li><A href="/tc?module=Static&d1=help&d2=affidavits&node=<%=node==null?"":node%>">Learn more about affidavits.</A></li>
</ul>
<% } %>

The tax forms we need will vary, depending on where you live. Learn more:
<ul>
<li>Requirements for <A href="/tc?module=Static&d1=help&d2=taxUS&node=<%=node==null?"":node%>">U.S. persons</A>, including U.S. citizens and resident alien</li>
<li>Requirements for foreign person, non-resident alien or foreign national performing work <A href="/tc?module=Static&d1=help&d2=taxForeignUS&node=<%=node==null?"":node%>">inside the United States</A>. </li>
<li>Foreign person, non-resident alien or foreign national performing work <A href="/tc?module=Static&d1=help&d2=taxForeignNonUS&node=<%=node==null?"":node%>">outside the U.S.</A></li>
</ul>
<strong>Please note:</strong>  TopCoder can not determine which requirements apply to your situation.  You are responsible for determining which requirements apply to you, and you are responsible for completing the applicable tax form(s).  For further guidance, refer to the instructions on each tax form, or consult an attorney or other expert for advice.
<br><br>
Please email any other questions to <A href="mailto:payments@topcoder.com">payments@topcoder.com</A>. Please be sure to include both your TopCoder handle and your full name in all of correspondence.
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
