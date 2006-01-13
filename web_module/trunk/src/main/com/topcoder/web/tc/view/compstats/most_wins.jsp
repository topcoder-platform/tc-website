<%@ include file = "includes.jsp">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Most component project wins"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");%>
<table>
	<rsc:iterator list="<%=rsc%>" id="row">
		<tr>
		<td><rsc:item name="rank" row="<%=row%>"/></td>
		<td><rsc:item name="coder" row="<%=row%>"/></td>
		<td><rsc:item name="num_wins" row="<%=row%>"/></td>
		</tr>
	</rsc:iterator>
</table>

</html>















