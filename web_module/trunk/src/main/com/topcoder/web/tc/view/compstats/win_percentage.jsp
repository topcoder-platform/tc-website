<%@ include file = "includes.jsp"%>

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Best Component Project Winning Percentage"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");
String type = (String)request.getParameter("type");
if (type == null) type = HandleTag.COMPONENT; %>
<jsp:include page="dev_design_links.jsp"/>

<table>
    <tr><td>Rank</td><td>Coder</td><td>Winning percentage</td></tr>
    <% int prevRank = -1; %>
    <rsc:iterator list="<%=rsc%>" id="row">
        <tr>
        <td>
<%      int rank = row.getIntItem("rank");
        if (rank != prevRank) { %>
        <rsc:item name="rank" row="<%=row%>"/>
<%      } 
        prevRank = rank; %>
        </td>
        <td><tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=type%>'/></td>
        <td><rsc:item name="percentage" row="<%=row%>" format="0.0%"/></td>
        </tr>
    </rsc:iterator>
</table>

</html>
