<%@ include file = "includes.jsp"%>

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Best Average Component Project Placement"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");
String type = (String)request.getParameter("type");%>
<table>
    <rsc:iterator list="<%=rsc%>" id="row">
    <% long coder = row.getLongItem("cid"); %>
        <tr>
        <td><rsc:item name="rank" row="<%=row%>"/></td>
        <td><tc-webtag:handle coderId='<%=coder%>' context='<%=type%>'/></td>
        <td><rsc:item name="average" row="<%=row%>"/></td>
        </tr>
    </rsc:iterator>
</table>

</html>















