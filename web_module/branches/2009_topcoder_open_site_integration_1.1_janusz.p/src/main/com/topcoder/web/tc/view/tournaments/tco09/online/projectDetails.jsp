<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.model.ProjectDetail,
                 java.util.List,
                 java.util.Map, 
                 com.topcoder.web.tc.controller.request.tournament.tco09.TCO09Constants" %>

<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="Constants" class="com.topcoder.web.tc.controller.request.tournament.tco09.TCO09Constants"/>

<% 
    ResultSetContainer rscProject = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("project_details"); 
    ResultSetContainer rscContest = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_details"); 
    List lst = (List) request.getAttribute("results");
    boolean isComplete = false;
    if (rscProject.getIntItem(0, "complete_status") == 1) {
        isComplete = true;
    }
    String tab = "design";
    int phaseId = rscContest.getIntItem(0, "phase_id");
%>
<jsp:include page="../leaderboardPageHead.jsp">
    <jsp:param name="phase_id" value="<%= phaseId %>"/>
</jsp:include>

<h2 class="title">
    <a href="/tco08?module=ContestDetails&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>">
        <rsc:item name="contest_name" row="<%=rscContest.getRow(0)%>"/>
    </a> -
    <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=rscProject.getRow(0)%>"/>">
      <rsc:item name="component_name" row="<%=rscProject.getRow(0)%>"/>
    </a>
<%if (!isComplete) {%>*<%}%>
</h2>
<br />
<% if (isComplete) { %>
    <a href="/tc?module=CompContestDetails&amp;pj=<rsc:item name="project_id" set="<%=rscProject%>"/>">contest details</a>
<% } %>
<table cellpadding="0" cellspacing="0" class="data" width="100%">
    <tr>
        <th class="first">&nbsp;</th>
        <th nowrap="nowrap">Competitor</th>
        <th nowrap="nowrap">Submission Date</th>
        <th>Place</th>
        <th>Placement Points</th>
        <th>Score</th>
    </tr>
    <%for (int i = 0; i < lst.size(); i++) { %>
        <tr class="<%=(i%2==0 ? "even" : "")%>">
            <% ProjectDetail result = (ProjectDetail) lst.get(i); %>
            <td class="first">&nbsp;</td>
            <td class="value alignText">
                <tc-webtag:handle coderId='<%=result.getUserID()%>' context='<%=tab%>' darkBG='false' />
            </td>
            <td class="valueC" nowrap="nowrap">
                <tc-webtag:format object="<%=result.getSubmitTimestamp()%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
            </td>
            <td class="valueC"><%=result.getPlaced()%></td>
            <td class="valueC"><%=result.getPoints()%></td>
            <td class="valueC"><%=result.getScore()%></td>
            <td class="last">&nbsp;</td>
        </tr>
    <% }%>
</table>
<%if (!isComplete) {%>
    <br /><br />
    * This project is still in progress, results subject to change
<% } %>
<br /><br />

<jsp:include page="../leaderboardPageBottom.jsp" />