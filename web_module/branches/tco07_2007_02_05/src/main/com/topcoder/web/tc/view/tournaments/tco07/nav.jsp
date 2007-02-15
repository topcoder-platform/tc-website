<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<script language="javascript" type="text/javascript">
<!--
function toggleMenu(menuTitle,menuID){
   if(menuTitle.className == 'closed') menuTitle.className = 'open';
   else menuTitle.className = 'closed';
   return;
}
// -->
</script>

<div id="nav">
    <ul>
<%--------------TOURNAMENT OVERVIEW---------------%>
    <li class="<% if (tabLev1.equals("overview")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Tournament Overview</div></a>
        <ul>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about"<% if (tabLev1.equals("overview") && tabLev2.equals("details")) {%> class="navHighlight"<% } %>><div>Details</div></a></li>
        <li class="<% if (tabLev1.equals("overview") && tabLev2.equals("joinus")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Join Us Onsite</div></a>
            <ul>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=onsiteSchedule"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("onsiteschedule")) {%> class="navHighlight"<% } %>><div>Schedule</div></a></li>
            <%--
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=devForums"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("devforums")) {%> class="navHighlight"<% } %>><div>Developer Forums</div></a></li>
            --%>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=getVisa"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("getvisa")) {%> class="navHighlight"<% } %>><div>Getting a Visa</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=transportation"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("transportation")) {%> class="navHighlight"<% } %>><div>Transportation</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=hotels"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("hotels")) {%> class="navHighlight"<% } %>><div>Hotels</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=whatToDo"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("whattodo")) {%> class="navHighlight"<% } %>><div>What To Do</div></a></li>
            </ul>
        </li>
<%--
        <li class="<% if (tabLev1.equals("overview") && tabLev2.equals("onsiteevents")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Onsite Events</div></a>
            <ul>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=photos"<% if (tabLev1.equals("overview") && tabLev2.equals("onsiteevents") && tabLev3.equals("photos")) {%> class="navHighlight"<% } %>><div>Photos</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=movies"<% if (tabLev1.equals("overview") && tabLev2.equals("onsiteevents") && tabLev3.equals("movies")) {%> class="navHighlight"<% } %>><div>Movies</div></a></li>
            </ul>
        </li>
--%>        <li class="<% if (tabLev1.equals("overview") && tabLev2.equals("sponsors")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Sponsors</div></a>
            <ul>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=aol"<% if (tabLev1.equals("overview") && tabLev2.equals("sponsors") && tabLev3.equals("aol")) {%> class="navHighlight"<% } %>><div>AOL</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw"<% if (tabLev1.equals("overview") && tabLev2.equals("sponsors") && tabLev3.equals("drw")) {%> class="navHighlight"<% } %>><div>DRW</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=ubs"<% if (tabLev1.equals("overview") && tabLev2.equals("sponsors") && tabLev3.equals("ubs")) {%> class="navHighlight"<% } %>><div>UBS</div></a></li>
            <%--
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=verisign"<% if (tabLev1.equals("overview") && tabLev2.equals("sponsors") && tabLev3.equals("verisign")) {%> class="navHighlight"<% } %>><div>VeriSign</div></a></li>
            --%>
            </ul>
        </li>
        <li class="<% if (tabLev1.equals("overview") && tabLev2.equals("eventpatrons")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Event Patrons</div></a>
            <ul>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=nsa"<% if (tabLev1.equals("overview") && tabLev2.equals("eventpatrons") && tabLev3.equals("nsa")) {%> class="navHighlight"<% } %>><div>NSA</div></a></li>
            </ul>
        </li>
        </ul>
    </li>
<%--------------ALGORITHM---------------%>
    <li class="<% if (tabLev1.equals("algorithm")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Algorithm</div></a>
        <ul>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=description"<% if (tabLev1.equals("algorithm") && tabLev2.equals("description")) {%> class="navHighlight"<% } %>><div>Description</div></a></li>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=schedule"<% if (tabLev1.equals("algorithm") && tabLev2.equals("schedule")) {%> class="navHighlight"<% } %>><div>Schedule</div></a></li>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=rules"<% if (tabLev1.equals("algorithm") && tabLev2.equals("rules")) {%> class="navHighlight"<% } %>><div>Rules</div></a></li>
        <li class="stop"><a href="/tc?module=TCO07ViewRegistration&ct=algorithm"<% if (tabLev1.equals("algorithm") && tabLev2.equals("register")) {%> class="navHighlight"<% } %>><div>Register</div></a></li>
        <li class="stop"><a href="/tc?module=TCO07ViewRegistrants&ct=algorithm"<% if (tabLev1.equals("algorithm") && tabLev2.equals("registrants")) {%> class="navHighlight"<% } %>><div>Registrants</div></a></li>
<%--
        <li class="<% if (tabLev1.equals("algorithm") && tabLev2.equals("advancers")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Advancers</div></a>
            <ul>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=qualification"><div>Qualification</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=sectionA"><div>Sections</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=advancersOverview"><div>Overview</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=bracket"><div>Bracket</div></a></li>
            </ul>
        </li>
        <li class="<% if (tabLev1.equals("algorithm") && tabLev2.equals("summary")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Summary</div></a>
            <ul>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=room1"><div>Room 1</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=room2"><div>Room 2</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=room3"><div>Room 3</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=wildcard"><div>WildCard</div></a></li>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=algorithm&d4=finals"><div>Finals</div></a></li>
            </ul>
--%>
        </li>
        </ul>
    </li>
<%--------------COMPONENT---------------%>
    <li class="<% if (tabLev1.equals("component")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Component</div></a>
        <ul>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=description"<% if (tabLev1.equals("component") && tabLev2.equals("description")) {%> class="navHighlight"<% } %>><div>Description</div></a></li>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=schedule"<% if (tabLev1.equals("component") && tabLev2.equals("schedule")) {%> class="navHighlight"<% } %>><div>Schedule</div></a></li>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=component&d4=rules"<% if (tabLev1.equals("component") && tabLev2.equals("rules")) {%> class="navHighlight"<% } %>><div>Rules</div></a></li>
        <li class="stop"><a href="/tc?module=TCO07ViewRegistration&ct=component"<% if (tabLev1.equals("component") && tabLev2.equals("register")) {%> class="navHighlight"<% } %>><div>Register</div></a></li>
        <li class="stop"><a href="/tc?module=TCO07ViewRegistrants&ct=component"<% if (tabLev1.equals("component") && tabLev2.equals("registrants")) {%> class="navHighlight"<% } %>><div>Registrants</div></a></li>

<%--
        <li class="<% if (tabLev1.equals("component") && tabLev2.equals("design")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Design</div></a>
            <ul>
            <li class="stop"><a href=""><div>Results</div></a></li>
            <li class="stop"><a href=""><div>Finals</div></a></li>
            <li class="stop"><a href=""><div>Summary</div></a></li>
            <li class="stop"><a href=""><div>Bracket</div></a></li>
            </ul>
        </li>
        <li class="<% if (tabLev1.equals("component") && tabLev2.equals("development")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Development</div></a>
            <ul>
            <li class="stop"><a href=""><div>Results</div></a></li>
            <li class="stop"><a href=""><div>Finals</div></a></li>
            <li class="stop"><a href=""><div>Summary</div></a></li>
            <li class="stop"><a href=""><div>Bracket</div></a></li>
            </ul>
        </li>
--%>
        </ul>
    </li>
<%--------------MARATHON---------------%>
    <li class="<% if (tabLev1.equals("marathon")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Marathon Matches</div></a>
        <ul>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=description"<% if (tabLev1.equals("marathon") && tabLev2.equals("description")) {%> class="navHighlight"<% } %>><div>Description</div></a></li>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=schedule"<% if (tabLev1.equals("marathon") && tabLev2.equals("schedule")) {%> class="navHighlight"<% } %>><div>Schedule</div></a></li>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=marathon&d4=rules"<% if (tabLev1.equals("marathon") && tabLev2.equals("rules")) {%> class="navHighlight"<% } %>><div>Rules</div></a></li>
        <li class="stop"><a href="/tc?module=TCO07ViewRegistration&ct=marathon"<% if (tabLev1.equals("marathon") && tabLev2.equals("register")) {%> class="navHighlight"<% } %>><div>Register</div></a></li>
        <li class="stop"><a href="/tc?module=TCO07ViewRegistrants&ct=marathon"<% if (tabLev1.equals("marathon") && tabLev2.equals("registrants")) {%> class="navHighlight"<% } %>><div>Registrants</div></a></li>
        </ul>
    </li>
<%--------------STUDIO---------------%>
    <li class="<% if (tabLev1.equals("studio")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Studio</div></a>
        <ul>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=studio&d4=description"<% if (tabLev1.equals("studio") && tabLev2.equals("description")) {%> class="navHighlight"<% } %>><div>Description</div></a></li>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=studio&d4=schedule"<% if (tabLev1.equals("studio") && tabLev2.equals("schedule")) {%> class="navHighlight"<% } %>><div>Schedule</div></a></li>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=studio&d4=rules"<% if (tabLev1.equals("studio") && tabLev2.equals("rules")) {%> class="navHighlight"<% } %>><div>Rules</div></a></li>
        <li class="stop"><a href="/tc?module=TCO07ViewRegistration&ct=studio"<% if (tabLev1.equals("studio") && tabLev2.equals("register")) {%> class="navHighlight"<% } %>><div>Register</div></a></li>
        <li class="stop"><a href="/tc?module=TCO07ViewRegistrants&ct=studio"<% if (tabLev1.equals("studio") && tabLev2.equals("registrants")) {%> class="navHighlight"<% } %>><div>Registrants</div></a></li>
        </ul>
    </li>
    </ul>
</div>

<div id="navSponsors">

    <div>
    <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=aol"><img src="/i/tournament/tco07/navsponsoraol.png" alt="AOL" /></A>
    </div>
    <div>
    <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=nsa"><img src="/i/tournament/tco07/navsponsornsa.png" alt="NSA" /></A>
    </div>
    <div>
    <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=ubs"><img src="/i/tournament/tco07/navsponsorubs.png" alt="UBS" /></A>
    </div>
    <div>
    <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw"><img src="/i/tournament/tco07/navsponsordrw.png" alt="DRW" /></A>
    </div>
    <%--
    <div>
    <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=verisign"><img src="/i/tournament/tco07/navsponsorverisign.png" alt="VeriSign" /></A>
    </div>
    --%>

</div>