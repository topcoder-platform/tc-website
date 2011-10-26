<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<div id="header">

    <h1><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=about" title="2008 TopCoder Open"><img src="/i/tournament/tco08/logo_tco08.png" width="186" height="123" alt="2008 TopCoder Open" /></a></h1>
    
    <%--
    <ul id="switcher">
        <li id="switcher_tournament"><a href="#" class="active"><span>The Tournament</span></a></li>
        <li id="switcher_symposium"><a href="#"><span>The Software Symposium</span></a></li>
    </ul> #switcher --%>
    <%-- Register Now 
    <a style="position: absolute; top: 15px; left: 350px;" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=registerNow"><img src="/i/tournament/tco08/registerNow.png" alt="REGISTER NOW!" /></a>
    --%>
    <%-- Header Links --%>
    <div style="position: absolute; top: 15px; left: 255px;">
        <map name="tco08headerLinks" id="tco08headerLinks">
        <area shape="rect" alt="" coords="0,10,113,30" target="_blank" href="/pdfs/tournaments/tco08/TCO08_Program_View.pdf" />
        <area shape="rect" alt="" coords="134,10,222,30" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=movies" />
        <area shape="rect" alt="" coords="241,10,333,30" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=photos" />
        <area shape="rect" alt="" coords="356,10,420,30" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=blog" />
        </map>
        <img src="/i/tournament/tco08/headerLinks.png" alt="TCO08 Header Links" usemap="#tco08headerLinks" style="display: block;" />
    </div>
    
    
    <%---- PRIMARY NAVIGATION ----%>
    <ul id="nav">
        <li id="nav_overview"><a title="Tournament Overview" onfocus="this.blur();" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=about"<% if (tabLev1.equals("overview")) {%> class="on"<% } %>>Tournament Overview</a></li>
        <li id="nav_algo"><a title="Algorithm Competition" onfocus="this.blur();" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=description"<% if (tabLev1.equals(EventType.ALGORITHM_TOURNAMENT_ID.toString())) {%> class="on"<% } %>>Algorithm Competition</a></li>
        <li id="nav_comp"><a title="Component Competition" onfocus="this.blur();" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=description"<% if (tabLev1.equals(EventType.COMPONENT_TOURNAMENT_ID.toString())) {%> class="on"<% } %>>Component Competition</a></li>
        <li id="nav_mm"><a title="Marathon Competition" onfocus="this.blur();" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=description"<% if (tabLev1.equals(EventType.MARATHON_TOURNAMENT_ID.toString())) {%> class="on"<% } %>>Marathon Competition</a></li>
        <li id="nav_studio"><a title="Studio Competition" onfocus="this.blur();" href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=description"<% if (tabLev1.equals(EventType.STUDIO_TOURNAMENT_ID.toString())) {%> class="on"<% } %>>Studio Competition</a></li>
    </ul><%-- #nav --%>
    

</div><%-- #header --%>

<div id="sidebar">

    <div align="center" style="padding: 0 0 20px 0;">
    <a href="javascript:arena();"><img src="/i/tournament/tco08/launchArena.png" alt="Launch Arena" /></a>
    </div>
    
    <div id="date">
    <h3><tc-webtag:format object="<%=new Date()%>" format="EEEE, MMMM d, yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/></h3>
    </div>

    <div align="center"><p style="font-size:12px; color:#ed1c24;"><strong>Sponsors and Event Patrons</strong></p></div><br />
    <ul id="sponsors">
        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=lilly"><img src="/i/tournament/tco08/lilly_logo_nav.png" width="186" height="80" alt="Eli Lilly" /></a></li>
        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=nsa"><img src="/i/tournament/tco08/nsa_logo_nav.png" width="186" height="80" alt="NSA" /></a></li>
        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=aol"><img src="/i/tournament/tco08/aol_logo_nav.png" width="186" height="80" alt="AOL" /></a></li>
        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=verisign"><img src="/i/tournament/tco08/verisign_logo_nav.png" width="186" height="80" alt="VeriSign" /></a></li>
        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=bt"><img src="/i/tournament/tco08/bt_logo_nav.png" width="186" height="80" alt="BT" /></a></li>
        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=betfair"><img src="/i/tournament/tco08/betfair_logo_nav.png" width="186" height="80" alt="Betfair" /></a></li>
    </ul>
        
</div>

<div id="mainmiddle"><div id="mainwrapper"><div id="main">

    <div id="content">
        <div id="menuwrap">
            <div id="menu">
                <%--------------- SECONDARY NAVIGATION ---------------%>
                <ul id="menunav2">
                    <% if (tabLev1.equals("overview")) {%>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=about"<% if (tabLev2.equals("details")) {%> class="on"<% } %>>Details</a></li>
                        <li><a target="_blank" href="/pdfs/tournaments/tco08/TCO08_Program_View.pdf">Program [PDF]</a></li>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=onsiteSchedule"<% if (tabLev2.equals("joinus")) {%> class="on"<% } %>>Join Us Onsite</a></li>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=blog"<% if (tabLev2.equals("onsiteevents")) {%> class="on"<% } %>>Onsite Events</a></li>
                        <%--
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=roundTable"<% if (tabLev2.equals("roundtable")) {%> class="on"<% } %>>Roundtable Discussion</a></li>
                        --%>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=lilly"<% if (tabLev2.equals("sponsors")) {%> class="on"<% } %>>Sponsors</a></li>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=nsa"<% if (tabLev2.equals("eventpatrons")) {%> class="on"<% } %>>Event Patrons</a></li>
                        
                    <% } else if (tabLev1.equals(EventType.ALGORITHM_TOURNAMENT_ID.toString())) { %>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=description"<% if (tabLev2.equals("description")) {%> class="on"<% } %>>Description</a></li>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=schedule"<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a></li>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=rules"<% if (tabLev2.equals("rules")) {%> class="on"<% } %>>Rules</a></li>
                        <%--
                        <li><a href="/tco08?module=ViewRegistration&amp;et=6"<% if (tabLev2.equals("register")) {%> class="on"<% } %>>Register</a></li>
                        --%>
                        <li><a href="/tco08?module=Registrants&amp;et=6"<% if (tabLev2.equals("registrants")) {%> class="on"<% } %>>Registrants</a></li>
                        <li><a href="/tco08?module=AlgorithmAdvancers"<% if (tabLev2.equals("advancers")) {%> class="on"<% } %>>Advancers</a></li>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=algoSemi01"<% if (tabLev2.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                        
                    <% } else if (tabLev1.equals(EventType.COMPONENT_TOURNAMENT_ID.toString())) { %>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=description"<% if (tabLev2.equals("description")) {%> class="on"<% } %>>Description</a></li>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=schedule"<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a></li>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=rules"<% if (tabLev2.equals("rules")) {%> class="on"<% } %>>Rules</a></li>
                        <%--
                        <li><a href="/tco08?module=ViewRegistration&amp;et=5"<% if (tabLev2.equals("register")) {%> class="on"<% } %>>Register</a></li>
                        --%>
                        <li><a href="/tco08?module=Registrants&amp;et=5"<% if (tabLev2.equals("registrants")) {%> class="on"<% } %>>Registrants</a></li>
                        <li><a href="/tco08?module=ContestDetails&amp;ct=460&amp;eid=3006"<% if (tabLev2.equals("design")) {%> class="on"<% } %>>Design</a></li>
                        <li><a href="/tco08?module=ContestDetails&amp;ct=461&amp;eid=3006"<% if (tabLev2.equals("development")) {%> class="on"<% } %>>Development</a></li>
                        
                    <% } else if (tabLev1.equals(EventType.MARATHON_TOURNAMENT_ID.toString())) { %>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=description"<% if (tabLev2.equals("description")) {%> class="on"<% } %>>Description</a></li>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=schedule"<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a></li>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=rules"<% if (tabLev2.equals("rules")) {%> class="on"<% } %>>Rules</a></li>
                        <%--
                        <li><a href="/tco08?module=ViewRegistration&amp;et=9"<% if (tabLev2.equals("register")) {%> class="on"<% } %>>Register</a></li>
                        --%>
                        <li><a href="/tco08?module=Registrants&amp;et=9"<% if (tabLev2.equals("registrants")) {%> class="on"<% } %>>Registrants</a></li>
                        <li><a href="/tco08?module=MarathonAdvancers"<% if (tabLev2.equals("advancers")) {%> class="on"<% } %>>Advancers</a></li>
                        <%--
                        <li><a href=""<% if (tabLev2.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                        --%>
                        
                    <% } else if (tabLev1.equals(EventType.STUDIO_TOURNAMENT_ID.toString())) { %>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=description"<% if (tabLev2.equals("description")) {%> class="on"<% } %>>Description</a></li>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=schedule"<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a></li>
                        <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=rules"<% if (tabLev2.equals("rules")) {%> class="on"<% } %>>Rules</a></li>
                        <%--
                        <li><a href="/tco08?module=ViewRegistration&amp;et=7"<% if (tabLev2.equals("register")) {%> class="on"<% } %>>Register</a></li>
                        --%>
                        <li><a href="/tco08?module=Registrants&amp;et=7"<% if (tabLev2.equals("registrants")) {%> class="on"<% } %>>Registrants</a></li>
                        <li><a href="/tco08?module=StudioLeaders&amp;eid=3008"<% if (tabLev2.equals("advancers")) {%> class="on"<% } %>>Advancers</a></li>
                        <%--
                        <li><a href=""<% if (tabLev2.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                        --%>
                    <% } %>
                </ul>
                
                <%--------------- TERTIARY NAVIGATION ---------------%>
                <ul id="menunav3">
                    <li>&nbsp;</li>
                    <li>&nbsp;</li>
                    <% if (tabLev1.equals("overview")) {%>
                        <% if (tabLev2.equals("joinus")) {%>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=onsiteSchedule"<% if (tabLev3.equals("onsiteschedule")) {%> class="on"<% } %>>Onsite Schedule</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=devForums"<% if (tabLev3.equals("devforums")) {%> class="on"<% } %>>Developer Forums</a></li>
                            <li><a target="_blank" href="/wiki/display/tc/Getting+your+Visa+and+Getting+it+Early"<% if (tabLev3.equals("getvisa")) {%> class="on"<% } %>>Getting a Visa</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=transportation"<% if (tabLev3.equals("transportation")) {%> class="on"<% } %>>Travel Information</a></li>
                        
                        <% } else if (tabLev2.equals("onsiteevents")) { %>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=blog"<% if (tabLev3.equals("blog")) {%> class="on"<% } %>>Blog</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=movies"<% if (tabLev3.equals("movies")) {%> class="on"<% } %>>Movies</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=photos"<% if (tabLev3.equals("photos")) {%> class="on"<% } %>>Photos</a></li>
                        
                        <% } else if (tabLev2.equals("sponsors")) { %>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=lilly"<% if (tabLev3.equals("lilly")) {%> class="on"<% } %>>Lilly</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=aol"<% if (tabLev3.equals("aol")) {%> class="on"<% } %>>AOL</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=verisign"<% if (tabLev3.equals("verisign")) {%> class="on"<% } %>>VeriSign</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=bt"<% if (tabLev3.equals("bt")) {%> class="on"<% } %>>BT</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=betfair"<% if (tabLev3.equals("betfair")) {%> class="on"<% } %>>Betfair</a></li>
                        <% } else if (tabLev2.equals("eventpatrons")) { %>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=nsa"<% if (tabLev3.equals("nsa")) {%> class="on"<% } %>>NSA</a></li>
                    <% } %>
                    
                    <% } else if (tabLev1.equals(EventType.ALGORITHM_TOURNAMENT_ID.toString())) { %>
                        <% if (tabLev2.equals("advancers")) {%>
                            <li><a href="/tco08?module=AlgorithmQualification"<% if (tabLev3.equals("qualification")) {%> class="on"<% } %>>Qualification</a></li>
                            <li><a href="/tco08?module=AlgorithmAdvancers"<% if (tabLev3.equals("overview")) {%> class="on"<% } %>>Overview</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=bracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a></li>
                        <% } else if (tabLev2.equals("summary")) { %>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=algoSemi01"<% if (tabLev3.equals("room1")) {%> class="on"<% } %>>Room 1</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=algoSemi02"<% if (tabLev3.equals("room2")) {%> class="on"<% } %>>Room 2</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=algoSemi03"<% if (tabLev3.equals("room3")) {%> class="on"<% } %>>Room 3</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=algoWildcard"<% if (tabLev3.equals("wildcard")) {%> class="on"<% } %>>Wildcard</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=algorithm&amp;d4=algoFinals"<% if (tabLev3.equals("finals")) {%> class="on"<% } %>>Finals</a></li>
                    <% } %>
                    
                    <% } else if (tabLev1.equals(EventType.COMPONENT_TOURNAMENT_ID.toString())) { %>
                        <% if (tabLev2.equals("design")) {%>
                            <li><a href="/tco08?module=ContestDetails&amp;ct=460&amp;eid=3006"<% if (tabLev3.equals("results")) {%> class="on"<% } %>>Results</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=desBracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=desSummary"<% if (tabLev3.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                        <% } else if (tabLev2.equals("development")) { %>
                            <li><a href="/tco08?module=ContestDetails&amp;ct=461&amp;eid=3006"<% if (tabLev3.equals("results")) {%> class="on"<% } %>>Results</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=devBracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=component&amp;d4=devSummary"<% if (tabLev3.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                    <% } %>
                    
                    <% } else if (tabLev1.equals(EventType.MARATHON_TOURNAMENT_ID.toString())) { %>
                        <% if (tabLev2.equals("advancers")) {%>
                            <li><a href="/tco08?module=MarathonAdvancers"<% if (tabLev3.equals("overview")) {%> class="on"<% } %>>Overview</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=bracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=marathon&amp;d4=summary"<% if (tabLev3.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                        <% } %>
                    
                    <% } else if (tabLev1.equals(EventType.STUDIO_TOURNAMENT_ID.toString())) { %>
                        <% if (tabLev2.equals("advancers")) {%>
                            <li><a href="/tco08?module=StudioLeaders&amp;eid=3008"<% if (tabLev3.equals("leaderboard")) {%> class="on"<% } %>>Leaderboard</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=bracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a></li>
                            <li><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=studio&amp;d4=summary"<% if (tabLev3.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                        <% } %>
                    <% } %>
                </ul>
            </div>
            <div class="clearleft"></div>
        </div><%-- #menuwrap --%>