<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<div id="header">
    <h1><a href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=overview" title="2008 TopCoder High School"><img src="/i/tournament/tchs08/logo_tchs.gif" width="155" height="130" alt="2008 TopCoder High School" /></a></h1>
    
    <h3 id="powered"><a href="/" title="Powered by TopCoder"><img src="/i/tournament/tchs08/logo_tc.gif" width="151" height="22" alt="TopCoder" /></a></h3>
    
    <ul id="nav">
        <li id="nav_overview"><a title="TCHS08 Overview" href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=overview"<% if (tabLev1.equals("overview")) {%> class="active"<% } %>>Overview</a></li>
        <li id="nav_program"><a title="Download Tournament Program (PDF)" href="#"<% if (tabLev1.equals("program")) {%> class="active"<% } %>>Tournament Program</a></li>
        <li id="nav_online"><a title="View Online Schedule" href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=onlineSchedule"<% if (tabLev1.equals("onlineSchedule")) {%> class="active"<% } %>>Online Schedule</a></li>
        <li id="nav_onsite"><a title="View Onsite Schedule" href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=onsiteSchedule"<% if (tabLev1.equals("onsiteSchedule")) {%> class="active"<% } %>>Onsite Schedule</a></li>
        <li id="nav_rules"><a title="TCHS08 Rules" href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=rules"<% if (tabLev1.equals("rules")) {%> class="active"<% } %>>Rules</a></li>
        <li id="nav_visa"><a title="Getting a Visa" href="/wiki/display/tc/Getting+your+Visa+and+Getting+it+Early"<% if (tabLev1.equals("getVisa")) {%> class="active"<% } %>>Getting a Visa</a></li>
        <li id="nav_individual"><a title="Individual Results" href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=bracketInd"<% if (tabLev1.equals("resultsInd")) {%> class="active"<% } %>>Individual Results</a></li>
        <li id="nav_registrants"><a title="Registrants" href="#"<% if (tabLev1.equals("registrants")) {%> class="active"<% } %>>Registrants</a></li>
        <li id="nav_purdue"><a title="Purdue" href="/tc?module=Static&d1=tournaments&d2=tchs08&d3=purdue"<% if (tabLev1.equals("purdue")) {%> class="active"<% } %>>Purdue</a></li>
    </ul>
    
</div>
