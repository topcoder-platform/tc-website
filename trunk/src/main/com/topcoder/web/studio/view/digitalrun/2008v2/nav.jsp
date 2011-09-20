<%--
  - Author: TCSDEVELOPER, isv
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders studio site top section.
  -
  - Version 1.1 (Studio Enhancements Release Assembly 1) Change notes:
  - * Removed tid parameter from URL for ViewLeaderBoard action to cause
  - * leaderboard for current month to be displayed by default.
--%>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
%>

<div align="center">
    <img src="/i/digital_run/studioCupBanner-new2.jpg" alt="" />
</div>

<p align="right">

    <% if (tabLev2.equals("home")) {%>
        Home
    <% } else { %>
        <a class="bcLink" href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=home">Home</a>
    <% } %>
    <% if (tabLev2.equals("overview")) {%>
        | Overview
    <% } else { %>
        | <a class="bcLink" href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=overview">Overview</a>
    <% } %>
    <% if (tabLev2.equals("2011_tournament")) {%>
        | 2011 Tournament
    <% } else { %>
        | <a class="bcLink" href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=2011_tournament">2011 Tournament</a>
    <% } %>
    <% if (tabLev2.equals("schedule")) {%>
        | Schedule
    <% } else { %>
         | <a class="bcLink" href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=schedule">Schedule</a>
    <% } %>
    <% if (tabLev2.equals("prizes")) {%>
        | Awards
    <% } else { %>
         | <a class="bcLink" href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=prizes">Awards</a>
    <% } %>
    <% if (tabLev2.equals("rules")) {%>
        | Rules
    <% } else { %>
         | <a class="bcLink" href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=rules">Rules</a>
    <% } %>
    <% if (tabLev2.equals("leaderboard")) {%>
        | Leaderboard
    <% } else { %>
         | <a class="bcLink" href="/dr?module=ViewLeaderBoard&sc=&sd=">Leaderboard</a>
    <% } %>

</p>
