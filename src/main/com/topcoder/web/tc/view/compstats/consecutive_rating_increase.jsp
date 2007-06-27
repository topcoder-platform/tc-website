<%@ include file = "includes.jsp"%>
<script language="JavaScript" type="text/javascript" src="/js/popup.js"></script>

<div class="fixedWidthBody">

<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Competition Record Book"/>
</jsp:include>

<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("result");
String type = (String)request.getParameter("type");
if (type == null) type = HandleTag.COMPONENT; %>

<div style="float:right;"><A href="/tc?module=Static&d1=compstats&d2=comp_recordbook_home">back to table of contents</A></div>
<jsp:include page="dev_design_no_overall_links.jsp"/>
<br><br>
<strong>Record:</strong> The longest streaks where a competitor increased their rating.
<br><br>
<table class="stat" cellpadding="0" cellspacing="0" width="100%" style="float: left; margin-bottom: 15px;">
    <tr><td class="title" colspan="6">Consecutive Rating Increase</td></tr>
    <tr>
        <td class="headerC">Rank</td>
        <td class="header">Coder</td>
        <td class="headerC">Consecutive<br>Rating<br>Increases</td>
        <td class="headerC" colspan="3">Duration</td>            
    </tr>
    <% boolean even = false; %>
    <rsc:iterator list="<%=rsc%>" id="row">
        <tr class="<%=even?"dark":"light"%>">
        <td class="valueC"><rsc:item name="rank" row="<%=row%>"/></td>
        <td class="value"><tc-webtag:handle coderId='<%=row.getLongItem("coder_id")%>' context='<%=type%>'/></td>
        <td class="valueC"><rsc:item name="length" row="<%=row%>" format="0"/>
            <% if (row.getIntItem("is_current") == 1) { %>
                <img src="/i/interface/emblem/andclimbing.png" alt="And climbing" align="absmiddle" onmouseover="popUp(this,'emblemPopup')" onMouseOut="popHide()" />
            <% } %>            

        </td>
        <td class="valueR" width="50%">
            <A href="/tc?module=CompContestDetails&pj=<rsc:item name="start_project_id" row="<%=row%>"/>"><rsc:item name="start_project_name" row="<%=row%>"/></A><br>
            <rsc:item name="start_date" row="<%=row%>" format="MM.dd.yyyy"/>
        </td>
        <td class="valueC">-</td>
        <td class="value" width="50%">
            <A href="/tc?module=CompContestDetails&pj=<rsc:item name="end_project_id" row="<%=row%>"/>"><rsc:item name="end_project_name" row="<%=row%>"/></A><br>
            <rsc:item name="end_date" row="<%=row%>" format="MM.dd.yyyy"/>
        </td>                
        </tr>
    <% even = !even;%>
    </rsc:iterator>
</table>

<div class="popUp" id="emblemPopup"><div>And climbing</div></div>

</div>
</html>
