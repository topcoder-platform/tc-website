<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows online track leaderboard page (development, design, architecture, assembly and specification).
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.tc.model.UserContestDetail,
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
    List lst = (List) request.getAttribute("results");
    boolean isComplete = true; 
    int phaseId = rscContest.getIntItem(0, "phase_id");
    String context = TCO09Helper.getContext(phaseId);
%>
<c:set var="phaseId" value="<%= phaseId %>"/>
<jsp:include page="../leaderboardPageHead.jsp">
    <jsp:param name="phase_id" value="${phaseId}" />
    <jsp:param name="add_title_tag" value="${true}" />
</jsp:include>
<%-- add title suffix --%>
    Leaderboard -
    <a href="/tco09?module=ContestProjects&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>"/>">
        View Components
    </a>
</h2>
<div><p>
    <table class="data" width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <th class="first">&nbsp;</th>
            <th>Handle</th>
            <th>Placement Points</th>
            <th>Complete</th>
            <th>In Progess</th>
            <th>Submitted</th>
            <th>Results</th>
            <th class="last">&nbsp;</th>
        </tr>
        <%for (int i = 0; i < lst.size(); i++) { %>
        <tr>
            <td class="first">&nbsp</td>
            <% UserContestDetail result = (UserContestDetail) lst.get(i); %>
            <td class="value alignText" nowrap="nowrap">
                <tc-webtag:handle context='<%=context%>' coderId='<%=result.getUserID()%>' darkBG='false' />
                <% if (result.getIncomplete() > 0) {
                    isComplete = false;%>*<% } %></td>
            <td class="valueC"><%=result.getPoints()%>
            </td>
            <td class="valueC"><%=result.getComplete()%>
            </td>
            <td class="valueC"><%=result.getIncomplete()%>
            </td>
            <td class="valueC"><%=result.getSubmissionCount()%>
            </td>
            <td class="valueC">
                <a href="/tco09?module=MemberResults&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&amp;cr=<%=result.getUserID()%>">results</a>
            </td>
            <td class="last">&nbsp;</td>
        </tr>
        <% }%>
    </table>
<br /><br />
<%if (!isComplete) {%>
* Contains results from projects still in progress, results subject to change
<% } %>
</p></div>

<jsp:include page="../leaderboardPageBottom.jsp" />