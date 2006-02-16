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
    <tr><td class="title" colspan="4">Highest Component Project Scores</td></tr>
    <tr><td class="headerC">Rank</td><td class="header" width="100%">Coder</td><td class="headerR">Score</td><td class="header"><div style="width:130px;">Contest</div></td></tr>
    <% boolean even = false; %>
    <rsc:iterator list="<%=rsc%>" id="row">
        <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item name="rank" row="<%=row%>"/></td>
        <td class="value"><tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=type%>'/></td>
        <td class="valueR"><rsc:item name="score" row="<%=row%>" format="0.00"/></td>
        <td class="value"><A href="">Competition Disqualification Processor</A></td>
         </td>
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>
<span class="bodyText">
<strong>Record:</strong> TopCoder reserves the title of Coder of the Month for any competitor who has had an outstanding month. Some months, this means that we choose the algorithm competitor with an exceptionally high rating increase for the month.  Other times TopCoder may select a Coder of the Month based on exceptional performance in Component Competitions for a given period of time. Perhaps even a member who has earned a large amount of winnings or has had an impressive winning streak.
</span>

</div>
</html>