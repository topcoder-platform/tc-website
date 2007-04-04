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
<%--------------SPONSOR TRACK------------%>
    <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsortrack&amp;d4=description"<% if (tabLev1.equals("description")) {%> class="navHighlight"<% } %>><div>Description</div></a></li>
    <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsortrack&amp;d4=schedule"<% if (tabLev1.equals("schedule")) {%> class="navHighlight"<% } %>><div>Schedule</div></a></li>
    <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsortrack&amp;d4=rules"<% if (tabLev1.equals("rules")) {%> class="navHighlight"<% } %>><div>Rules</div></a></li>
    <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsortrack&amp;d4=instructions"<% if (tabLev1.equals("instructions")) {%> class="navHighlight"<% } %>><div>Instructions</div></a></li>
    <li class="stop"><a href="/tc?module=TCO07ViewSponsorRegistration&eid=9"<% if (tabLev1.equals("register")) {%> class="navHighlight"<% } %>><div>Register</div></a></li>
    <li class="stop"><a href="/tc?module=TCO07ViewSponsorRegistrants&eid=9"<% if (tabLev1.equals("registrants")) {%> class="navHighlight"<% } %>><div>Registrants</div></a></li>
    <li class="<% if (tabLev1.equals("advancers")) {%>open<% } else { %>closed<% } %>"><a href="javascript:void(0)" onClick="Javascript:toggleMenu(this.parentNode)" onfocus="this.blur();"><div>Advancers</div></a>
        <ul>
        <li class="stop"><a href="/tc?module=SimpleStats&c=tco07_spon_qual&d1=tournaments&d2=tco07&d3=sponsortrack&d4=qualification&trans=true"<% if (tabLev1.equals("advancers") && tabLev2.equals("qualification")) {%> class="navHighlight"<% } %>><div>Qualification</div></a></li>
<%--
        <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsortrack&amp;d4=advOverview"<% if (tabLev1.equals("advancers") && tabLev2.equals("overview")) {%> class="navHighlight"<% } %>><div>Overview</div></a></li>
--%>
        </ul>
    </li>
    <li class="stop"><a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco07&amp;d3=sponsortrack&amp;d4=arena"<% if (tabLev1.equals("arena")) {%> class="navHighlight"<% } %>><div>Competition Arena</div></a></li>
    </ul>
</div>
