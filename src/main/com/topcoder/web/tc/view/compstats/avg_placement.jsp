<%@ include file = "includes.jsp"%>

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Best Average Component Project Placement"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");
String type = (String)request.getParameter("type");
if (type == null) type = HandleTag.COMPONENT; %>
<jsp:include page="dev_design_links.jsp">

<table>
    <tr><td>Rank</td><td>Coder</td><td>Average ranking</td></tr>
    <rsc:iterator list="<%=rsc%>" id="row">
        <tr>
        <td><rsc:item name="rank" row="<%=row%>"/></td>
        <td><tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=type%>'/></td>
        <td><rsc:item name="average" row="<%=row%>" format="0.00"/></td>
        </tr>
    </rsc:iterator>
</table>

</html>
