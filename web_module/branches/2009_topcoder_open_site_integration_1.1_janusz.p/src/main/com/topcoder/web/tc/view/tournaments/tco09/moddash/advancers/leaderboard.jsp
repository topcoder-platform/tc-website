<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.topcoder.json.object.JSONArray,
                 com.topcoder.json.object.JSONObject" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<% JSONArray feedData =  (JSONArray) request.getAttribute("feedData"); %>              
<jsp:useBean id="TCO09Constants" class="com.topcoder.web.tc.controller.request.tournament.tco09.TCO09Constants"/>

<jsp:include page="../../leaderboardPageHead.jsp" />
    <jsp:param name="phase_id" value="${TCO09Constants.MOD_DASH_PHASE_ID}" />
    <jsp:param name="add_title_tag" value="${true}" />
</jsp:include>
<%-- title suffix --%>
    Leaderboard
</h2>
<br />
<table class="data" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <th class="first">&nbsp;</th>
        <th>Handle</th>
        <th>TCO Points</th>
        <th>Results</th>
        <th class="last">&nbsp;</th>
    </tr>
<% for (int i=0; i<feedData.getSize(); i++) { %>
    <% JSONObject competitor = feedData.getJSONObject(i); %>
<tr>
<td class="first">&nbsp;</td>
<td class="value textAlign"><tc-webtag:handle coderId="${competitor.getInt(coder_id)}"/></td>
<td class="valueC"><%= competitor.getString("tco_points") %></td>
<td class="valueC"><a href="/tco09?module=ModDashResults&amp;handle=<%= competitor.getString("handle") %>">results</a></td>
<td class="last">&nbsp;</td>
</tr>
<% } %>
</table>
<br />

<jsp:include page="../../leaderboardPageBottom.jsp" />