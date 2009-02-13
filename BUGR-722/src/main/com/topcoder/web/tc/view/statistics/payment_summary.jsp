<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.shared.util.ApplicationServer,
                com.topcoder.web.common.model.SoftwareComponent,
                com.topcoder.web.tc.Constants" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<HTML>
<HEAD>
    <TITLE>TopCoder Statistics</TITLE>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <jsp:include page="baseHRef.jsp"/>
    <jsp:include page="/script.jsp"/>
</HEAD>

<BODY>
<jsp:include page="../top.jsp"/>

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR valign="top">
<%
    ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("payment_summary");
    String coderId = (String) request.getParameter(Constants.CODER_ID);
%>
<TD WIDTH="180">
    <!-- Left nav begins -->
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="m_competitions"/>
    </jsp:include>
    <!-- Left nav ends -->
</TD>

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">


    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="statistics_w"/>
        <jsp:param name="title" value="Payments"/>
    </jsp:include>


    <span class="bigHandle">Coder:&#160;<tc-webtag:handle coderId='<%=coderId%>'/></span>
    <br>
    <span class="bodySubtitle">Coder Statistics&#160;>&#160;</span><br>
    <span class="bc">
    <A HREF="/tc?module=MemberProfile&cr=<%=coderId%>" class="bcLink">Member Profile</A>
 | Payment Summary
   </span>

<div class="pagingBox">&nbsp;</div>

    <table class="stat" cellpadding="0" cellspacing="0" width="100%">
        <tr><td class="title" colspan="10">
        Payment Summary
        </td></tr>
        <tr>
            <TD CLASS="header">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="0" includeParams="true"/>">Category</a>
            </TD>
            <TD CLASS="headerR">
                <a href="<%=sessionInfo.getServletPath()%>?<tc-webtag:sort column="3" includeParams="true"/>">Earnings</a>
            </TD>
        </tr>
        <%boolean even = false;
          double total = 0;%>
        <rsc:iterator list="<%=rsc%>" id="resultRow">
            <tr class="<%=even?"dark":"light"%>">            
            <TD class="value">
            <% if (resultRow.getDoubleItem("show_details_ind") == 1 && resultRow.getDoubleItem("earnings") > 0) {%>
                <A href="/tc?module=PaymentDetail&cr=<%=coderId%>&pt=<%=resultRow.getStringItem("payment_type_id")%>">
            <% }%>
                <rsc:item name="payment_type_desc" row="<%=resultRow%>"/>
            <% if (resultRow.getDoubleItem("show_details_ind") == 1) {%></A><% }%>
            </TD>
            <TD class="valueR">
            <% if (resultRow.getDoubleItem("show_details_ind") == 1 && resultRow.getDoubleItem("earnings") > 0) {%>
                <A href="/tc?module=PaymentDetail&cr=<%=coderId%>&pt=<%=resultRow.getStringItem("payment_type_id")%>">
            <% }%>
            <% if (resultRow.getDoubleItem("earnings") > 0) {
                total += resultRow.getDoubleItem("earnings");
            }%>
            <rsc:item name="earnings" row="<%=resultRow%>" format="$#,##0.00"/>
            <% if (resultRow.getDoubleItem("show_details_ind") == 1) {%></A><% }%>
            </TD>
            </tr>
            <%even = !even;%>
        </rsc:iterator>
        <tr>
            <td class="headerR" colspan="2">Total:&nbsp;<fmt:formatNumber value="<%=new Double(total)%>" type="currency" currencySymbol="$"/></td>
        </tr>
    </TABLE>
    <p><br></p>
    <!-- END BODY -->

</TD>
<td WIDTH="180" VALIGN="top">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="profile"/>
    </jsp:include>
</TD>
<!-- Gutter -->
<td WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" border="0"/></TD>
<!-- Gutter Ends -->
</tr>
</TABLE>
<jsp:include page="../foot.jsp"/>
</BODY>
</HTML>
