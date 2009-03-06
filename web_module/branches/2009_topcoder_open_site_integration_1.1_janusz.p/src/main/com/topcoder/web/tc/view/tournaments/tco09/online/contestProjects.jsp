<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows online track projects list page (development, 
 * design, architecture, assembly and specification).
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 java.util.Map, 
                 com.topcoder.web.tc.controller.request.tournament.tco09.TCO09Constants" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
    ResultSetContainer rscContest = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_details"); 
    ResultSetContainer rsc = (ResultSetContainer) ((Map) request.getAttribute("resultMap")).get("contest_projects");
    int phaseId = rscContest.getIntItem(0, "phase_id");
    boolean isComplete = true;
%>
<jsp:useBean id="Constants" class="com.topcoder.web.tc.controller.request.tournament.tco09.TCO09Constants"/>
<c:set var="phaseId" value="<%= phaseId %>" />

<jsp:include page="../leaderboardPageHead.jsp">
    <jsp:param name="phase_id" value="${ phaseId }"/>
    <jsp:param name="add_title_tag" value="${true}" />
</jsp:include>
    <!-- title suffix -->
    Components
</h2>

<div><p>
    <table class="data" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <th class="first">&nbsp;</th>
            <th class="header">Component</th>
            <th class="headerC">Start Date</th>
            <th class="headerC">End Date</th>
            <th class="last">&nbsp;</th>
        </tr>
        <rsc:iterator list="<%=rsc%>" id="resultRow">
            <tr>
                <td class="first">&nbsp;</td>
                <td class="value alignText" nowrap="nowrap">
                    <% if (resultRow.getIntItem("viewable") == 1) { %>
                        <a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<rsc:item name="component_id" row="<%=resultRow%>"/>">
                            <rsc:item name="component_name" row="<%=resultRow%>"/>
                        </a>
                    <% } else { %>
                        <rsc:item name="component_name" row="<%=resultRow%>"/>
                    <% } %>
                    <% if (resultRow.getIntItem("is_complete") == 0) {
                        isComplete = false;%>
                        *
                    <% } %>
                    |
                    <a href="/tco09?module=ProjectDetails&amp;eid=${event_id}&amp;ct=<rsc:item name="contest_id" row="<%=rscContest.getRow(0)%>" />&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                        results
                    </a>
                    <% if (resultRow.getIntItem("is_complete") == 0) { %>
                        |
                        <a href="/tc?module=CompContestDetails&amp;pj=<rsc:item name="project_id" row="<%=resultRow%>"/>">
                            contest details
                        </a>
                    <% } %>
                </td>
                <td class="valueC" nowrap="nowrap">
                    <rsc:item name="start_date" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" row="<%=resultRow%>"/>
                </td>
                <td class="valueC" nowrap="nowrap">
                    <rsc:item name="end_date" format="'<strong>'MM.dd.yyyy'</strong><br />'HH:mm z" row="<%=resultRow%>"/>
                </td>
                <td class="last">&nbsp;</td>
            </tr>
        </rsc:iterator>
    </table>
    <br /><br />
    <% if (!isComplete) {%>
        * This project is still in progress, results subject to change
    <% } %>
</p></div>
                
<jsp:include page="../leaderboardPageBottom.jsp" />