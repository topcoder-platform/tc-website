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
    <% if (tabLev2.equals("schedule")) {%>
        | Schedule
    <% } else { %>
         | <a class="bcLink" href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=schedule">Schedule</a>
    <% } %>
    <% if (tabLev2.equals("prizes")) {%>
        | Prizes
    <% } else { %>
         | <a class="bcLink" href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=prizes">Prizes</a>
    <% } %>
    <% if (tabLev2.equals("rules")) {%>
        | Rules
    <% } else { %>
         | <a class="bcLink" href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=rules">Rules</a>
    <% } %>
    <% if (tabLev2.equals("leaderboard")) {%>
        | Leaderboard
    <% } else { %>
         | <a class="bcLink" href="/dr?module=ViewLeaderBoard&sc=&sd=&tid=2020">Leaderboard</a>
    <% } %>

</p>
