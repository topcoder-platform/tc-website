<%
    String selectedTab = request.getParameter("selectedTab") == null ? "" : request.getParameter("selectedTab");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<%--
<div id="topNav">
    <!-- PRIMARY -->
    <div class="primary">
        <A href="/to/"<% if (selectedTab.equals("introduction")) {%> class="on"<% } %>>Introduction</A>
        | <A href="?module=Static&d1=contestStructure"<% if (selectedTab.equals("structure")) {%> class="on"<% } %>>Contest Structure</A>
        | <A href="?module=Static&d1=scoring"<% if (selectedTab.equals("scoring")) {%> class="on"<% } %>>Scoring</A>
        | <A href="?module=ViewSimpleResults&rm=2001"<% if (selectedTab.equals("competitions")) {%> class="on"<% } %>>Competitions</A>
    </div>

    <!-- SECONDARY -->
    <% if (selectedTab.equals("competitions")) {%>
    <div class="secondary">
        <A href="?module=ViewSimpleResults&rm=2001"<% if (tabLev2.equals("tcdotcomRd1")) {%> class="on"<% } %>>Homepage Redesign Round 1</A>
        | <A href="?module=ViewBallot&rm=1999"<% if (tabLev2.equals("scoring")) {%> class="on"<% } %>>Homepage Redesign Round 2</A>
    </div>
    <% } %>

    <!-- TERTIARY -->
    <% if (tabLev2.equals("tcdotcomRd1")) {%>
    <div class="tertiary">
        <A href="?module=ViewSimpleResults&rm=2001"<% if (tabLev3.equals("prediction")) {%> class="on"<% } %>>Prediction Results</A>
        | <A href="?module=ViewCandidateResults&rm=2001"<% if (tabLev3.equals("candidate")) {%> class="on"<% } %>>Candidate Results</A>
    </div>
    <% } %>
</div>
--%>

<div id="miniNav">
    <div class="section">About these contests</div>
    <A href="/to/"<% if (selectedTab.equals("introduction")) {%> class="on"<% } %>>Introduction</A>
    <A href="?module=Static&d1=contestStructure"<% if (selectedTab.equals("structure")) {%> class="on"<% } %>>Contest Structure</A>
    <A href="?module=Static&d1=scoring"<% if (selectedTab.equals("scoring")) {%> class="on"<% } %>>Scoring</A>
    <div class="section">Homepage Redesign Round 1</div>
    <A href="?module=ViewSimpleResults&rm=2001"<% if (selectedTab.equals("2001PredRd1") || selectedTab.equals("2000CandRd2")) {%> class="on"<% } %>>Prediction Results</A>
    <A href="?module=ViewCandidateResults&rm=2001"<% if (selectedTab.equals("2001CandRd1") || selectedTab.equals("2000CandRd2")) {%> class="on"<% } %>>Candidate Results</A>
    <div class="section">Homepage Redesign Round 2</div>
    <A href="?module=ViewSimpleResults&rm=1999"<% if (selectedTab.equals("1999PredRd2")) {%> class="on"<% } %>>Prediction Results</A>
    <A href="?module=ViewCandidateResults&rm=1999"<% if (selectedTab.equals("1999CandRd2")) {%> class="on"<% } %>>Candidate Results</A>
</div>
