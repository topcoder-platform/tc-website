<%@ include file = "includes.jsp"%>

<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Competition Record Book"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");
String type = (String)request.getParameter("type");
if (type == null) type = HandleTag.COMPONENT; %>

<div style="float:right;"><A href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home">back to table of contents</A></div>
<jsp:include page="dev_design_links.jsp"/>
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" width="300" style="float: left; margin-right: 15px; margin-bottom: 15px;">
    <tr><td class="title" colspan="3">Largest Single Component Contest Prizes</td></tr>
    <tr><td class="headerC">Rank</td><td class="header" width="100%">Coder</td><td class="headerR">Prize</td></tr>
    <% boolean even = false; %>
    <rsc:iterator list="<%=rsc%>" id="row">
        <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item name="rank" row="<%=row%>"/></td>
        <td class="value"><tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=type%>'/></td>
        <td class="valueR"><strong><rsc:item name="money" row="<%=row%>" format="$0.00"/></strong></td>
        </tr>
        <tr class="<%=even?"dark":"light"%>">
        <td class="valueR" colspan="3"><span class="smallText"><A href="">Competition Disqualification Processor 1.1</A> - 01.01.2006</span></td>
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>
<span class="bodyText">
<strong>Record:</strong> Winners of the largest prizes for a single Design or Development Competition.
</span>
</div>
</html>