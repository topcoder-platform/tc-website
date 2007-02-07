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
    <li class="<% if (tabLev1.equals("overview")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Tournament Overview</div></a>
        <ul>
        <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about"<% if (tabLev1.equals("overview") && tabLev2.equals("details")) {%> class="navHighlight"<% } %>><div>Details</div></a></li>
        <li class="<% if (tabLev1.equals("overview") && tabLev2.equals("joinus")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Join Us Onsite</div></a>
            <ul>
            <li class="stop"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=onsiteschedule"<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("onsiteschedule")) {%> class="navHighlight"<% } %>><div>Schedule</div></a></li>
            <li class="stop"><a href=""<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("devforums")) {%> class="navHighlight"<% } %>><div>Developer Forums</div></a></li>
            <li class="stop"><a href=""<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("blogthis")) {%> class="navHighlight"<% } %>><div>"Blog This" Contest</div></a></li>
            <li class="stop"><a href=""<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("transportation")) {%> class="navHighlight"<% } %>><div>Transportation</div></a></li>
            <li class="stop"><a href=""<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("hotels")) {%> class="navHighlight"<% } %>><div>Hotels</div></a></li>
            <li class="stop"><a href=""<% if (tabLev1.equals("overview") && tabLev2.equals("joinus") && tabLev3.equals("whattodo")) {%> class="navHighlight"<% } %>><div>What To Do</div></a></li>
            </ul>
        </li>
        <li class="<% if (tabLev1.equals("overview") && tabLev2.equals("onsiteevents")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Onsite Events</div></a>
            <ul>
            <li class="stop"><a href=""><div>Photos</div></a></li>
            <li class="stop"><a href=""><div>Movies</div></a></li>
            <li class="stop"><a href=""><div>Blogs</div></a></li>
            </ul>
        </li>
        <li class="<% if (tabLev1.equals("overview") && tabLev2.equals("sponsors")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Sponsors</div></a>
            <ul>
            <li class="stop"><a href=""><div>AOL</div></a></li>
            <li class="stop"><a href=""><div>Bloomberg</div></a></li>
            <li class="stop"><a href=""><div>UBS</div></a></li>
            </ul>
        </li>
        <li class="<% if (tabLev1.equals("overview") && tabLev2.equals("eventpatrons")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Event Patrons</div></a>
            <ul>
            <li class="stop"><a href=""><div>NSA</div></a></li>
            </ul>
        </li>
        </ul>
    </li>
    <li class="<% if (tabLev1.equals("algorithm")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Algorithm</div></a>
        <ul>
        <li class="<% if (tabLev1.equals("algorithm") && tabLev2.equals("details")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Details</div></a>
            <ul>
            <li class="stop"><a href=""><div>Description</div></a></li>
            <li class="stop"><a href=""><div>Schedule</div></a></li>
            <li class="stop"><a href=""><div>Rules</div></a></li>
            </ul>
        </li>
        <li class="stop"><a href=""<% if (tabLev1.equals("algorithm") && tabLev2.equals("registrants")) {%> class="navHighlight"<% } %>><div>Registrants</div></a></li>
        <li class="<% if (tabLev1.equals("algorithm") && tabLev2.equals("advancers")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Advancers</div></a>
            <ul>
            <li class="stop"><a href=""><div>Qualification</div></a></li>
            <li class="stop"><a href=""><div>Sections</div></a></li>
            <li class="stop"><a href=""><div>Overview</div></a></li>
            <li class="stop"><a href=""><div>Bracket</div></a></li>
            </ul>
        </li>
        <li class="<% if (tabLev1.equals("algorithm") && tabLev2.equals("summary")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Summary</div></a>
            <ul>
            <li class="stop"><a href=""><div>Room 1</div></a></li>
            <li class="stop"><a href=""><div>Room 2</div></a></li>
            <li class="stop"><a href=""><div>Room 3</div></a></li>
            <li class="stop"><a href=""><div>WildCard</div></a></li>
            <li class="stop"><a href=""><div>Finals</div></a></li>
            </ul>
        </li>
        </ul>
    </li>
    <li class="<% if (tabLev1.equals("component")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Component</div></a>
        <ul>
        <li class="<% if (tabLev1.equals("component") && tabLev2.equals("details")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Details</div></a>
            <ul>
            <li class="stop"><a href=""><div>Description</div></a></li>
            <li class="stop"><a href=""><div>Schedule</div></a></li>
            <li class="stop"><a href=""><div>Rules</div></a></li>
            </ul>
        </li>
        <li class="stop"><a href=""<% if (tabLev1.equals("overview") && tabLev2.equals("details")) {%> class="navHighlight"<% } %>><div>Registrants</div></a></li>
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
        </ul>
    </li>
    <li class="<% if (tabLev1.equals("marathon")) {%>open<% } else { %>closed<% } %>"><a href=""><div>Marathon Matches</div></a>
    </li>
    <li class="<% if (tabLev1.equals("studio")) {%>open<% } else { %>closed<% } %>"><a href=""><div>Studio</div></a>
    </li>
    </ul>
</div>

<div id="navSponsors">

    <div>
    <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=aol"><img src="/i/tournament/tco07/navsponsoraol.png" alt="AOL" /></A>
    </div>
    <div>
    <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=nsa"><img src="/i/tournament/tco07/navsponsornsa.png" alt="NSA" /></A>
    </div>
    <div>
    <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=ubs"><img src="/i/tournament/tco07/navsponsorubs.png" alt="UBS" /></A>
    </div>
    <div>
    <A href="/tc?module=Static&d1=tournaments&d2=tco07&d3=verisign"><img src="/i/tournament/tco07/navsponsorverisign.png" alt="VeriSign" /></A>
    </div>

</div>