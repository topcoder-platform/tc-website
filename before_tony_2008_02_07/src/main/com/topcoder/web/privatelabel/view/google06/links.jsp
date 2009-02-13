<%
    String selectedTab = request.getParameter("selectedTab") == null ? "" : request.getParameter("selectedTab");
%>
<div class="googleTopNav">
    <!-- Overview tab -->
    <% if (selectedTab.equals("overview")) {%>
    <span class="navOn">Overview</span> &nbsp;|&nbsp;
    <% } else { %>
    <a class="navLink" href="/pl/?module=Static&d1=google06&d2=overview">Overview</a> &nbsp;|&nbsp;
    <% } %>

    <!-- Schedule tab -->
    <% if (selectedTab.equals("schedule")) {%>
    <span class="navOn">Schedule</span> &nbsp;|&nbsp;
    <% } else { %>
    <a class="navLink" href="/pl/?module=Static&d1=google06&d2=schedule">Schedule</a> &nbsp;|&nbsp;
    <% } %>

    <!-- Rules tab -->
    <% if (selectedTab.equals("rules")) {%>
    <span class="navOn">Rules</span> &nbsp;|&nbsp;
    <% } else { %>
    <a class="navLink" href="/pl/?module=Static&d1=google06&d2=rules">Rules</a> &nbsp;|&nbsp;
    <% } %>

    <!-- Registration tab -->

    <% if (selectedTab.equals("registration")) {%>
    <span class="navOn">Registration</span> &nbsp;|&nbsp;
    <% } else { %>
    <a class="navLink" href="/pl/?module=Static&d1=google06&d2=login">Registration</a> &nbsp;|&nbsp;
    <% } %>


    <!-- Instructions tab -->
    <% if (selectedTab.equals("instructions")) {%>
    <span class="navOn">Instructions</span> &nbsp;|&nbsp;
    <% } else { %>
    <a class="navLink" href="/pl/?module=Static&d1=google06&d2=instructions">Instructions</a> &nbsp;|&nbsp;
    <% } %>

    <!-- FAQ tab -->
    <% if (selectedTab.equals("faq")) {%>
    <span class="navOn">FAQ</span> &nbsp;|&nbsp;
    <% } else { %>
    <a class="navLink" href="/pl/?module=Static&d1=google06&d2=faq">FAQ</a> &nbsp;|&nbsp;
    <% } %>

    <!-- Advancers tab -->
                <% if (selectedTab.equals("advancers")) {%>
                     <span class="navOn">Advancers</span> &nbsp;|&nbsp;
                <% } else { %>
                      <a class="navLink" href="/pl/?module=Static&d1=google06&d2=advancers">Advancers</a> &nbsp;|&nbsp;
                <% } %>

    <!-- Practice Arena  tab -->
    <% if (selectedTab.equals("arena")) {%>
    <span class="navOn">Competition Arena</span> &nbsp;|&nbsp;
    <% } else { %>
    <a class="navLink" href="/pl/?module=Static&d1=google06&d2=arena">Competition Arena</a> &nbsp;|&nbsp;
    <% } %>

    <!-- Google Groups  tab -->
    <% if (selectedTab.equals("forum")) {%>
    <span class="navOn">Code Jam Group</span>
    <% } else { %>
    <a class="navLink" href="/?t=sponsor&c=link&link=http://groups.google.com/group/Code-Jam-2006" target="_blank">Code
        Jam Group</a>
    <% } %>
</div>

<br><br>
<span class="bigRed"><A href="/pl/?&module=Static&d1=google06&d2=advWinners" class="bigRed">The results of the Championship Round</A> are in!</span>