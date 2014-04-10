<%@ include file = "includes.jsp"%>

<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Competition Record Book"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");
String type = (String)request.getParameter("type");
if (type == null) type = HandleTag.COMPONENT; %>

<div style="float:right;"><A href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home"  class="bodyText">back to table of contents</A></div>
<jsp:include page="dev_design_links.jsp"/>
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" width="270" style="float: left; margin-right: 15px; margin-bottom: 15px;">
    <tr><td class="title" colspan="3">Best Average Component Challenge Placement</td></tr>
    <tr><td class="headerC">Rank</td><td class="header">Coder</td><td class="headerR" nowrap="nowrap">Average ranking</td></tr>
    <% boolean even = false; %>
    <rsc:iterator list="<%=rsc%>" id="row">
        <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item name="rank" row="<%=row%>"/></td>
        <td class="value"><tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=type%>'/></td>
        <td class="valueR"><rsc:item name="average" row="<%=row%>" format="0.00"/></td>
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>
<span class="bodyText">
<strong>Record:</strong> Best average placement per challenge.  A lower average is better.  An average of 1.00 means the competitor
    came in first on every submission that passed screening.  Only challenges where the competitor was rated are included.
    In order to be listed, a competitor must have at least 5 challenges where their submission passed screening.
</span>

</div>
</html>
