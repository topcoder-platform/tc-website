<%@ include file = "includes.jsp"%>

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Highest Component Project Royalty Earners"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");
String type = (String)request.getParameter("type");
if (type == null) type = HandleTag.COMPONENT; %>
<jsp:include page="dev_design_links.jsp"/>

<table>
    <tr><td>Rank</td><td>Coder</td><td>Royalties</td></tr>
    <rsc:iterator list="<%=rsc%>" id="row">
        <tr>
        <td><rsc:item name="rank" row="<%=row%>"/></td>
        <td><tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=type%>'/></td>
        <td><rsc:item name="money" row="<%=row%>" format="$0.00"/></td>
        </tr>
    </rsc:iterator>
</table>

</html>