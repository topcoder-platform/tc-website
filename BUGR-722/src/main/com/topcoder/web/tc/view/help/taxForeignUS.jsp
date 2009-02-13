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

<span class="subtitle">Tax requirements for foreign persons, non-resident aliens or foreign nationals performing work inside the U.S.</span>
<br><br>
Form W-8BEN should be completed by all foreign persons, including non-resident aliens and foreign nationals.
<ul>
<li><A href="/contest/fw8ben.pdf">Click here for Form W-8BEN</A></li>
<li><A href="/contest/iw8ben.pdf">Click here for Form W-8BEN Instructions</A></li>
</ul>
TopCoder will withhold taxes (currently at a rate of 30%) for payments made to foreign persons who perform work in the U.S., unless such person claims a treaty benefit.
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
