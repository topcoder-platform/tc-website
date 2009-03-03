<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" %>
<%@ page import="com.topcoder.web.common.model.EventType,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.shared.util.ApplicationServer,
                 java.util.Map" %>
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

<c:choose>
  <c:when test="${phaseId == Constants.ARCHITECTURE_PHASE_ID}">
      <c:set  var="title" value="Architecture Competition Components" />
  </c:when>
  <c:when test="${phaseId == Constants.ASSEMBLY_PHASE_ID}">
      <c:set var="title" value="Assembly Competition Components" />
  </c:when>
  <c:when test="${phaseId == Constants.DESIGN_PHASE_ID}">
      <c:set var="title" value="Component Design Competition Components" />
  </c:when>
  <c:when test="${phaseId == Constants.DEVELOPMENT_PHASE_ID}">
      <c:set var="title" value="Component Development Competition Components" />
  </c:when>
  <c:when test="${phaseId == Constants.SPECIFICATION_PHASE_ID}">
      <c:set var="title" value="Specification Competition Components" />
  </c:when>
</c:choose>

<jsp:include page="../leaderboardPageHead.jsp">
    <jsp:param name="phase_id" value="${ phaseId }"/>
</jsp:include>

<h2><c:out value="${ title }"/></h2>

<table class="data" cellpadding="0" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th class="first">&nbsp;</th>
            <th class="header">Component</th>
            <th class="headerC">Start Date</th>
            <th class="headerC">End Date</th>
            <th class="last">&nbsp;</th>
        </tr>
    </thead>
    <%boolean even = true;%>
    <rsc:iterator list="<%=rsc%>" id="resultRow">
        <tr class="<%=even?"even":""%>">
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
        <%even=!even;%>
    </rsc:iterator>
</table>
<br /><br />
<% if (!isComplete) {%>
    * This project is still in progress, results subject to change
<br /><br />
<% } %>
                
<jsp:include page="../leaderboardPageBottom.jsp" />