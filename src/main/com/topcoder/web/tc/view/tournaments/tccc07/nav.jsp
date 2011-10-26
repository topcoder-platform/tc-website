<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.topcoder.web.common.model.EventType" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<div>
    <div>
        <div style="margin: 0px 15px 0px 50px; padding: 30px 0px 0px 0px;">
            <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=about"><img src="/i/tournament/tccc07/tourneyLogo.png" alt="2007 TopCoder Collegiate Challenge" /></a>
        </div>
        <div id="tclogo">
            <a href="/"><img src="/i/tournament/tccc07/topcoderlogo.png" alt="TopCoder&#174;" /></a>
        </div>
        <%--
        <a style="position: absolute; top: 60px; left: 460px;" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=registerNow"><img src="/i/tournament/tccc07/registerNow.png" alt="REGISTER NOW!" /></a>
        --%>
        <div style="position: absolute; top: 45px; left: 365px;">
            <map name="tccc07headerLinks">
            <area shape="rect" alt="" coords="1,75,107,150" target="_blank" href="/pdfs/tournaments/TCCC07_Program_View.pdf" />
            <area shape="rect" alt="" coords="125,75,208,106" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=movies" />
            <area shape="rect" alt="" coords="225,75,305,106" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=photos" />
            <area shape="rect" alt="" coords="323,75,400,106" target="_blank" href="http://www.topcoder.com/wiki/pages/viewrecentblogposts.action?key=tccc07" />
            </map>
            <img src="/i/tournament/tccc07/headerLinks.png" alt="TCCC07 Header Links" usemap="#tccc07headerLinks" style="display: block;" />
        </div>
    </div>
    
    <div style="margin-top:0px;">

<%--------------PRIMARY NAV---------------%>
        <div align="center">
            <div id="navButtons">

                <div style="float:left;">
                <% if (tabLev1.equals("overview")) {%>
                    <a onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=about"><img src="/i/tournament/tccc07/tournie_on.png" alt="Tournament Overview" /></a>
                <% } else { %>
                    <a onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=about"><img src="/i/tournament/tccc07/tournie.png" alt="Tournament Overview" /></a>
                <% } %>
                </div>

                <div style="float:left;">
                <% if (tabLev1.equals(EventType.ALGORITHM_TOURNAMENT_ID.toString())) {%>
                    <a onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=description"><img src="/i/tournament/tccc07/alg_on.png" alt="Algorithm Competition" /></a>
                <% } else { %>
                    <a onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=description"><img src="/i/tournament/tccc07/alg.png" alt="Algorithm Competition" /></a>
                <% } %>
                </div>
            
                <div style="float:left;">
                <% if (tabLev1.equals(EventType.COMPONENT_TOURNAMENT_ID.toString())) {%>
                    <a onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=description"><img src="/i/tournament/tccc07/comp_on.png" alt="Component Competition" /></a>
                <% } else { %>
                    <a onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=description"><img src="/i/tournament/tccc07/comp.png" alt="Component Competition" /></a>
                <% } %>
                </div>
                
                <div style="float:left;">
                <% if (tabLev1.equals(EventType.MARATHON_TOURNAMENT_ID.toString())) {%>
                    <a onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=description"><img src="/i/tournament/tccc07/mara_on.png" alt="Marathon Competition" /></a>
                <% } else { %>
                    <a onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=description"><img src="/i/tournament/tccc07/mara.png" alt="Marathon Competition" /></a>
                <% } %>
                </div>
                
                <div style="float:left;">
                <% if (tabLev1.equals(EventType.STUDIO_TOURNAMENT_ID.toString())) {%>
                    <a onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=studio&d4=description"><img src="/i/tournament/tccc07/studio_on.png" alt="Studio Overview" /></a>
                <% } else { %>
                    <a onfocus="this.blur();" href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=studio&d4=description"><img src="/i/tournament/tccc07/studio.png" alt="Studio Overview" /></a>
                <% } %>
                </div>
        
            </div>
            
<%--------------SECONDARY NAV---------------%>
            <div id="navTextB">&nbsp;</div>
            <div id="navText">
            <% if (tabLev1.equals("overview")) {%>
                <p id="secondaryNav">
                    <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=about"<% if (tabLev2.equals("details")) {%> class="on"<% } %>>Details</a>
                    | <a target="_blank" href="/pdfs/tournaments/TCCC07_Program_View.pdf">Program [PDF]</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule"<% if (tabLev2.equals("joinus")) {%> class="on"<% } %>>Join us onsite</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=roundTable"<% if (tabLev2.equals("roundtable")) {%> class="on"<% } %>>Roundtable Discussion</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=movies"<% if (tabLev2.equals("onsiteevents")) {%> class="on"<% } %>>Onsite events</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=lilly"<% if (tabLev2.equals("sponsors")) {%> class="on"<% } %>>Sponsors</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=nsa"<% if (tabLev2.equals("eventpatrons")) {%> class="on"<% } %>>Event Patrons</a>
                </p>
            <% } else if (tabLev1.equals(EventType.ALGORITHM_TOURNAMENT_ID.toString())) { %>
                <p id="secondaryNav">
                    <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=description"<% if (tabLev2.equals("description")) {%> class="on"<% } %>>Description</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=schedule"<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=rules"<% if (tabLev2.equals("rules")) {%> class="on"<% } %>>Rules</a>
                <%--
                    | <a href="/tc?module=TCCC07ViewRegistration&et=<%=EventType.ALGORITHM_TOURNAMENT_ID%>"<% if (tabLev2.equals("register")) {%> class="on"<% } %>>Register</a>
                --%>
                    | <a href="/tc?module=TCCC07ViewRegistrants&et=<%=EventType.ALGORITHM_TOURNAMENT_ID%>"<% if (tabLev2.equals("registrants")) {%> class="on"<% } %>>Registrants</a>
                    | <a href="/tc?module=TCCC07AlgorithmAdvancers"<% if (tabLev2.equals("advancers")) {%> class="on"<% } %>>Advancers</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=algoSemi01"<% if (tabLev2.equals("summary")) {%> class="on"<% } %>>Summary</a>
                </p>
            <% } else if (tabLev1.equals(EventType.COMPONENT_TOURNAMENT_ID.toString())) { %>
                <p id="secondaryNav">
                    <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=description"<% if (tabLev2.equals("description")) {%> class="on"<% } %>>Description</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=schedule"<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=rules"<% if (tabLev2.equals("rules")) {%> class="on"<% } %>>Rules</a>
                    | <a href="/tc?module=TCCC07ViewRegistration&et=<%=EventType.COMPONENT_TOURNAMENT_ID%>"<% if (tabLev2.equals("register")) {%> class="on"<% } %>>Register</a>
                    | <a href="/tc?module=TCCC07ViewRegistrants&et=<%=EventType.COMPONENT_TOURNAMENT_ID%>"<% if (tabLev2.equals("registrants")) {%> class="on"<% } %>>Registrants</a>
                    | <a href="/tc?module=TCCC07ContestDetails&ct=420&eid=3002"<% if (tabLev2.equals("design")) {%> class="on"<% } %>>Design</a>
                    | <a href="/tc?module=TCCC07ContestDetails&ct=421&eid=3002"<% if (tabLev2.equals("development")) {%> class="on"<% } %>>Development</a>
                <%--
                --%>
                </p>
            <% } else if (tabLev1.equals(EventType.MARATHON_TOURNAMENT_ID.toString())) { %>
                <p id="secondaryNav">
                    <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=description"<% if (tabLev2.equals("description")) {%> class="on"<% } %>>Description</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=schedule"<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=rules"<% if (tabLev2.equals("rules")) {%> class="on"<% } %>>Rules</a>
                <%--
                    | <a href="/tc?module=TCCC07ViewRegistration&et=<%=EventType.MARATHON_TOURNAMENT_ID%>"<% if (tabLev2.equals("register")) {%> class="on"<% } %>>Register</a>
                --%>
                    | <a href="/tc?module=TCCC07ViewRegistrants&et=<%=EventType.MARATHON_TOURNAMENT_ID%>"<% if (tabLev2.equals("registrants")) {%> class="on"<% } %>>Registrants</a>
                    | <a href="/tc?module=TCCC07MarathonAdvancers"<% if (tabLev2.equals("advancers")) {%> class="on"<% } %>>Advancers</a>
                <%--
                    | <a href=""<% if (tabLev2.equals("summary")) {%> class="on"<% } %>>Summary</a>
                --%>
                </p>
            <% } else if (tabLev1.equals(EventType.STUDIO_TOURNAMENT_ID.toString())) { %>
                <p id="secondaryNav">
                    <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=studio&d4=description"<% if (tabLev2.equals("description")) {%> class="on"<% } %>>Description</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=studio&d4=schedule"<% if (tabLev2.equals("schedule")) {%> class="on"<% } %>>Schedule</a>
                    | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=studio&d4=rules"<% if (tabLev2.equals("rules")) {%> class="on"<% } %>>Rules</a>
                <%--
                    | <a href="/tc?module=TCCC07ViewRegistration&et=<%=EventType.STUDIO_TOURNAMENT_ID%>"<% if (tabLev2.equals("register")) {%> class="on"<% } %>>Register</a>
                --%>
                    | <a href="/tc?module=TCCC07ViewRegistrants&et=<%=EventType.STUDIO_TOURNAMENT_ID%>"<% if (tabLev2.equals("registrants")) {%> class="on"<% } %>>Registrants</a>
                    | <a href="/tc?module=TCCC07StudioLeaderboard&eid=3004"<% if (tabLev2.equals("advancers")) {%> class="on"<% } %>>Advancers</a>
                <%--
                    | <a href=""<% if (tabLev2.equals("summary")) {%> class="on"<% } %>>Summary</a>
                --%>
                </p>
            <% } %>

<%--------------TERTIARY NAV---------------%>
            <% if (tabLev1.equals("overview")) {%>
                <% if (tabLev2.equals("joinus")) {%>
                    <p id="tertiaryNav">
                        <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=onsiteSchedule"<% if (tabLev3.equals("onsiteschedule")) {%> class="on"<% } %>>Onsite schedule</a>
                        <%--
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=devForums"<% if (tabLev3.equals("devforums")) {%> class="on"<% } %>>Developer forums</a>
                        --%>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=getVisa"<% if (tabLev3.equals("getvisa")) {%> class="on"<% } %>>Getting a visa</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=transportation"<% if (tabLev3.equals("transportation")) {%> class="on"<% } %>>Transportation</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=hotels"<% if (tabLev3.equals("hotels")) {%> class="on"<% } %>>Hotels</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=whatToDo"<% if (tabLev3.equals("whattodo")) {%> class="on"<% } %>>Walt Disney World</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=professor&d4=description"<% if (tabLev3.equals("professor")) {%> class="on"<% } %>>Prestigious Professor Award</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=blog&d4=description"<% if (tabLev3.equals("blog")) {%> class="on"<% } %>>Blog contest</a>
                    </p>
                <% } else if (tabLev2.equals("onsiteevents")) { %>
                    <p id="tertiaryNav">
                        <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=movies"<% if (tabLev3.equals("movies")) {%> class="on"<% } %>>Movies</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=photos"<% if (tabLev3.equals("photos")) {%> class="on"<% } %>>Photos</a>
<%--
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=blogs&d4=overview"<% if (tabLev3.equals("blogs")) {%> class="on"<% } %>>Blogs</a>
--%>
                    </p>
                <% } else if (tabLev2.equals("sponsors")) { %>
                    <p id="tertiaryNav">
                        <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=lilly"<% if (tabLev3.equals("lilly")) {%> class="on"<% } %>>Lilly</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=db"<% if (tabLev3.equals("db")) {%> class="on"<% } %>>Deutsche Bank</a>
                    </p>
                <% } else if (tabLev2.equals("eventpatrons")) { %>
                    <p id="tertiaryNav">
                        <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=sponsorpatrons&d4=nsa"<% if (tabLev3.equals("nsa")) {%> class="on"<% } %>>NSA</a>
                    </p>
                <% } %>
            <% } else if (tabLev1.equals(EventType.ALGORITHM_TOURNAMENT_ID.toString())) { %>
                <% if (tabLev2.equals("advancers")) {%>
                    <p id="tertiaryNav">
                        <a href="/tc?module=TCCC07AlgorithmQualification"<% if (tabLev3.equals("qualification")) {%> class="on"<% } %>>Qualification</a>
                        | <a href="/tc?module=TCCC07AlgorithmSections&rd=10898"<% if (tabLev3.equals("sections")) {%> class="on"<% } %>>Sections</a>
                        | <a href="/tc?module=TCCC07AlgorithmAdvancers"<% if (tabLev3.equals("overview")) {%> class="on"<% } %>>Overview</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=bracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a>
                    </p>
                <% } else if (tabLev2.equals("summary")) { %>
                    <p id="tertiaryNav">
                        <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=algoSemi01"<% if (tabLev3.equals("room1")) {%> class="on"<% } %>>Room 1</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=algoSemi02"<% if (tabLev3.equals("room2")) {%> class="on"<% } %>>Room 2</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=algoSemi03"<% if (tabLev3.equals("room3")) {%> class="on"<% } %>>Room 3</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=algoWildcard"<% if (tabLev3.equals("wildcard")) {%> class="on"<% } %>>Wildcard</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=algorithm&d4=algoFinals"<% if (tabLev3.equals("finals")) {%> class="on"<% } %>>Finals</a>
                    </p>
                <% } %>
            <% } else if (tabLev1.equals(EventType.COMPONENT_TOURNAMENT_ID.toString())) { %>
                <% if (tabLev2.equals("design")) {%>
                    <p id="tertiaryNav">
                        <a href="/tc?module=TCCC07ContestDetails&ct=420&eid=3002"<% if (tabLev3.equals("results")) {%> class="on"<% } %>>Results</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=desBracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=desSummary"<% if (tabLev3.equals("summary")) {%> class="on"<% } %>>Summary</a>
                    </p>
                <% } else if (tabLev2.equals("development")) { %>
                    <p id="tertiaryNav">
                        <a href="/tc?module=TCCC07ContestDetails&ct=421&eid=3002"<% if (tabLev3.equals("results")) {%> class="on"<% } %>>Results</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=devBracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=component&d4=devSummary"<% if (tabLev3.equals("summary")) {%> class="on"<% } %>>Summary</a>
                    </p>
                <% } %>
            <% } else if (tabLev1.equals(EventType.MARATHON_TOURNAMENT_ID.toString())) { %>
                <% if (tabLev2.equals("advancers")) {%>
                    <p id="tertiaryNav">
                        <a href="/tc?module=TCCC07MarathonAdvancers"<% if (tabLev3.equals("overview")) {%> class="on"<% } %>>Overview</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=bracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=marathon&d4=summary"<% if (tabLev3.equals("summary")) {%> class="on"<% } %>>Summary</a>
                    </p>
                <% } %>
            <% } else if (tabLev1.equals(EventType.STUDIO_TOURNAMENT_ID.toString())) { %>
                <% if (tabLev2.equals("advancers")) {%>
                    <p id="tertiaryNav">
                        <a href="/tc?module=TCCC07StudioLeaderboard&eid=3004"<% if (tabLev3.equals("leaderboard")) {%> class="on"<% } %>>Leaderboard</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=studio&d4=bracket"<% if (tabLev3.equals("bracket")) {%> class="on"<% } %>>Bracket</a>
                        | <a href="/tc?module=Static&d1=tournaments&d2=tccc07&d3=studio&d4=summary"<% if (tabLev3.equals("summary")) {%> class="on"<% } %>>Summary</a>
                    </p>
                <% } %>
            <% } %>
            </div>
            <div id="navTextB">&nbsp;</div>
            
            <div>
                <img src="/i/tournament/tccc07/stylebar.png" alt="stylebar" />
            </div>
        </div>

    </div>
    
    <div align="center" style="position:absolute; top: 380px; right: 40px;">
        <span style="color:#696fe9;">Today is  </span><tc-webtag:format object="<%=new Date()%>" format="EEEE, MMMM d, yyyy" timeZone="<%=(String)request.getAttribute(Constants.TIMEZONE)%>"/>
        <div style="margin-top: 10px;">
            <jsp:include page="sponsors.jsp" />
        </div>
    </div>

</div>