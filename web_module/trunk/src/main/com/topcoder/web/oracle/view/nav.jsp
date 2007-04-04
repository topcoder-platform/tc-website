<%
    String selectedTab = request.getParameter("selectedTab") == null ? "" : request.getParameter("selectedTab");
%>

<div class="mininav">
    <h3>
        About this contest
    </h3>
    <A href="/to"<% if (selectedTab.equals("introduction")) {%> class="on"<% } %>>Introduction</A>
    <A href="?module=Static&d1=contestStructure"<% if (selectedTab.equals("structure")) {%> class="on"<% } %>>Contest Structure</A>
    <A href="?module=Static&d1=scoring"<% if (selectedTab.equals("scoring")) {%> class="on"<% } %>>Scoring</A>
<%--
    <h3>
        Homepage Designs
    </h3>
    <A href="/to/?module=ViewSimpleResults&rm=2001"<% if (selectedTab.equals("predRd1")) {%> class="on"<% } %>>Round 1 Prediction Results</A>
    <A href="/to/?module=ViewCandidateResults&rm=2001"<% if (selectedTab.equals("candRd1")) {%> class="on"<% } %>>Round 1 Candidate Results</A>
--%>
<!--
    <A href="/to/?module=">Compete in Round 2!</A>
-->
</div>
