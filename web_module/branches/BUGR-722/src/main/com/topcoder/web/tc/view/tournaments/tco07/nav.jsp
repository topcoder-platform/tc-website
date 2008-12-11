<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<script language="javascript" type="text/javascript">
    <!--
    function toggleMenu(menuTitle, menuID) {
        if (menuTitle.className == 'closed') menuTitle.className = 'open';
        else menuTitle.className = 'closed';
        return;
    }
    // -->
</script>

<div id="nav">
    <ul>
        <%--------------TOURNAMENT OVERVIEW---------------%>
        <li class="<% if (tabLev1.equals("overview")) {%>open<% } else { %>closed<% } %>">
            <a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();">
                <span>Tournament Overview</span>
            </a>
            <ul>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=about"<% if (tabLev1.equals("overview") && tabLev2.equals("details")) {%> class="navHighlight"<% } %>>
                        <span>Details</span>
                    </a></li>
                <li class="<% if (tabLev1.equals("overview") && tabLev2.equals("joinus")) {%>open<% } else { %>closed<% } %>">
                    <a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();">
                        <span>Join Us Onsite</span>
                    </a>
                    <ul>
                        <li class="stop">
                            <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=onsiteSchedule"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("onsiteschedule")) {%> class="navHighlight"<% } %>>
                                <span>Schedule</span>
                            </a></li>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=devForums"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("devforums")) {%> class="navHighlight"<% } %>><span>Developer Forums</span></a></li>
                        <li class="stop">
                            <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=getVisa"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("getvisa")) {%> class="navHighlight"<% } %>>
                                <span>Getting a Visa</span>
                            </a></li>
                        <li class="stop">
                            <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=transportation"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("transportation")) {%> class="navHighlight"<% } %>>
                                <span>Transportation</span>
                            </a></li>
                        <li class="stop">
                            <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=hotels"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("hotels")) {%> class="navHighlight"<% } %>>
                                <span>Hotels</span>
                            </a></li>
                        <li class="stop">
                            <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=whatToDo"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("whattodo")) {%> class="navHighlight"<% } %>>
                                <span>What To Do</span>
                            </a></li>
                    </ul>
                </li>
                <li class="<% if (tabLev1.equals("overview") && tabLev2.equals("onsiteevents")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><span>Onsite Events</span></a>
                    <ul>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=movies"<% if (tabLev1.equals("overview") && tabLev2.equals("onsiteevents") && tabLev3.equals("movies")) {%> class="navHighlight"<% } %>><span>Movies</span></a></li>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=photos"<% if (tabLev1.equals("overview") && tabLev2.equals("onsiteevents") && tabLev3.equals("photos")) {%> class="navHighlight"<% } %>><span>Photos</span></a></li>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=blogs&amp;d4=overview"<% if (tabLev1.equals("overview") && tabLev2.equals("onsiteevents") && tabLev3.equals("blogs")) {%> class="navHighlight"<% } %>><span>Blogs</span></a></li>
                    </ul>
                </li>
                <li class="<% if (tabLev1.equals("overview") && tabLev2.equals("sponsors")) {%>open<% } else { %>closed<% } %>">
                    <a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();">
                        <span>Sponsors</span>
                    </a>
                    <ul>
                        <li class="stop">
                            <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aol"<% if (tabLev1.equals("overview") && tabLev2.equals("sponsors") && tabLev3.equals("aol")) {%> class="navHighlight"<% } %>>
                                <span>AOL</span>
                            </a></li>
                        <li class="stop">
                            <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=drw"<% if (tabLev1.equals("overview") && tabLev2.equals("sponsors") && tabLev3.equals("drw")) {%> class="navHighlight"<% } %>>
                                <span>DRW</span>
                            </a></li>
                        <li class="stop">
                            <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=ubs"<% if (tabLev1.equals("overview") && tabLev2.equals("sponsors") && tabLev3.equals("ubs")) {%> class="navHighlight"<% } %>>
                                <span>UBS</span>
                            </a></li>
                        <li class="stop">
                            <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=verisign"<% if (tabLev1.equals("overview") && tabLev2.equals("sponsors") && tabLev3.equals("verisign")) {%> class="navHighlight"<% } %>>
                                <span>VeriSign</span>
                            </a></li>
                    </ul>
                </li>
                <li class="<% if (tabLev1.equals("overview") && tabLev2.equals("eventpatrons")) {%>open<% } else { %>closed<% } %>">
                    <a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();">
                        <span>Event Patrons</span>
                    </a>
                    <ul>
                        <li class="stop">
                            <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=nsa"<% if (tabLev1.equals("overview") && tabLev2.equals("eventpatrons") && tabLev3.equals("nsa")) {%> class="navHighlight"<% } %>>
                                <span>NSA</span>
                            </a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <%--------------ALGORITHM---------------%>
        <li class="<% if (tabLev1.equals("algorithm")) {%>open<% } else { %>closed<% } %>">
            <a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();">
                <span>Algorithm</span>
            </a>
            <ul>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=description"<% if (tabLev1.equals("algorithm") && tabLev2.equals("description")) {%> class="navHighlight"<% } %>>
                        <span>Description</span>
                    </a></li>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=schedule"<% if (tabLev1.equals("algorithm") && tabLev2.equals("schedule")) {%> class="navHighlight"<% } %>>
                        <span>Schedule</span>
                    </a></li>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=rules"<% if (tabLev1.equals("algorithm") && tabLev2.equals("rules")) {%> class="navHighlight"<% } %>>
                        <span>Rules</span>
                    </a></li>
                <%--
                <li class="stop">
                    <a href="/tc?module=TCO07ViewRegistration&amp;ct=algorithm"<% if (tabLev1.equals("algorithm") && tabLev2.equals("register")) {%> class="navHighlight"<% } %>>
                        <span>Register</span>
                    </a></li>
                --%>
                <li class="stop">
                    <a href="/tc?module=TCO07ViewRegistrants&amp;ct=algorithm"<% if (tabLev1.equals("algorithm") && tabLev2.equals("registrants")) {%> class="navHighlight"<% } %>>
                        <span>Registrants</span>
                    </a></li>
                <li class="<% if (tabLev1.equals("algorithm") && tabLev2.equals("advancers")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><span>Advancers</span></a>
                    <ul>
                        <li class="stop"><a href="/tc?module=SimpleStats&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&&amp;d4=qualification&amp;c=tco07_alg_qual&trans=true"<% if (tabLev1.equals("algorithm") && tabLev2.equals("advancers") && tabLev3.equals("qualification")) {%> class="navHighlight"<% } %>><span>Qualification</span></a></li>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=sectionA"<% if (tabLev1.equals("algorithm") && tabLev2.equals("advancers") && tabLev3.equals("sections")) {%> class="navHighlight"<% } %>><span>Sections</span></a></li>
                        <li class="stop"><a href="/tc?module=SimpleStats&amp;c=tco07_alg_adv_overview&trans=true&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=advancers"<% if (tabLev1.equals("algorithm") && tabLev2.equals("advancers") && tabLev3.equals("overview")) {%> class="navHighlight"<% } %>><span>Overview</span></a></li>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=bracket"<% if (tabLev1.equals("algorithm") && tabLev2.equals("advancers") && tabLev3.equals("bracket")) {%> class="navHighlight"<% } %>><span>Bracket</span></a></li>
                    </ul>
                </li>
                <li class="<% if (tabLev1.equals("algorithm") && tabLev2.equals("summary")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><span>Summary</span></a>
                    <ul>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=algoSemi01"<% if (tabLev1.equals("algorithm") && tabLev2.equals("summary") && tabLev3.equals("room1")) {%> class="navHighlight"<% } %>><span>Room 1</span></a></li>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=algoSemi02"<% if (tabLev1.equals("algorithm") && tabLev2.equals("summary") && tabLev3.equals("room2")) {%> class="navHighlight"<% } %>><span>Room 2</span></a></li>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=algoSemi03"<% if (tabLev1.equals("algorithm") && tabLev2.equals("summary") && tabLev3.equals("room3")) {%> class="navHighlight"<% } %>><span>Room 3</span></a></li>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=algoWildcard"<% if (tabLev1.equals("algorithm") && tabLev2.equals("summary") && tabLev3.equals("wildcard")) {%> class="navHighlight"<% } %>><span>WildCard</span></a></li>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=algorithm&amp;d4=algoFinals"<% if (tabLev1.equals("algorithm") && tabLev2.equals("summary") && tabLev3.equals("finals")) {%> class="navHighlight"<% } %>><span>Finals</span></a></li>
                    </ul>
                </li>
            </ul>
        </li>

        <%--------------COMPONENT---------------%>
        <li class="<% if (tabLev1.equals("component")) {%>open<% } else { %>closed<% } %>">
            <a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();">
                <span>Component</span>
            </a>
            <ul>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=description"<% if (tabLev1.equals("component") && tabLev2.equals("description")) {%> class="navHighlight"<% } %>>
                        <span>Description</span>
                    </a></li>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=schedule"<% if (tabLev1.equals("component") && tabLev2.equals("schedule")) {%> class="navHighlight"<% } %>>
                        <span>Schedule</span>
                    </a></li>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=rules"<% if (tabLev1.equals("component") && tabLev2.equals("rules")) {%> class="navHighlight"<% } %>>
                        <span>Rules</span>
                    </a></li>
                <%--
                <li class="stop">
                    <a href="/tc?module=TCO07ViewRegistration&amp;ct=component"<% if (tabLev1.equals("component") && tabLev2.equals("register")) {%> class="navHighlight"<% } %>>
                        <span>Register</span>
                    </a></li>
                --%>
                <li class="stop">
                    <a href="/tc?module=TCO07ViewRegistrants&amp;ct=component"<% if (tabLev1.equals("component") && tabLev2.equals("registrants")) {%> class="navHighlight"<% } %>>
                        <span>Registrants</span>
                    </a></li>
        
                <li class="<% if (tabLev1.equals("component") && tabLev2.equals("design")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><span>Design</span></a>
                    <ul>
                        <li class="stop"><a href="/tc?module=TCO07ContestDetails&amp;ct=286"<% if (tabLev1.equals("component") && tabLev2.equals("design") && tabLev3.equals("results")) {%> class="navHighlight"<% } %>><span>Results</span></a></li>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=desBracket"<% if (tabLev1.equals("component") && tabLev2.equals("design") && tabLev3.equals("bracket")) {%> class="navHighlight"<% } %>><span>Bracket</span></a></li>
                <%--
                        <li class="stop"><a href=""><span>Finals</span></a></li>
                --%>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=desSummary"<% if (tabLev1.equals("component") && tabLev2.equals("design") && tabLev3.equals("summary")) {%> class="navHighlight"<% } %>><span>Summary</span></a></li>
                    </ul>
                </li>
                <li class="<% if (tabLev1.equals("component") && tabLev2.equals("development")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><span>Development</span></a>
                    <ul>
                        <li class="stop"><a href="/tc?module=TCO07ContestDetails&amp;ct=287"<% if (tabLev1.equals("component") && tabLev2.equals("development") && tabLev3.equals("results")) {%> class="navHighlight"<% } %>><span>Results</span></a></li>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=devBracket"<% if (tabLev1.equals("component") && tabLev2.equals("development") && tabLev3.equals("bracket")) {%> class="navHighlight"<% } %>><span>Bracket</span></a></li>
                <%--
                        <li class="stop"><a href=""><span>Finals</span></a></li>
                --%>
                        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=component&amp;d4=devSummary"<% if (tabLev1.equals("component") && tabLev2.equals("development") && tabLev3.equals("summary")) {%> class="navHighlight"<% } %>><span>Summary</span></a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <%--------------MARATHON---------------%>
        <li class="<% if (tabLev1.equals("marathon")) {%>open<% } else { %>closed<% } %>">
            <a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();">
                <span>Marathon Match</span>
            </a>
            <ul>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=marathon&amp;d4=description"<% if (tabLev1.equals("marathon") && tabLev2.equals("description")) {%> class="navHighlight"<% } %>>
                        <span>Description</span>
                    </a></li>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=marathon&amp;d4=schedule"<% if (tabLev1.equals("marathon") && tabLev2.equals("schedule")) {%> class="navHighlight"<% } %>>
                        <span>Schedule</span>
                    </a></li>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=marathon&amp;d4=rules"<% if (tabLev1.equals("marathon") && tabLev2.equals("rules")) {%> class="navHighlight"<% } %>>
                        <span>Rules</span>
                    </a></li>
                <li class="<% if (tabLev1.equals("marathon") && tabLev2.equals("advancers")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><span>Advancers</span></a>
                    <ul>
                    <li class="stop"><a href="/tc?module=SimpleStats&amp;c=tco07_mm_adv_overview&amp;trans=true&amp;d1=tournaments&amp;d2=tco07&amp;d3=marathon&amp;d4=advOverview"<% if (tabLev1.equals("marathon") && tabLev2.equals("advancers") && tabLev3.equals("overview")) {%> class="navHighlight"<% } %>><span>Overview</span></a></li>
                    <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=marathon&amp;d4=bracket"<% if (tabLev1.equals("marathon") && tabLev2.equals("advancers") && tabLev3.equals("bracket")) {%> class="navHighlight"<% } %>><span>Bracket</span></a></li>
                    </ul>
                </li>
                <%--
                <li class="stop"><a href="/tc?module=TCO07ViewRegistration&amp;ct=marathon"<% if (tabLev1.equals("marathon") && tabLev2.equals("register")) {%> class="navHighlight"<% } %>><span>Register</span></a></li>
                --%>
                <li class="stop">
                    <a href="/tc?module=TCO07ViewRegistrants&amp;ct=marathon"<% if (tabLev1.equals("marathon") && tabLev2.equals("registrants")) {%> class="navHighlight"<% } %>>
                        <span>Registrants</span>
                    </a></li>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=marathon&amp;d4=summary"<% if (tabLev1.equals("marathon") && tabLev2.equals("summary")) {%> class="navHighlight"<% } %>>
                        <span>Summary</span>
                    </a></li>
            </ul>
        </li>
        <%--------------STUDIO---------------%>
        <li class="<% if (tabLev1.equals("studio")) {%>open<% } else { %>closed<% } %>">
            <a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();">
                <span>Studio</span>
            </a>
            <ul>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=studio&amp;d4=description"<% if (tabLev1.equals("studio") && tabLev2.equals("description")) {%> class="navHighlight"<% } %>>
                        <span>Description</span>
                    </a></li>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=studio&amp;d4=schedule"<% if (tabLev1.equals("studio") && tabLev2.equals("schedule")) {%> class="navHighlight"<% } %>>
                        <span>Schedule</span>
                    </a></li>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=studio&amp;d4=rules"<% if (tabLev1.equals("studio") && tabLev2.equals("rules")) {%> class="navHighlight"<% } %>>
                        <span>Rules</span>
                    </a></li>
                <li class="<% if (tabLev1.equals("studio") && tabLev2.equals("advancers")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><span>Advancers</span></a>
                    <ul>
                    <li class="stop"><a href="/tc?module=StudioLeaderboard&amp;d1=tournaments&amp;d3=studio&amp;d4=leaderboard&eid=2040&amp;d2=tco07"<% if (tabLev1.equals("studio") && tabLev2.equals("advancers") && tabLev3.equals("leaderboard")) {%> class="navHighlight"<% } %>><span>Leaderboard</span></a></li>
                    <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=studio&amp;d4=bracket"<% if (tabLev1.equals("studio") && tabLev2.equals("advancers") && tabLev3.equals("bracket")) {%> class="navHighlight"<% } %>><span>Bracket</span></a></li>
                    </ul>
                </li>
<%--
                <li class="stop">
                    <a href="/tc?module=TCO07ViewRegistration&amp;ct=studio"<% if (tabLev1.equals("studio") && tabLev2.equals("register")) {%> class="navHighlight"<% } %>>
                        <span>Register</span>
                    </a></li>
--%>
                <li class="stop">
                    <a href="/tc?module=TCO07ViewRegistrants&amp;ct=studio"<% if (tabLev1.equals("studio") && tabLev2.equals("registrants")) {%> class="navHighlight"<% } %>>
                        <span>Registrants</span>
                    </a></li>
                <li class="stop">
                    <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=studio&amp;d4=summary"<% if (tabLev1.equals("studio") && tabLev2.equals("summary")) {%> class="navHighlight"<% } %>>
                        <span>Summary</span>
            </ul>
        </li>
    </ul>
</div>

<div id="navSponsors">

    <% if (tabLev3.equals("aol")) {%>
    <div>
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aol"><img src="/i/tournament/tco07/navsponsoraol.png" alt="AOL"/></a>
    </div>
    <% } else if (tabLev3.equals("nsa")) { %>
    <div>
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=nsa"><img src="/i/tournament/tco07/navsponsornsa.png" alt="NSA"/></a>
    </div>
    <% } else if (tabLev3.equals("ubs")) { %>
    <div>
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=ubs"><img src="/i/tournament/tco07/navsponsorubs.png" alt="UBS"/></a>
    </div>
    <% } else if (tabLev3.equals("drw")) { %>
    <div>
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=drw"><img src="/i/tournament/tco07/navsponsordrw.png" alt="DRW"/></a>
    </div>
    <% } else if (tabLev3.equals("verisign")) { %>
    <div>
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=verisign"><img src="/i/tournament/tco07/navsponsorverisign.png" alt="VeriSign"/></a>
    </div>
    <% } else { %>

    <div>
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=aol"><img src="/i/tournament/tco07/navsponsoraol.png" alt="AOL"/></a>
    </div>

    <div>
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=nsa"><img src="/i/tournament/tco07/navsponsornsa.png" alt="NSA"/></a>
    </div>

    <div>
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=ubs"><img src="/i/tournament/tco07/navsponsorubs.png" alt="UBS"/></a>
    </div>

    <div>
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=drw"><img src="/i/tournament/tco07/navsponsordrw.png" alt="DRW"/></a>
    </div>

    <div>
        <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsorspatrons&amp;d4=verisign"><img src="/i/tournament/tco07/navsponsorverisign.png" alt="VeriSign"/></a>
    </div>

    <% } %>
</div>