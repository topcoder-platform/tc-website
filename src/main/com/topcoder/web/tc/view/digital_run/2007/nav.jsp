<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
%>

<div style="float:right; text-align:right;">

<% if (tabLev1.equals("design")) {%>

    <% if (tabLev2.equals("overview")) {%>
        Overview
    <% } else { %>
        <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2007&d3=desOverview">Overview</A>
    <% } %>
    <% if (tabLev2.equals("schedule")) {%>
        | Schedule
    <% } else { %>
         | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2007&d3=desSchedule">Schedule</A>
    <% } %>
    <% if (tabLev2.equals("prizes")) {%>
        | Prizes
    <% } else { %>
         | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2007&d3=desPrizes">Prizes</A>
    <% } %>
    <% if (tabLev2.equals("roty")) {%>
        | Rookie of the Year
    <% } else { %>
         | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2007&d3=desRoty">Rookie of the Year</A>
    <% } %>
    <% if (tabLev2.equals("rules")) {%>
        | Rules
    <% } else { %>
         | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2007&d3=desRules">Rules</A>
    <% } %>
    <br>
    <A class="bcLink" href="">Leaderboard</A> | 
    <A class="bcLink" href="">ROTY leaderboard</A>

<% } else if (tabLev1.equals("development")) { %>

    <% if (tabLev2.equals("overview")) {%>
        Overview
    <% } else { %>
        <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2007&d3=devOverview">Overview</A>
    <% } %>
    <% if (tabLev2.equals("schedule")) {%>
        | Schedule
    <% } else { %>
         | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2007&d3=devSchedule">Schedule</A>
    <% } %>
    <% if (tabLev2.equals("prizes")) {%>
        | Prizes
    <% } else { %>
         | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2007&d3=devPrizes">Prizes</A>
    <% } %>
    <% if (tabLev2.equals("roty")) {%>
        | Rookie of the Year
    <% } else { %>
         | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2007&d3=devRoty">Rookie of the Year</A>
    <% } %>
    <% if (tabLev2.equals("rules")) {%>
        | Rules
    <% } else { %>
         | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2007&d3=devRules">Rules</A>
    <% } %>
    <br>
    <A class="bcLink" href="">Leaderboard</A> | 
    <A class="bcLink" href="">ROTY leaderboard</A>

<% } %>

</div>
