<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ include file="includes.jsp" %>

<div class="fixedWidthBody">

    <jsp:include page="../page_title.jsp">
        <jsp:param name="image" value="statistics_w"/>
        <jsp:param name="title" value="Component Competition Record Book"/>
    </jsp:include>

    <% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");
        String type = (String) request.getParameter("type");
        if (type == null) type = HandleTag.COMPONENT; %>

    <div style="float:right;"><A href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home">back to table of
        contents</A></div>
    <jsp:include page="dev_design_links.jsp"/>
    <br><br>
    <table class="stat" cellpadding="0" cellspacing="0" width="270" style="float: left; margin-right: 15px; margin-bottom: 15px;">
        <tr><td class="title" colspan="4">Highest Appeal Success Percentage</td></tr>
        <tr><td class="headerC">Rank</td><td class="header">Coder</td><td class="headerR" nowrap="nowrap"># of
            Appeals</td><td class="headerR" nowrap="nowrap">Success %</td></tr>
        <% boolean even = false; %>
        <rsc:iterator list="<%=rsc%>" id="row">
            <tr class="<%=even?"dark":"light"%>">
                <td class="valueC"><rsc:item name="rank" row="<%=row%>"/></td>
                <td class="value"><tc-webtag:handle coderId='<%=row.getLongItem("user_id")%>' context='<%=type%>'/></td>
                <td class="valueR"><rsc:item name="num_appeals" row="<%=row%>"/></td>
                <td class="valueR"><rsc:item name="success_percentage" row="<%=row%>" format="0.00%"/></td>
            </tr>
            <% even = !even;%>
        </rsc:iterator>
    </table>
<span class="bodyText">
<strong>Record:</strong> Highest Appeal Success Percentage.  A higher percentage means that a competitor is more
    successful at winning disputed reviewer scores.  Only those with at least 50 appeals are included in this list.
    Additionally, only those appeals made on projects posted on or after March 16, 2006 are included (TopCoder did not collect
    the relevant data prior to that date).
</span>

</div>
</html>
