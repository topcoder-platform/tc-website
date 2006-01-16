<%@ include file = "includes.jsp"%>

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Best Average Component Project Placement"/>
</jsp:include>

<%--<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");
String type = (String)request.getAttribute("type");%>
<table>
    <rsc:iterator list="<%=rsc%>" id="row">
    <% String coder = row.getStringItem("coder"); %>
        <tr>
        <td><rsc:item name="rank" row="<%=row%>"/></td>
        <td><tc-webtag:handle coderId='<%=coder%>' context='<%=type%>'/></td>
        <td><rsc:item name="average" row="<%=row%>"/></td>
        </tr>
    </rsc:iterator>--%>
<%
Enumeration headerNames = request.getHeaderNames();
  while (headerNames.hasMoreElements()) {
    String name = (String) headerNames.nextElement();
    String value = request.getHeader(name);
    out.println("  " + name + " : " + value);
  }
%>
</table>

</html>















