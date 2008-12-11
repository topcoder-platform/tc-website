<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%
    String selectedTab = request.getParameter("selectedTab") == null ? "" : request.getParameter("selectedTab");
%>

<div id="primaryNav">
    <ul>
        <li<% if (selectedTab.equals("home")) {%> class="on"<% } %> style="border-top: 1px solid #CCCCCC;">
            <A href="/" onfocus="this.blur();">Home</A></li>
        <li<% if (selectedTab.equals("schedule")) {%> class="on"<% } %>>
            <A href="/?module=Static&amp;d1=schedule" onfocus="this.blur();">Schedule</A></li>
        <li<% if (selectedTab.equals("rules")) {%> class="on"<% } %>>
            <A href="/?module=Static&amp;d1=rules" onfocus="this.blur();">Rules</A></li>
        <li<% if (selectedTab.equals("leaderboardOverview")) {%> class="on"<% } %>>
            <A href="/?module=Static&d1=leaderboardOverview" onfocus="this.blur();">Series Prizes</A></li>
        <li<% if (selectedTab.equals("creativeLeaderboard")) {%> class="on"<% } %>>
            <A href="/?module=Static&d1=creativeLeaderboard" onfocus="this.blur();">Series Leaderboard</A></li>
        <li<% if (selectedTab.equals("competitions")) {%> class="on"<% } %>>
            <A href="/?module=Static&amp;d1=competitions" onfocus="this.blur();">Competitions</A></li>
        <li<% if (selectedTab.equals("discuss")) {%> class="on"<% } %> style="background-image: none; border-bottom: 1px solid #CCCCCC;">
            <A href="/forums" onfocus="this.blur();">Discuss the Competitions</A></li>
    </ul>
    <A href="<tc-webtag:linkTracking link="http://www.topcoder.com" refer="csf_site_tc_logo"/>" style="margin-left: 5px;"><img src="/i/pbtc.png" alt="Powered by TopCoder"/></A>
</div>
