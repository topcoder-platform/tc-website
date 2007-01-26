<%
    String selectedTab = request.getParameter("selectedTab") == null ? "" : request.getParameter("selectedTab");
%>

<div id="primaryNav">
<ul>
<li<% if (selectedTab.equals("home")) {%> class="on"<% } %> style="border-top: 1px solid #CCCCCC;"><A href="/" onfocus="this.blur();">Home</A></li>
<li<% if (selectedTab.equals("schedule")) {%> class="on"<% } %>><A href="" onfocus="this.blur();">Schedule</A></li>
<li<% if (selectedTab.equals("rules")) {%> class="on"<% } %>><A href="" onfocus="this.blur();">Rules</A></li>
<li<% if (selectedTab.equals("competitions")) {%> class="on"<% } %>><A href="/?module=ViewActiveContests" onfocus="this.blur();">Competitions</A></li>
<li<% if (selectedTab.equals("discuss")) {%> class="on"<% } %> style="background-image: none; border-bottom: 1px solid #CCCCCC;"><A href="" onfocus="this.blur();">Discuss the Competitions</A></li>
</ul>
<A href="http://www.topcoder.com" style="margin-left: 5px;"><img src="/i/pbtc.png" alt="Powered by TopCoder" /></A>
</div>
