<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
%>

<div id="eventLogo">
    <img src="/i/digital_run/digitalrunlogo20080625.png" alt="The Digital Run" />
</div>

<div id="eventBannerBox">
    <img src="/i/digital_run/ban20080625.png" alt="" />
</div>

<hr />

<div style="float:right; text-align:right;">

<% if (tabLev1.equals("design")) {%>

    <% if (tabLev2.equals("overview")) {%>
        Overview
    <% } else { %>
        <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=desOverview">Overview</a>
    <% } %>
    <% if (tabLev2.equals("2011_tournament")) {%>
        | 2011 Tournament
    <% } else { %>
        | <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=2011_tournament">2011 Tournament</a>
    <% } %>
    <% if (tabLev2.equals("schedule")) {%>
        | Schedule
    <% } else { %>
         | <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=desSchedule">Schedule</a>
    <% } %>
    <% if (tabLev2.equals("prizes")) {%>
        | Prizes
    <% } else { %>
         | <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=desPrizes">Prizes</a>
    <% } %>
    <% if (tabLev2.equals("rules")) {%>
        | Rules
    <% } else { %>
         | <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=desRules">Rules</a>
    <% } %>

    | <a class="bcLink" href="/dr">Go back</a><br />
<%--
    <a class="bcLink" href="">Current Leaderboard</a>
--%>

<% } else if (tabLev1.equals("development")) { %>

    <% if (tabLev2.equals("overview")) {%>
        Overview
    <% } else { %>
        <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=devOverview">Overview</a>
    <% } %>
    <% if (tabLev2.equals("2011_tournament")) {%>
        | 2011 Tournament
    <% } else { %>
        | <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=2011_tournament">2011 Tournament</a>
    <% } %>
    <% if (tabLev2.equals("schedule")) {%>
        | Schedule
    <% } else { %>
         | <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=devSchedule">Schedule</a>
    <% } %>
    <% if (tabLev2.equals("prizes")) {%>
        | Prizes
    <% } else { %>
         | <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=devPrizes">Prizes</a>
    <% } %>
    <% if (tabLev2.equals("rules")) {%>
        | Rules
    <% } else { %>
         | <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=devRules">Rules</a>
    <% } %>

    | <a class="bcLink" href="/dr">Go back</a><br />
    
<%--
    <a class="bcLink" href="">Current Leaderboard</a>
--%>

<% } else if (tabLev1.equals("assembly")) { %>

    <% if (tabLev2.equals("overview")) {%>
        Overview
    <% } else { %>
        <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=asmOverview">Overview</a>
    <% } %>
    <% if (tabLev2.equals("2011_tournament")) {%>
        | 2011 Tournament
    <% } else { %>
        | <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=2011_tournament">2011 Tournament</a>
    <% } %>
    <% if (tabLev2.equals("schedule")) {%>
        | Schedule
    <% } else { %>
         | <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=asmSchedule">Schedule</a>
    <% } %>
    <% if (tabLev2.equals("prizes")) {%>
        | Prizes
    <% } else { %>
         | <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=asmPrizes">Prizes</a>
    <% } %>
    <% if (tabLev2.equals("rules")) {%>
        | Rules
    <% } else { %>
         | <a class="bcLink" href="/tc?module=Static&amp;d1=digital_run&amp;d2=2008v2&amp;d3=asmRules">Rules</a>
    <% } %>

    | <a class="bcLink" href="/dr">Go back</a><br />
    
<%--
    <a class="bcLink" href="">Current Leaderboard</a>
--%>

<% } %>

</div>
