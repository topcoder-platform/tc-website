<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<div id="header">
    <h1><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=overview" title="2008 TopCoder High School"><img src="/i/tournament/tchs08/logo_tchs.gif" width="155" height="130" alt="2008 TopCoder High School" /></a></h1>
    
    <h3 id="powered"><a href="/" title="Powered by TopCoder"><img src="/i/tournament/tchs08/logo_tc.gif" width="151" height="22" alt="TopCoder" /></a></h3>
    <%--
    <div class="message"><a href="/tchs08?module=ViewRegistration">REGISTER</a></div>    
    --%>

    <ul id="nav">
        <li id="nav_overview"><a title="TCHS08 Overview" onfocus="this.blur();" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=overview"<% if (tabLev1.equals("overview")) {%> class="active"<% } %>>Overview</a></li>
        <li id="nav_program"><a title="Download Tournament Program (PDF)" onfocus="this.blur();" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=program"<% if (tabLev1.equals("program")) {%> class="active"<% } %>>Tournament Program</a></li>
        <li id="nav_online"><a title="View Online Schedule" onfocus="this.blur();" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=onlineSchedule"<% if (tabLev1.equals("onlineSchedule")) {%> class="active"<% } %>>Online Schedule</a></li>
        <li id="nav_onsite"><a title="View Onsite Schedule" onfocus="this.blur();" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=onsiteSchedule"<% if (tabLev1.equals("onsiteSchedule")) {%> class="active"<% } %>>Onsite Schedule</a></li>
        <li id="nav_rules"><a title="TCHS08 Rules" onfocus="this.blur();" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=rules"<% if (tabLev1.equals("rules")) {%> class="active"<% } %>>Rules</a></li>
        <li id="nav_visa"><a title="Getting a Visa" onfocus="this.blur();" target="_blank" href="/wiki/display/tc/Getting+your+Visa+and+Getting+it+Early"<% if (tabLev1.equals("getVisa")) {%> class="active"<% } %>>Getting a Visa</a></li>
        <li id="nav_individual"><a title="Individual Results" onfocus="this.blur();" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=bracketInd"<% if (tabLev1.equals("resultsInd")) {%> class="active"<% } %>>Individual Results</a></li>
        <li id="nav_registrants"><a title="Registrants" onfocus="this.blur();" href="/tchs08?module=ViewEventRegistrants&amp;eid=992"<% if (tabLev1.equals("registrants")) {%> class="active"<% } %>>Registrants</a></li>
        <li id="nav_purdue"><a title="Purdue" onfocus="this.blur();" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tchs08&amp;d3=purdue"<% if (tabLev1.equals("purdue")) {%> class="active"<% } %>>Purdue</a></li>
    </ul>
    
</div>

    <div id="main"><div id="mainwrapper">