<%@ include file = "includes.jsp"%>

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Most Component Reviews"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");
String type = (String)request.getParameter("type");
if (type == null) type = HandleTag.COMPONENT; %>

<div align="center">
<jsp:include page="dev_design_links.jsp"/>
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" width="350" style="margin-right: 15px; margin-bottom: 15px;">
    <tr><td class="title" colspan="3">Most Component Reviews</td></tr>
    <tr><td class="headerC">Rank</td><td class="header" width="100%">Coder</td><td class="headerR">Reviews</td></tr>
    <% boolean even = false; %>
    <rsc:iterator list="<%=rsc%>" id="row">
        <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item name="rank" row="<%=row%>"/></td>
        <td class="value"><tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=type%>'/></td>
        <td class="valueR"><rsc:item name="reviews" row="<%=row%>" format="0"/></td>
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>
</div>
</html>