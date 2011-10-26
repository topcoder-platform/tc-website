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

<span class="subtitle">Tax requirements for foreign persons, non-resident aliens or foreign nationals performing work outside the U.S.</span>
<br><br>
Form W-8BEN should be completed by all foreign persons, including non-resident aliens and foreign nationals.
<ul>
<li><A href="/contest/fw8ben.pdf">Form W-8BEN</A></li>
<li><A href="/contest/iw8ben.pdf">Instructions for Form W-8BEN</A></li>
</ul>
<strong>Why do you need to complete Form W-8BEN?</strong><br>
If you receive certain types of income, including prize money won in TopCoder competitions, you must provide a Form W-8BEN to:
<ul>
<li>Establish that you are not a U.S. person</li>
<li>Claim that you are the beneficial owner of the income for which Form W-8BEN is being provided.</li>
</ul>
If you are a foreign person, non-resident alien or foreign national who wins algorithm prize money, TopCoder will withhold taxes (currently at a rate of 30%). You may claim exemption from or reduction of your withholding due to an income tax treaty benefit by completing Form W-8ECI and Form 8233 (both available here), in addition to Form W-8BEN.
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
95 Glastonbury Blvd<br>
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
