<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3")==null?"":request.getParameter("tabLev3");
%>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EBEBEB">

<!-- LEVEL 1 TABS -->
<% if (tabLev1.equals("overview")) {%>
	<tr>
		<td valign=top rowspan=2><img src="/i/clear.gif" width="10" height="9" border="0"/><br/>
		<A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=about"><img src="/i/tournament/tco04/tco04_logo.gif" width="300" height="152" border="0"/></A></td>
		<td align="center" valign=top class=topNavBox>
			<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=about"><img src="/i/tournament/tco04/on_tournament.gif" width="179" height="24" border="0"></a><br/>
			<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_description"><img src="/i/tournament/tco04/off_algorithm.gif" width="179" height="24" border="0"></a><br/>
			<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_description"><img src="/i/tournament/tco04/off_component.gif" width="179" height="24" border="0"></a><br/>
		</td>
		<td align="right" rowspan=2><img src="/i/tournament/tco04/tournament_image.jpg" width="302" height="175" border="0"/></td>
	</tr>
<% } else if (tabLev1.equals("algorithm")) { %>
	<tr>
		<td valign=top rowspan=2><img src="/i/clear.gif" width="10" height="9" border="0"/><br/>
		<A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=about"><img src="/i/tournament/tco04/tco04_logo.gif" width="300" height="152" border="0"/></A></td>
		<td align="center" valign=top class=topNavBox>
			<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=about"><img src="/i/tournament/tco04/off_tournament.gif" width="179" height="24" border="0"></a><br/>
			<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_description"><img src="/i/tournament/tco04/on_algorithm.gif" width="179" height="24" border="0"></a><br/>
			<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_description"><img src="/i/tournament/tco04/off_component.gif" width="179" height="24" border="0"></a><br/>
		</td>
		<td align="right" rowspan=2><img src="/i/tournament/tco04/algorithm_image.jpg" width="302" height="175" border="0"/></td>
	</tr>
<% } else if (tabLev1.equals("component")) { %>
	<tr>
		<td valign=top rowspan=2><img src="/i/clear.gif" width="10" height="9" border="0"/><br/>
		<A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=about"><img src="/i/tournament/tco04/tco04_logo.gif" width="300" height="152" border="0"/></A></td>
		<td align="center" valign=top class=topNavBox>
			<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=about"><img src="/i/tournament/tco04/off_tournament.gif" width="179" height="24" border="0"></a><br/>
			<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_description"><img src="/i/tournament/tco04/off_algorithm.gif" width="179" height="24" border="0"></a><br/>
			<a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_description"><img src="/i/tournament/tco04/on_component.gif" width="179" height="24" border="0"></a><br/>
		</td>
		<td align="right" rowspan=2><img src="/i/tournament/tco04/component_image.jpg" width="302" height="175" border="0"/></td>
	</tr>
<% } %>


<!-- LEVEL 2 TABS -->
	<tr>
		<td valign=bottom>
		<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#EBEBEB">
    		<tr>
        		<td class=nav width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>

<% if (tabLev1.equals("algorithm")) { %>
	<% if (tabLev2.equals("details")) {%>
                <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_description" class="statTextBig"><img src="/i/tournament/tco04/tab_details_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
	<% } else { %>
                <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_description" class="statTextBig"><img src="/i/tournament/tco04/tab_details_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
	<% } %>
	<%--
	<% if (tabLev2.equals("advancers")) {%>
                <td class="statTextBig" width="88"><A href="" class="statTextBig"><img src="/i/tournament/tco04/tab_advancers_on.gif" alt="advancers" width="88" height="22" border="0" /></A></td>
	<% } else { %>
                <td class="statTextBig" width="88"><A href="" class="statTextBig"><img src="/i/tournament/tco04/tab_advancers_off.gif" alt="advancers" width="88" height="22" border="0" /></A></td>
	<% } %>
	<% if (tabLev2.equals("summary")) {%>
                <td class="statTextBig" width="88"><A href="" class="statTextBig"><img src="/i/tournament/tco04/tab_summary_on.gif" alt="details" width="88" height="22" border="0" /></A></td>
	<% } else { %>
                <td class="statTextBig" width="88"><A href="" class="statTextBig"><img src="/i/tournament/tco04/tab_summary_off.gif" alt="details" width="88" height="22" border="0" /></A></td>
	<% } %>
	--%>
<% } else if (tabLev1.equals("component")) { %>
	<% if (tabLev2.equals("details")) {%>
                <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_description" class="statTextBig"><img src="/i/tournament/tco04/tab_details_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
	<% } else { %>
                <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_description" class="statTextBig"><img src="/i/tournament/tco04/tab_details_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
	<% } %>
	<%--
	<% if (tabLev2.equals("design")) {%>
                <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_des_editorial" class="statTextBig"><img src="/i/tournament/tco04/tab_design_on.gif" alt="design" width="88" height="22" border="0" /></A></td>
	<% } else { %>
                <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_des_editorial" class="statTextBig"><img src="/i/tournament/tco04/tab_design_off.gif" alt="design" width="88" height="22" border="0" /></A></td>
	<% } %>
	<% if (tabLev2.equals("development")) {%>
                <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_dev_editorial" class="statTextBig"><img src="/i/tournament/tco04/tab_development_on.gif" alt="development" width="88" height="22" border="0" /></A></td>
	<% } else { %>
                <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_dev_editorial" class="statTextBig"><img src="/i/tournament/tco04/tab_development_off.gif" alt="development" width="88" height="22" border="0" /></A></td>
	<% } %>
	--%>
<% } else if (tabLev1.equals("overview")) { %>
	<% if (tabLev2.equals("details")) {%>
                <td class="nav" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=about" class="statTextBig"><img src="/i/tournament/tco04/tab_details_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
	<% } else { %>
                <td class="nav" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=about" class="statTextBig"><img src="/i/tournament/tco04/tab_details_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
	<% } %>
	<% if (tabLev2.equals("join_us")) {%>
                <td class="nav" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=onsite_schedule" class="statTextBig"><img src="/i/tournament/tco04/tab_joinus_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
	<% } else { %>
                <td class="nav" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=onsite_schedule" class="statTextBig"><img src="/i/tournament/tco04/tab_joinus_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
	<% } %>
<%--            
	<% if (tabLev2.equals("sponsors")) {%>
                <td class="nav" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_sponsors" class="statTextBig"><img src="/i/tournament/tco04/tab_sponsors_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
	<% } else { %>
                <td class="nav" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_sponsors" class="statTextBig"><img src="/i/tournament/tco04/tab_sponsors_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
	<% } %>
	<% if (tabLev2.equals("onsite_events")) {%>
                <td class="nav" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=reception" class="statTextBig"><img src="/i/tournament/tco04/tab_onsiteevents_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
	<% } else { %>
                <td class="nav" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=reception" class="statTextBig"><img src="/i/tournament/tco04/tab_onsiteevents_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
	<% } %>
--%>
<% } %>

				<td class=nav width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
			</tr>
		</table>
		</td>
	</tr>

<!-- LEVEL 3 TABS -->
	<tr>
		<td colspan=3>

<table width="100%" border="0" cellspacing="0" cellpadding="2" class="subNav">
	<tr>
		<td class="subNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
<% if (tabLev1.equals("algorithm")) { %>
	<% if (tabLev2.equals("details")) {%>
		<td class="<%=tabLev3.equals("description")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_description" class="subNavLink">Description</a></td>
		<td class="<%=tabLev3.equals("schedule")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_schedule" class="subNavLink">Schedule</a></td>
		<td class="<%=tabLev3.equals("rules")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_rules" class="subNavLink">Rules</a></td>
	<% } else if (tabLev2.equals("advancers")) {%>
		<td class="<%=tabLev3.equals("qualification")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=SimpleStats&c=alg_qual&trans=true" class="subNavLink">Qualification</a></td>
		<td class="<%=tabLev3.equals("overview")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=SimpleStats&c=alg_adv_overview&trans=true" class="subNavLink">Overview</a></td>
		<td class="<%=tabLev3.equals("bracket")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_bracket" class="subNavLink">Bracket</a></td>
		<td class="<%=tabLev3.equals("radeye")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=radeye_semi" target="_blank" class="subNavLink">radeye's Odds</a></td>
	<% } else if (tabLev2.equals("summary")) {%>
		<td class="<%=tabLev3.equals("online")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_sum_onlinerounds" class="subNavLink">Online Rounds</a></td>
		<td class="<%=tabLev3.equals("room1")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_room1_analysis" class="subNavLink">Room 1</a></td>
		<td class="<%=tabLev3.equals("room2")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_room2_analysis" class="subNavLink">Room 2</a></td>
		<td class="<%=tabLev3.equals("room3")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_room3_analysis" class="subNavLink">Room 3</a></td>
		<td class="<%=tabLev3.equals("wildcard")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_wildcard_analysis" class="subNavLink">Wildcard</a></td>
		<td class="<%=tabLev3.equals("finals")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_finals_analysis" class="subNavLink">Finals</a></td>
	<% } else { %>
		<td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
	<% } %>
<% } else if (tabLev1.equals("component")) { %>
	<% if (tabLev2.equals("details")) {%>
		<td class="<%=tabLev3.equals("description")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_description" class="subNavLink">Description</a></td>
		<td class="<%=tabLev3.equals("schedule")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_schedule" class="subNavLink">Schedule</a></td>
		<td class="<%=tabLev3.equals("rules")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_rules" class="subNavLink">Rules</a></td>
	<% } else if (tabLev2.equals("design")) {%>
		<td class="<%=tabLev3.equals("round1")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_des_rd1" class="subNavLink">Round 1</a></td>
		<td class="<%=tabLev3.equals("round2")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_des_rd2" class="subNavLink">Round 2</a></td>
		<td class="<%=tabLev3.equals("finals")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_des_finals" class="subNavLink">Finals</a></td>
		<td class="<%=tabLev3.equals("editorial")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_des_editorial" class="subNavLink">Editorial</a></td>
		<td class="<%=tabLev3.equals("bracket")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_des_bracket" class="subNavLink">Bracket</a></td>
	<% } else if (tabLev2.equals("development")) {%>
		<td class="<%=tabLev3.equals("round1")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_dev_rd1" class="subNavLink">Round 1</a></td>
		<td class="<%=tabLev3.equals("round2")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_dev_rd2" class="subNavLink">Round 2</a></td>
		<td class="<%=tabLev3.equals("finals")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_dev_finals" class="subNavLink">Finals</a></td>
		<td class="<%=tabLev3.equals("editorial")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_dev_editorial" class="subNavLink">Editorial</a></td>
		<td class="<%=tabLev3.equals("bracket")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_dev_bracket" class="subNavLink">Bracket</a></td>
	<% } else { %>
		<td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
	<% } %>
<% } else if (tabLev1.equals("overview")) { %>
	<% if (tabLev2.equals("join_us")) {%>
		<%--
		<td class="<%=tabLev3.equals("spectator")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=spectator_package" class="subNavLink">Spectator Package</a></td>
		--%>
		<td class="<%=tabLev3.equals("schedule")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=onsite_schedule" class="subNavLink">Schedule</a></td>
		<td class="<%=tabLev3.equals("directions")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=directions" class="subNavLink">Directions</a></td>
		<td class="<%=tabLev3.equals("transportation")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=transportation" class="subNavLink">Transportation</a></td>
		<td class="<%=tabLev3.equals("hotels")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=hotels" class="subNavLink">Hotels</a></td>
	<% } else if (tabLev2.equals("onsite_events")) {%>
		<td class="<%=tabLev3.equals("reception")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=reception" class="subNavLink">Reception</a></td>
		<td class="<%=tabLev3.equals("photos")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=photos" class="subNavLink">Photos</a></td>
		<td class="<%=tabLev3.equals("movies")?"subNav_On":"subNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=movies" class="subNavLink">Movies</a></td>
	<% } else { %>
		<td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
	<% } %>
<% } %>
            
		<td class="subNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
	</tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
	<tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
</table>
		
		</td>
	</tr>
</table>