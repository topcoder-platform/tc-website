<%
    String tabLev1 = request.getParameter("tabLev1") == null ? "" : request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2") == null ? "" : request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3") == null ? "" : request.getParameter("tabLev3");
%>

<div class="tourneyLogo">
<map name="tchslogo">
<area href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview" alt="TCHS07" shape="poly" coords="1,1,266,1,266,100,66,100,66,142,1,142" >
</map>
<img src="/i/tournament/tchs07/tchs07.png" alt="TCHS07" usemap="#tchslogo" />
</div>

<div class="topcoderLogo">
<A href="/"><img src="/i/tournament/tchs07/topcoder.png" alt="TopCoder" /></A>
</div>

<div id="leftnav">
<A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview"<% if (tabLev1.equals("overview")) {%> class="on"<% } %>>OVERVIEW</A>
<A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=schedule"<% if (tabLev1.equals("schedule")) {%> class="on"<% } %>>SCHEDULE</A>
<A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=rules"<% if (tabLev1.equals("rules")) {%> class="on"<% } %>>RULES</A>
<A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=sponsors"<% if (tabLev1.equals("sponsors")) {%> class="on"<% } %>>SPONSORS</A>
<A href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=purdue"<% if (tabLev1.equals("purdue")) {%> class="on"<% } %>>PURDUE</A>
</div>