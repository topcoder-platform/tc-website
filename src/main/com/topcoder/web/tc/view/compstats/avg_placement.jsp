<%@ include file = "includes.jsp"%>

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Best Average Component Project Placement"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");
String type = (String)request.getParameter("type");
if (type == null) type = "Component";%>
<table>
    <tr><td>Rank</td><td>Coder</td><td>Average ranking</td></tr>
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
        <td><rsc:item name="average" row="<%=row%>" format="0.00"/></td>
        </tr>
    </rsc:iterator>
</table>

</html>















