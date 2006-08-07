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

<span class="title">Algorithm Payment Tracking</span>
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
