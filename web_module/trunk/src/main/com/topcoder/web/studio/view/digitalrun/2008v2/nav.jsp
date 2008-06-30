<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
%>

<p align="right">

    <% if (tabLev2.equals("overview")) {%>
        Overview
    <% } else { %>
        <a class="bcLink" href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=overview">Overview</a>
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

    | <a class="bcLink" href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&amp;d1=digital_run&amp;d2=description">Digital Run Homepage</a><br />

</p>
