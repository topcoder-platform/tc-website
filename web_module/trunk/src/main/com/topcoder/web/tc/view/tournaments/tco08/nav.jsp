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

    <h1><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=about" title="2008 TopCoder Open"><img src="/i/tournament/tco08/logo_tco08.png" width="186" height="123" alt="2008 TopCoder Open" /></a></h1>
    
    <%--
    <ul id="switcher">
        <li id="switcher_tournament"><a href="#" class="active"><span>The Tournament</span></a></li>
        <li id="switcher_symposium"><a href="#"><span>The Software Symposium</span></a></li>
    </ul> #switcher --%>
    
    <%---- PRIMARY NAVIGATION ----%>
    <ul id="nav">
        <li id="nav_overview"><a title="Tournament Overview" onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tco08&d3=about"<% if (tabLev1.equals("overview")) {%> class="on"<% } %>>Tournament Overview</a></li>
        <li id="nav_algo"><a title="Algorithm Competition" onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=description"<% if (tabLev1.equals(EventType.ALGORITHM_TOURNAMENT_ID.toString())) {%> class="on"<% } %>>Algorithm Competition</a></li>
        <li id="nav_comp"><a title="Component Competition" onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=description"<% if (tabLev1.equals(EventType.COMPONENT_TOURNAMENT_ID.toString())) {%> class="on"<% } %>>Component Competition</a></li>
        <li id="nav_mm"><a title="Marathon Competition" onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tco08&d3=marathon&d4=description"<% if (tabLev1.equals(EventType.MARATHON_TOURNAMENT_ID.toString())) {%> class="on"<% } %>>Marathon Competition</a></li>
        <li id="nav_studio"><a title="Studio Competition" onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tco08&d3=studio&d4=description"<% if (tabLev1.equals(EventType.STUDIO_TOURNAMENT_ID.toString())) {%> class="on"<% } %>>Studio Competition</a></li>
    </ul><%-- #nav --%>
    

</div><%-- #header --%>

<div id="sidebar">

    <div id="date">
    <h3><tc-webtag:format object="<%=new Date()%>" format="EEEE, MMMM d, yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/></h3>
    </div>
    
    <ul id="sponsors">
        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=sponsorpatrons&d4=lilly"><img src="/i/tournament/tco08/lilly_logo_nav.png" width="186" height="80" alt="Eli Lilly" /></a></li>
        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=sponsorpatrons&d4=nsa"><img src="/i/tournament/tco08/nsa_logo_nav.png" width="186" height="80" alt="NSA" /></a></li>
        <%--
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        <li><a href="#"><img src="/i/tournament/tco08/ads.png" alt="Sponsors Name" width="168" height="58" alt="Ads" /></a></li>
        --%>
    </ul>
        
</div>

<div id="mainmiddle"><div id="mainwrapper"><div id="main">

    <div id="content">
        <div id="menuwrap">
            <div id="menu">
                <%--------------- SECONDARY NAVIGATION ---------------%>
                <ul id="menunav2">
                    <% if (tabLev1.equals("overview")) {%>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=about"<% if (tabLev2.equals("details")) {%> class="on"<% } %>>Details</a></li>
                        <%--
                        <li><a target="_blank" href="/pdfs/tournaments/TCO08_Program_View.pdf">Program [PDF]</a></li>
                        --%>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=onsiteSchedule"<% if (tabLev2.equals("joinus")) {%> class="on"<% } %>>Join Us Onsite</a></li>
                        <%--
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=roundTable"<% if (tabLev2.equals("roundtable")) {%> class="on"<% } %>>Roundtable Discussion</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=movies"<% if (tabLev2.equals("onsiteevents")) {%> class="on"<% } %>>Onsite events</a></li>
                        --%>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=sponsorpatrons&d4=lilly"<% if (tabLev2.equals("sponsors")) {%> class="on"<% } %>>Sponsors</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=sponsorpatrons&d4=nsa"<% if (tabLev2.equals("eventpatrons")) {%> class="on"<% } %>>Event Patrons</a></li>
                        
                    <% } else if (tabLev1.equals(EventType.ALGORITHM_TOURNAMENT_ID.toString())) { %>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=description"<% if (tabLev2.equals("description")) {%> class="on"<% } %>>Description</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=schedule"<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=rules"<% if (tabLev2.equals("rules")) {%> class="on"<% } %>>Rules</a></li>
                        <li><a href="/tco08?module=ViewRegistration&et=6"<% if (tabLev2.equals("register")) {%> class="on"<% } %>>Register</a></li>
                        <li><a href="/tco08?module=Registrants&et=6"<% if (tabLev2.equals("registrants")) {%> class="on"<% } %>>Registrants</a></li>
                        <%--
                        <li><a href="/tc?module=tco08AlgorithmAdvancers"<% if (tabLev2.equals("advancers")) {%> class="on"<% } %>>Advancers</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=algoSemi01"<% if (tabLev2.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                        --%>
                        
                    <% } else if (tabLev1.equals(EventType.COMPONENT_TOURNAMENT_ID.toString())) { %>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=description"<% if (tabLev2.equals("description")) {%> class="on"<% } %>>Description</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=schedule"<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=rules"<% if (tabLev2.equals("rules")) {%> class="on"<% } %>>Rules</a></li>
                        <li><a href="/tco08?module=ViewRegistration&et=5"<% if (tabLev2.equals("register")) {%> class="on"<% } %>>Register</a></li>
                        <li><a href="/tco08?module=Registrants&et=5"<% if (tabLev2.equals("registrants")) {%> class="on"<% } %>>Registrants</a></li>
                        <%--
                        <li><a href="/tc?module=tco08ContestDetails&ct=420&eid=3002"<% if (tabLev2.equals("design")) {%> class="on"<% } %>>Design</a></li>
                        <li><a href="/tc?module=tco08ContestDetails&ct=421&eid=3002"<% if (tabLev2.equals("development")) {%> class="on"<% } %>>Development</a></li>
                        --%>
                        
                    <% } else if (tabLev1.equals(EventType.MARATHON_TOURNAMENT_ID.toString())) { %>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=marathon&d4=description"<% if (tabLev2.equals("description")) {%> class="on"<% } %>>Description</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=marathon&d4=schedule"<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=marathon&d4=rules"<% if (tabLev2.equals("rules")) {%> class="on"<% } %>>Rules</a></li>
                        <li><a href="/tco08?module=ViewRegistration&et=9"<% if (tabLev2.equals("register")) {%> class="on"<% } %>>Register</a></li>
                        <li><a href="/tco08?module=Registrants&et=9"<% if (tabLev2.equals("registrants")) {%> class="on"<% } %>>Registrants</a></li>
                        <%--
                        <li><a href="/tc?module=tco08MarathonAdvancers"<% if (tabLev2.equals("advancers")) {%> class="on"<% } %>>Advancers</a></li>
                        <li><a href=""<% if (tabLev2.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                        --%>
                        
                    <% } else if (tabLev1.equals(EventType.STUDIO_TOURNAMENT_ID.toString())) { %>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=studio&d4=description"<% if (tabLev2.equals("description")) {%> class="on"<% } %>>Description</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=studio&d4=schedule"<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a></li>
                        <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=studio&d4=rules"<% if (tabLev2.equals("rules")) {%> class="on"<% } %>>Rules</a></li>
                        <li><a href="/tco08?module=ViewRegistration&et=7"<% if (tabLev2.equals("register")) {%> class="on"<% } %>>Register</a></li>
                        <li><a href="/tco08?module=Registrants&et=7"<% if (tabLev2.equals("registrants")) {%> class="on"<% } %>>Registrants</a></li>
                        <%--
                        <li><a href="/tc?module=tco08StudioLeaderboard&eid=3004"<% if (tabLev2.equals("advancers")) {%> class="on"<% } %>>Advancers</a></li>
                        <li><a href=""<% if (tabLev2.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                        --%>
                    <% } %>
                </ul>
                
                <%--------------- TERTIARY NAVIGATION ---------------%>
                <ul id="menunav3">
                    <% if (tabLev1.equals("overview")) {%>
                        <% if (tabLev2.equals("joinus")) {%>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=onsiteSchedule"<% if (tabLev3.equals("onsiteschedule")) {%> class="on"<% } %>>Onsite Schedule</a></li>
                            <%--
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=devForums"<% if (tabLev3.equals("devforums")) {%> class="on"<% } %>>Developer Forums</a></li>
                            --%>
                            <li><a target="_blank" href="/wiki/display/tc/Getting+your+Visa+and+Getting+it+Early"<% if (tabLev3.equals("getvisa")) {%> class="on"<% } %>>Getting a Visa</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=transportation"<% if (tabLev3.equals("transportation")) {%> class="on"<% } %>>Transportation</a></li>
                            <%--
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=hotels"<% if (tabLev3.equals("hotels")) {%> class="on"<% } %>>Hotels</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=whatToDo"<% if (tabLev3.equals("whattodo")) {%> class="on"<% } %>>Walt Disney World</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=blog&d4=description"<% if (tabLev3.equals("blog")) {%> class="on"<% } %>>Blog contest</a></li>
                            --%>
                        
                        <% } else if (tabLev2.equals("onsiteevents")) { %>
                            <%--
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=movies"<% if (tabLev3.equals("movies")) {%> class="on"<% } %>>Movies</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=photos"<% if (tabLev3.equals("photos")) {%> class="on"<% } %>>Photos</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=blogs&d4=overview"<% if (tabLev3.equals("blogs")) {%> class="on"<% } %>>Blogs</a></li>
                            --%>
                        
                        <% } else if (tabLev2.equals("sponsors")) { %>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=sponsorpatrons&d4=lilly"<% if (tabLev3.equals("lilly")) {%> class="on"<% } %>>Lilly</a></li>
                            <%--
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=sponsorpatrons&d4=db"<% if (tabLev3.equals("db")) {%> class="on"<% } %>>Deutsche Bank</a></li>
                            --%>
                            
                        <% } else if (tabLev2.equals("eventpatrons")) { %>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=sponsorpatrons&d4=nsa"<% if (tabLev3.equals("nsa")) {%> class="on"<% } %>>NSA</a></li>
                    <% } %>
                    
                    <% } else if (tabLev1.equals(EventType.ALGORITHM_TOURNAMENT_ID.toString())) { %>
                        <% if (tabLev2.equals("advancers")) {%>
                            <li><a href="/tc?module=tco08AlgorithmQualification"<% if (tabLev3.equals("qualification")) {%> class="on"<% } %>>Qualification</a></li>
                            <li><a href="/tc?module=tco08AlgorithmSections&rd=10898"<% if (tabLev3.equals("sections")) {%> class="on"<% } %>>Sections</a></li>
                            <li><a href="/tc?module=tco08AlgorithmAdvancers"<% if (tabLev3.equals("overview")) {%> class="on"<% } %>>Overview</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=bracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a></li>
                        
                        <% } else if (tabLev2.equals("summary")) { %>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=algoSemi01"<% if (tabLev3.equals("room1")) {%> class="on"<% } %>>Room 1</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=algoSemi02"<% if (tabLev3.equals("room2")) {%> class="on"<% } %>>Room 2</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=algoSemi03"<% if (tabLev3.equals("room3")) {%> class="on"<% } %>>Room 3</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=algoWildcard"<% if (tabLev3.equals("wildcard")) {%> class="on"<% } %>>Wildcard</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=algorithm&d4=algoFinals"<% if (tabLev3.equals("finals")) {%> class="on"<% } %>>Finals</a></li>
                    <% } %>
                    
                    <% } else if (tabLev1.equals(EventType.COMPONENT_TOURNAMENT_ID.toString())) { %>
                        <% if (tabLev2.equals("design")) {%>
                            <li><a href="/tc?module=tco08ContestDetails&ct=420&eid=3002"<% if (tabLev3.equals("results")) {%> class="on"<% } %>>Results</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=desBracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=desSummary"<% if (tabLev3.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                        
                        <% } else if (tabLev2.equals("development")) { %>
                            <li><a href="/tc?module=tco08ContestDetails&ct=421&eid=3002"<% if (tabLev3.equals("results")) {%> class="on"<% } %>>Results</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=devBracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=component&d4=devSummary"<% if (tabLev3.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                    <% } %>
                    
                    <% } else if (tabLev1.equals(EventType.MARATHON_TOURNAMENT_ID.toString())) { %>
                        <% if (tabLev2.equals("advancers")) {%>
                            <li><a href="/tc?module=tco08MarathonAdvancers"<% if (tabLev3.equals("overview")) {%> class="on"<% } %>>Overview</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=marathon&d4=bracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=marathon&d4=summary"<% if (tabLev3.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                        <% } %>
                    
                    <% } else if (tabLev1.equals(EventType.STUDIO_TOURNAMENT_ID.toString())) { %>
                        <% if (tabLev2.equals("advancers")) {%>
                            <li><a href="/tc?module=tco08StudioLeaderboard&eid=3004"<% if (tabLev3.equals("leaderboard")) {%> class="on"<% } %>>Leaderboard</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=studio&d4=bracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a></li>
                            <li><a href="/tc?module=Static&d1=tournaments&d2=tco08&d3=studio&d4=summary"<% if (tabLev3.equals("summary")) {%> class="on"<% } %>>Summary</a></li>
                        <% } %>
                    <% } %>
                </ul>
            </div>
            <div class="clearleft"></div>
        </div><%-- #menuwrap --%>