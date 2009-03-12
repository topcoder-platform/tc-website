<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows online track member results page (development, 
 * design, architecture, assembly and specification).
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.tc.model.UserContestResult,
                 java.util.List,
                 java.util.Map,
                 com.topcoder.web.tc.controller.request.tournament.tco09.TCO09Helper" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
    ResultSetContainer rscContest = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_details");
    ResultSetContainer rscUser = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("user_details");
    List lst = (List) request.getAttribute("results");
    boolean isComplete = true;
    int phaseId = rscContest.getIntItem(0, "phase_id");
    String context = TCO09Helper.getContext(phaseId);
%>
<jsp:include page="../leaderboardPageHead.jsp">
    <jsp:param name="phase_id" value="<%= phaseId %>" />
    <jsp:param name="add_title_tag" value="${true}" />
</jsp:include>
<%-- title suffix --%>
    - Competitor Results
    <tc-webtag:handle context='<%=context%>' coderId='<%=rscUser.getIntItem(0, "coder_id")%>' darkBG='false' />
</h2>
<div><p>
    <table class="data" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <th class="first">&nbsp;</th>
            <th class="header" nowrap="nowrap">Component Name</th>
            <th class="headerC">Submit Date</th>
            <th class="headerC">Points</th>
            <th class="headerC">Placed</th>
            <th class="headerC">Placement Points</th>
            <th class="last">&nbsp;</th>
        </tr>
        <%for (int i = 0; i < lst.size(); i++) { %>
            <tr>
                <% UserContestResult result = (UserContestResult) lst.get(i); %>
                <td class="first">&nbsp</td>
                <td class="value" nowrap="nowrap">
                    <% if (result.isViewable()) { %>
                    <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=result.getCompID()%>">
                        <%=result.getComponent()%>
                    </a>
                    <% } else { %>
                        <%=result.getComponent()%>
                    <% }%>
                    <% if (!result.isComplete()) {
                        isComplete = false;%>
                        *   
                    <% } else { %>
                        | <a href="/tc?module=CompContestDetails&amp;pj=<%=result.getProjectId()%>">contest details</a>
                    <% } %>
                </td>
                <td class="valueC" nowrap="nowrap">
                    <tc-webtag:format object="<%=result.getSubmitTimestamp()%>" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z"/>
                </td>
                <td class="valueC"><%=result.getScore()%></td>
                <td class="valueC"><%=result.getPlaced()%></td>
                <td class="valueC"><%=result.getPoints()%></td>
                <td class="last">&nbsp;</td>
            </tr>
        <% } %>
    </table>
<br /><br />
<%if (!isComplete) {%>
* Contains results from projects still in progress, results subject to change
<% } %>
</p></div>

<jsp:include page="../leaderboardPageBottom.jsp" />