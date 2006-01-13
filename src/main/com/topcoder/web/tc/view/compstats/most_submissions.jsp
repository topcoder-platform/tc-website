<%@ include file = "includes.jsp">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Highest number of component submissions"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");%>
<table>
	<rsc:iterator list="<%=rsc%>" id="row">
		<tr>
		<td><rsc:item name="rank" row="<%=row%>"/></td>
		<td><rsc:item name="coder" row="<%=row%>"/></td>
		<td><rsc:item name="submissions" row="<%=row%>"/></td>
		</tr>
	</rsc:iterator>
</table>

</html>















