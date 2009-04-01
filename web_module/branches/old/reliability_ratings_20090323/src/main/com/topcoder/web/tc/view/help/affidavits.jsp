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

<span class="title">Algorithm Affidavits</span>
<br><br>
When members register for an Algorithm Competition, they are presented with an affidavit to complete. To be paid for Algorithm Competition, you must submit to TopCoder ONE <strong>notarized affidavit</strong> during your tenure as a competing TopCoder member. 
<ul>
<li>A notarized affidavit is one that has been signed and stamped by a Notary Public (or similar official person in other countries). A Notary Public is defined as "A person legally empowered to witness and certify the validity of documents and to take affidavits and depositions."</li>
<li>In the US and Canada, you can find a Notary Public at most post offices, banks and college/university registrar offices.</li>
<li>Outside the US and Canada, you can get your affidavit notarized at any US Embassy.</li>
<li>Once you have a notarized affidavit on file with TopCoder, you can affirm online all future affidavits. You must affirm affidavits within 60 days; otherwise they will expire and you will not receive payment for the associated contest.</li>
<li><strong>Note:</strong> Getting an affidavit notarized is a ONE TIME issue. While you may incur costs to obtain a notarized affidavit, know that you will not have to do it again in the future. TopCoder will not pay for any costs related to the notarization of affidavits.</li>
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
