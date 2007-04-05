<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<div id="topNav">
    <!-- PRIMARY -->
    <div class="primary">
        <A href="/to/"<% if (tabLev1.equals("introduction")) {%> class="on"<% } %>>Introduction</A>
        | <A href="?module=Static&d1=contestStructure"<% if (tabLev1.equals("structure")) {%> class="on"<% } %>>Contest Structure</A>
        | <A href="?module=Static&d1=scoring"<% if (tabLev1.equals("scoring")) {%> class="on"<% } %>>Scoring</A>
        | <A href="?module=ViewSimpleResults&rm=2001"<% if (tabLev1.equals("competitions")) {%> class="on"<% } %>>Competitions</A>
    </div>

    <!-- SECONDARY -->
    <% if (tabLev1.equals("competitions")) {%>
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
