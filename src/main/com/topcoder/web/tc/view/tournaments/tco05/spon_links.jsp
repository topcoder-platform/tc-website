<%
    String tabLev2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3")==null?"":request.getParameter("tabLev3");
%>

<table width="100%" border="0" cellpadding=0 cellspacing=0>
	<tr>
		<td width="50%"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_description"><img src="/i/tournament/tco05/tco05_logo.gif" border="0"/></A></td>
		<td valign=middle align=center rowspan="2"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_description"><img src="/i/tournament/tco05/sponsortrack_logo.gif" alt="Sponsor Track" border="0"/></a></td>
		<td valign=top align=right rowspan="2" width="50%"><a href="/"><img src="/i/tournament/tco05/tc_logo.gif" border="0"/></a></td>
	</tr>
	<tr><td><br></td></tr>
<!-- LEVEL 2 TABS -->
	<tr>
		<td colspan=3>
		<table border="0" cellspacing=0 cellpadding=0 width="100%">
    		<tr>
        		<td class="nav">&#160;&#160;&#160;</td>
        		<td class="nav" align=right><img src="/i/tournament/tco05/tabs/L2_sideDK.gif" border="0" /></td>
				<% if (tabLev2.equals("details")) {%>
					<td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_description"><img src="/i/tournament/tco05/tabs/L2_detailsOn.gif" alt="" border="0" /></A></td>
				<% } else { %>
					<td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_description"><img src="/i/tournament/tco05/tabs/L2_detailsOff.gif" alt="" border="0" /></A></td>
				<% } %>
<%--
				<% if (tabLev2.equals("registration")) {%>
					<td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_reg"><img src="/i/tournament/tco05/tabs/L2_registrationOn.gif" alt="" border="0" /></A></td>
				<% } else { %>
					<td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_reg"><img src="/i/tournament/tco05/tabs/L2_registrationOff.gif" alt="" border="0" /></A></td>
				<% } %>
				<% if (tabLev2.equals("registrants")) {%>
					<td class="nav"><A href="/tc?module=TCO05AlgRegistrants"><img src="/i/tournament/tco05/tabs/L2_registrantsOn.gif" alt="" border="0" /></A></td>
				<% } else { %>
					<td class="nav"><A href="/tc?module=TCO05AlgRegistrants"><img src="/i/tournament/tco05/tabs/L2_registrantsOff.gif" alt="" border="0" /></A></td>
				<% } %>
--%>
				<% if (tabLev2.equals("advancers")) {%>
					<td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_qualification"><img src="/i/tournament/tco05/tabs/L2_advancersOn.gif" alt="" border="0" /></A></td>
				<% } else { %>
					<td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_qualification"><img src="/i/tournament/tco05/tabs/L2_advancersOff.gif" alt="" border="0" /></A></td>
				<% } %>
<%--
				<% if (tabLev2.equals("summary")) {%>
					<td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_finals_analysis"><img src="/i/tournament/tco05/tabs/L2_summaryOn.gif" alt="" border="0" /></A></td>
				<% } else { %>
					<td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_finals_analysis"><img src="/i/tournament/tco05/tabs/L2_summaryOff.gif" alt="" border="0" /></A></td>
				<% } %>
--%>
				<% if (tabLev2.equals("competitionArena")) {%>
					<td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_arena"><img src="/i/tournament/tco05/tabs/L2_competitionArenaOn.gif" alt="" border="0" /></A></td>
				<% } else { %>
					<td class="nav"><A href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_arena"><img src="/i/tournament/tco05/tabs/L2_competitionArenaOff.gif" alt="" border="0" /></A></td>
				<% } %>
        		<td class="nav" align=left><img src="/i/tournament/tco05/tabs/L2_sideLT.gif" border="0" /></td>
        		<td class="nav" width="100%">&#160;</td>
			</tr>
		</table>
		</td>
	</tr>

<!-- LEVEL 3 TABS -->
	<tr><td class=tabL3Top colspan=3><img src="/i/clear.gif" width=1 height=7 border="0"/></td></tr>
	<tr>
		<td colspan=3>
		<table width="100%" border="0" cellspacing=0 cellpadding=0 class="subNav">
			<tr>
				<td class="subnavBG">&#160;&#160;&#160;</td>
					<% if (tabLev2.equals("details")) {%>
						<td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_description"><% if (tabLev3.equals("description")) {%><img src="/i/tournament/tco05/tabs/L3_descriptionOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco05/tabs/L3_descriptionOff.gif" border="0" /><% } %></a></td>
						<td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_schedule"><% if (tabLev3.equals("schedule")) {%><img src="/i/tournament/tco05/tabs/L3_scheduleOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco05/tabs/L3_scheduleOff.gif" border="0" /><% } %></a></td>
						<td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_rules"><% if (tabLev3.equals("rules")) {%><img src="/i/tournament/tco05/tabs/L3_rulesOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco05/tabs/L3_rulesOff.gif" border="0" /><% } %></a></td>
					<% } else if (tabLev2.equals("registration")) {%>
						<td class="subnavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
					<% } else if (tabLev2.equals("registrants")) {%>
						<td class="subnavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
					<% } else if (tabLev2.equals("competitionArena")) {%>
						<td class="subnavBG"><img src="/i/clear.gif" height="35" width="1" border="0"/></td>
					<% } else if (tabLev2.equals("advancers")) {%>
						<td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=spon_qualification"><% if (tabLev3.equals("qualification")) {%><img src="/i/tournament/tco05/tabs/L3_qualificationOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco05/tabs/L3_qualificationOff.gif" border="0" /><% } %></a></td>
<%--
						<td class="subnav"><a href="/tc?module=SimpleStats&c=tco05_spon_alg_adv_overview&trans=true&d1=tournaments&d2=tco05&d3=spon_adv_overview"><% if (tabLev3.equals("overview")) {%><img src="/i/tournament/tco05/tabs/L3_overviewOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco05/tabs/L3_overviewOff.gif" border="0" /><% } %></a></td>
--%>
					<% } else if (tabLev2.equals("summary")) {%>
						<td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_sum_onlinerounds"><% if (tabLev3.equals("online")) {%><img src="/i/tournament/tco05/tabs/L3_onlineroundsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco05/tabs/L3_onlineroundsOff.gif" border="0" /><% } %></a></td>
						<td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_room1_analysis"><% if (tabLev3.equals("room1")) {%><img src="/i/tournament/tco05/tabs/L3_room1On.gif" border="0" /><% } else { %><img src="/i/tournament/tco05/tabs/L3_room1Off.gif" border="0" /><% } %></a></td>
						<td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_room2_analysis"><% if (tabLev3.equals("room2")) {%><img src="/i/tournament/tco05/tabs/L3_room2On.gif" border="0" /><% } else { %><img src="/i/tournament/tco05/tabs/L3_room2Off.gif" border="0" /><% } %></a></td>
						<td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_room3_analysis"><% if (tabLev3.equals("room3")) {%><img src="/i/tournament/tco05/tabs/L3_room3On.gif" border="0" /><% } else { %><img src="/i/tournament/tco05/tabs/L3_room3Off.gif" border="0" /><% } %></a></td>
						<td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_wildcard_analysis"><% if (tabLev3.equals("wildcard")) {%><img src="/i/tournament/tco05/tabs/L3_wildcardOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco05/tabs/L3_wildcardOff.gif" border="0" /><% } %></a></td>
						<td class="subnav"><a href="/tc?module=Static&d1=tournaments&d2=tco05&d3=alg_finals_analysis"><% if (tabLev3.equals("finals")) {%><img src="/i/tournament/tco05/tabs/L3_finalsOn.gif" border="0" /><% } else { %><img src="/i/tournament/tco05/tabs/L3_finalsOff.gif" border="0" /><% } %></a></td>
					<% } %>
				<td class="subnavBG" width="100%">&#160;</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
