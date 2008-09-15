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

    <div class="section">TCO07 Algorithm T-Shirt Design</div>
    <A href="?module=ViewSimpleResults&rm=2012"<% if (selectedTab.equals("2012Pred")) {%> class="on"<% } %>>Prediction Results</A>
    <A href="?module=ViewCandidateResults&rm=2012"<% if (selectedTab.equals("2012Cand")) {%> class="on"<% } %>>Candidate Results</A>

    <div class="section">TCO07 Component T-Shirt Design</div>
    <A href="?module=ViewSimpleResults&rm=2016"<% if (selectedTab.equals("2016Pred")) {%> class="on"<% } %>>Prediction Results</A>
    <A href="?module=ViewCandidateResults&rm=2016"<% if (selectedTab.equals("2016Cand")) {%> class="on"<% } %>>Candidate Results</A>

    <div class="section">TCO07 Marathon T-Shirt Design</div>
    <A href="?module=ViewSimpleResults&rm=2020"<% if (selectedTab.equals("2020Pred")) {%> class="on"<% } %>>Prediction Results</A>
    <A href="?module=ViewCandidateResults&rm=2020"<% if (selectedTab.equals("2020Cand")) {%> class="on"<% } %>>Candidate Results</A>

    <div class="section">TCO07 Studio T-Shirt Design</div>
    <A href="?module=ViewSimpleResults&rm=2008"<% if (selectedTab.equals("2008Pred")) {%> class="on"<% } %>>Prediction Results</A>
    <A href="?module=ViewCandidateResults&rm=2008"<% if (selectedTab.equals("2008Cand")) {%> class="on"<% } %>>Candidate Results</A>

    <div class="section">"The Ball" Logo & Icons Round 2</div>
    <span class="grayedOut">Registration closed</span>

    <div class="section">"The Ball" Logo & Icons Round 1</div>
    <span class="grayedOut">Registration closed</span>

    <div class="section">Homepage Redesign Round 2</div>
    <A href="?module=ViewSimpleResults&rm=1999"<% if (selectedTab.equals("1999Pred")) {%> class="on"<% } %>>Prediction Results</A>
    <A href="?module=ViewCandidateResults&rm=1999"<% if (selectedTab.equals("1999Cand")) {%> class="on"<% } %>>Candidate Results</A>

    <div class="section">Homepage Redesign Round 1</div>
    <A href="?module=ViewSimpleResults&rm=2001"<% if (selectedTab.equals("2001Pred") || selectedTab.equals("2000Pred")) {%> class="on"<% } %>>Prediction Results</A>
    <A href="?module=ViewCandidateResults&rm=2001"<% if (selectedTab.equals("2001Cand") || selectedTab.equals("2000Cand")) {%> class="on"<% } %>>Candidate Results</A>
</div>