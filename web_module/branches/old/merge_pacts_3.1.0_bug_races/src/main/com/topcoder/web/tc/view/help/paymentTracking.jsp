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

<span class="title">Payment Tracking</span>
<br><br>
Members can track the status of their payments through the <A href="/PactsMemberServlet?module=PaymentHistory">Payments</A> page under "My TopCoder".
<br><br>
Our payment tracking tool (PACTs) will display one of the following categories:
<ul>

    <li><strong>On Hold</strong> - A payment may be put on hold for a number of reasons.
        <ul>
        <li><strong>Waiting for Tax form</strong> - TopCoder has not yet received the paymet recipient's tax form.</li>
        <li><strong>Waiting for affirmed Affidavit</strong> - The payment is attached to an affidavit that has not yet been affirmed.</li>
        <%--
        <li><strong>Waiting for affirmed IP Transfer</strong> - The payment is attached to an intellectual property assignment document that has not yet been affirmed.</li>
        <li><strong>Waiting for hard copy IP Transfer</strong> - The payment is attached to an intellectual property assignment document that TopCoder has not yet received.</li>
        --%>
        <li><strong>Attached to Parent</strong> - The payment is associated with another payment that is on hold for one of the above reasons.<!--  For example, a referral payment.--></li>
        <li><strong>Waiting for signed assignment document</strong> - <a href="/tc?module=Static&amp;d1=help&amp;d2=assignmentDocFaq">Read the FAQ</a> for more information.</li>
            <ul>
                <li>This is caused when the Assignment Version 1.0 (hard copy) has not been sent AND/OR</li>
                <li>This is caused when the Assignment Version 2.0 has not been sent; <a target="_blank" href="/wiki/display/tc/The+Assignment+Document">download the assignment document</a></li>
            </ul>
        <li><strong>Waiting for affirmed assignment document</strong> - This is caused when the assignment document hs not been affirmed</li>
            
      </ul>
    </li>

<li><strong>Owed</strong> - This payment is ready to be paid.</li>
<li><strong>Accruing</strong> - The recipient has not reached his/her current threshhold for payment disbursement.</li>
<li><strong>Entered Into payment system</strong> - The payment has been transfered from PACTS into TopCoder's accounting software.</li>
<li><strong>Paid</strong> - indicates that TopCoder has distributed the payment, though the member may not yet have received it.</li>
<li><strong>Expired</strong> - The payment will not be paid.</li>

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
