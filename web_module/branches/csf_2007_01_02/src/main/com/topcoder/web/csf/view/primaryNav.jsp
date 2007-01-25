<%
    String selectedTab = request.getParameter("selectedTab") == null ? "" : request.getParameter("selectedTab");
%>

<div id="primaryNav">
<ul>
<li<% if (selectedTab.equals("home")) {%> class="on"<% } %> style="border-top: 1px solid #CCCCCC;"><A href="">Primary Nav On</A></li>
<li<% if (selectedTab.equals("schedule")) {%> class="on"<% } %>><A href="">Schedule</A></li>
<li<% if (selectedTab.equals("rules")) {%> class="on"<% } %>><A href="">Rules</A></li>
<li<% if (selectedTab.equals("competitions")) {%> class="on"<% } %>><A href="">Competitions</A></li>
<li<% if (selectedTab.equals("discuss")) {%> class="on"<% } %> style="background-image: none; border-bottom: 1px solid #CCCCCC;"><A href="">Discuss the Competitions</A></li>
</ul>
<A href="http://www.topcoder.com"><img src="/i/pbtc.png" alt="Powered by TopCoder" /></A>
</div>
