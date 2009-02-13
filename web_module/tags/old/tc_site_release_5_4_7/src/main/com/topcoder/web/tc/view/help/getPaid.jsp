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
        if (node!=null&&!(node.equals("algo_get_paid")||node.equals("des_get_paid")||node.equals("dev_get_paid")||node.equals("assem_get_paid"))) {
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
TopCoder begins the payment process for algorithm, design, development and assembly contests one business day after each contest is concluded. Design, development and assembly contests are over when either the winning submission goes through a successful final review, or when the contest is closed because no submission has passed screening or review. 
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
<li>Update your <A href="/reg/?nrg=false">member profile</A> now.</li>
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
