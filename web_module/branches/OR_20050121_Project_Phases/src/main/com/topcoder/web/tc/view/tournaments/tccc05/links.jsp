<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3")==null?"":request.getParameter("tabLev3");
%>

<!-- Right aligned mapping
<map name="L1_tabs"> 
<area shape="poly" alt="" coords="1,29, 31,1, 208,1, 180,29" href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=about" />
<area shape="poly" alt="" coords="182,29, 210,1, 386,1, 358,29" href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_description" />
<area shape="poly" alt="" coords="362,29, 388,1, 567,1, 567,29" href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_description" />
</map>
-->
<map name="L1_tabs">
<area shape="poly" alt="" coords="1,29, 1,1, 178,1, 204,29" href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=about" />
<area shape="poly" alt="" coords="210,29, 184,1, 356,1, 384,29" href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_description" />
<area shape="poly" alt="" coords="392,29, 364,1, 536,1, 564,29" href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_description" />
</map>

<table width="100%" border=0 cellpadding=0 cellspacing=0> 
<!-- LEVEL 1 TABS -->
<% if (tabLev1.equals("overview")) {%>
	<tr>
		<td width="50%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=about"><img src="/i/tournament/tccc05/tccc05_logo.gif" border=0/></A></td>
		<td valign=middle align=center rowspan=2></td>
		<td valign=top align=right rowspan=2 width="50%"><a href="/"><img src="/i/tournament/tccc05/tc_logo.gif" border=0/></a></td>
	</tr>
	<tr><td class=topNavBox><img src="/i/tournament/tccc05/tabs/L1_overviewOnL.gif" alt="" border=0 usemap="#L1_tabs"/></td></tr>
<% } else if (tabLev1.equals("algorithm")) { %>
	<tr>
		<td width="50%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=about"><img src="/i/tournament/tccc05/tccc05_logo.gif" border=0/></A></td>
		<td valign=middle align=center rowspan=2>
<%--
      <a href="/tc?module=TCCC05AlgorithmTerms"><img src="/i/tournament/tccc05/tccc05_headline.gif" border=0/></a>
--%>
      </td>
		<td valign=top align=right rowspan=2 width="50%"><a href="/"><img src="/i/tournament/tccc05/tc_logo.gif" border=0/></a></td>
	</tr>
	<tr><td class=topNavBox><img src="/i/tournament/tccc05/tabs/L1_algOnL.gif" alt="" border=0 usemap="#L1_tabs"/></td></tr>
<% } else if (tabLev1.equals("component")) { %>
	<tr>
		<td width="50%"><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=about"><img src="/i/tournament/tccc05/tccc05_logo.gif" border=0/></A></td>
		<td valign=middle align=center rowspan=2>
<%--
      <a href="/tc?module=TCCC05ComponentTerms"><img src="/i/tournament/tccc05/tccc05_headline.gif" border=0/></a>
--%>
      </td>
		<td valign=top align=right rowspan=2 width="50%"><a href="/"><img src="/i/tournament/tccc05/tc_logo.gif" border=0/></a></td>
	</tr>
	<tr><td class=topNavBox><img src="/i/tournament/tccc05/tabs/L1_compOnL.gif" alt="" border=0 usemap="#L1_tabs"/></td></tr>
<% } %>

<!-- LEVEL 2 TABS -->
	<tr>
		<td colspan=3>
		<table border=0 cellspacing=0 cellpadding=0 width="100%">
    		<tr>
        		<td class=nav>&#160;&#160;&#160;</td>
        		<td class=nav align=right><img src="/i/tournament/tccc05/tabs/L2_sideDK.gif" border=0 /></td>

			<% if (tabLev1.equals("overview")) { %>
				<% if (tabLev2.equals("details")) {%>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=about"><img src="/i/tournament/tccc05/tabs/L2_detailsOn.gif" alt="" border=0 /></A></td>
				<% } else { %>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=about"><img src="/i/tournament/tccc05/tabs/L2_detailsOff.gif" alt="" border=0 /></A></td>
				<% } %>
				<% if (tabLev2.equals("join_us")) {%>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=onsite_schedule"><img src="/i/tournament/tccc05/tabs/L2_joinusOn.gif" alt="" border=0 /></A></td>
				<% } else { %>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=onsite_schedule"><img src="/i/tournament/tccc05/tabs/L2_joinusOff.gif" alt="" border=0 /></A></td>
				<% } %>
<%--
				<% if (tabLev2.equals("onsite_events")) {%>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=photos"><img src="/i/tournament/tccc05/tabs/L2_onsiteeventsOn.gif" alt="" border=0 /></A></td>
				<% } else { %>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=photos"><img src="/i/tournament/tccc05/tabs/L2_onsiteeventsOff.gif" alt="" border=0 /></A></td>
				<% } %>
				<% if (tabLev2.equals("specshow")) {%>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=specshow"><img src="/i/tournament/tccc05/tabs/L2_specshowOn.gif" alt="" border=0 /></A></td>
				<% } else { %>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=specshow"><img src="/i/tournament/tccc05/tabs/L2_specshowOff.gif" alt="" border=0 /></A></td>
				<% } %>
--%>
				<% if (tabLev2.equals("student_reps")) {%>
					<td class=nav><A href="/tc?module=TCCC05StudentReps"><img src="/i/tournament/tccc05/tabs/L2_studentrepsOn.gif" alt="" border=0 /></A></td>
				<% } else { %>
					<td class=nav><A href="/tc?module=TCCC05StudentReps"><img src="/i/tournament/tccc05/tabs/L2_studentrepsOff.gif" alt="" border=0 /></A></td>
				<% } %>
				<% if (tabLev2.equals("sponsors")) {%>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=motorola"><img src="/i/tournament/tccc05/tabs/L2_sponsorsOn.gif" alt="" border=0 /></A></td>
				<% } else { %>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=motorola"><img src="/i/tournament/tccc05/tabs/L2_sponsorsOff.gif" alt="" border=0 /></A></td>
				<% } %>

				<% } else if (tabLev1.equals("algorithm")) { %>
				<% if (tabLev2.equals("details")) {%>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_description"><img src="/i/tournament/tccc05/tabs/L2_detailsOn.gif" alt="" border=0 /></A></td>
				<% } else { %>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_description"><img src="/i/tournament/tccc05/tabs/L2_detailsOff.gif" alt="" border=0 /></A></td>
				<% } %>
				<% if (tabLev2.equals("advancers")) {%>
					<td class=nav><A href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&d1=tournaments&d2=tccc05&d3=alg_adv_overview"><img src="/i/tournament/tccc05/tabs/L2_advancersOn.gif" alt="" border=0 /></A></td>
				<% } else { %>
					<td class=nav><A href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&d1=tournaments&d2=tccc05&d3=alg_adv_overview"><img src="/i/tournament/tccc05/tabs/L2_advancersOff.gif" alt="" border=0 /></A></td>
				<% } %>
<%--
				<% if (tabLev2.equals("summary")) {%>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_sum_onlinerounds"><img src="/i/tournament/tccc05/tabs/L2_summaryOn.gif" alt="" border=0 /></A></td>
				<% } else { %>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_sum_onlinerounds"><img src="/i/tournament/tccc05/tabs/L2_summaryOff.gif" alt="" border=0 /></A></td>
				<% } %>
--%>
				<% } else if (tabLev1.equals("component")) { %>
				<% if (tabLev2.equals("details")) {%>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_description"><img src="/i/tournament/tccc05/tabs/L2_detailsOn.gif" alt="" border=0 /></A></td>
				<% } else { %>
					<td class=nav><A href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_description"><img src="/i/tournament/tccc05/tabs/L2_detailsOff.gif" alt="" border=0 /></A></td>
				<% } %>
				<% if (tabLev2.equals("design")) {%>
					<td class=nav><A href="/tc?module=TCCC05Results&ph=112"><img src="/i/tournament/tccc05/tabs/L2_designOn.gif" alt="" border=0 /></A></td>
				<% } else { %>
					<td class=nav><A href="/tc?module=TCCC05Results&ph=112"><img src="/i/tournament/tccc05/tabs/L2_designOff.gif" alt="" border=0 /></A></td>
				<% } %>
				<% if (tabLev2.equals("development")) {%>
					<td class=nav><A href="/tc?module=TCCC05Results&ph=113"><img src="/i/tournament/tccc05/tabs/L2_developmentOn.gif" alt="" border=0 /></A></td>
				<% } else { %>
					<td class=nav><A href="/tc?module=TCCC05Results&ph=113"><img src="/i/tournament/tccc05/tabs/L2_developmentOff.gif" alt="" border=0 /></A></td>
				<% } %>
			<% } %>
        		<td class=nav align=left><img src="/i/tournament/tccc05/tabs/L2_sideLT.gif" border=0 /></td>
        		<td class=nav width="100%">&#160;</td>
			</tr>
		</table>
		</td>
	</tr>

<!-- LEVEL 3 TABS -->
	<tr><td class=tabL3Top colspan=3><img src="/i/clear.gif" width=1 height=7 border=0/></td></tr>
	<tr>
		<td colspan=3>
		<table width="100%" border=0 cellspacing=0 cellpadding=0 class="subNav">
			<tr>
				<td class=subNavBG>&#160;&#160;&#160;</td>
				<% if (tabLev1.equals("overview")) { %>
					<% if (tabLev2.equals("join_us")) {%>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=onsite_schedule"><% if (tabLev3.equals("schedule")) {%><img src="/i/tournament/tccc05/tabs/L3_scheduleOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_scheduleOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=directions"><% if (tabLev3.equals("directions")) {%><img src="/i/tournament/tccc05/tabs/L3_directionsOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_directionsOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=transportation"><% if (tabLev3.equals("transportation")) {%><img src="/i/tournament/tccc05/tabs/L3_transportationOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_transportationOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=hotels"><% if (tabLev3.equals("hotels")) {%><img src="/i/tournament/tccc05/tabs/L3_hotelsOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_hotelsOff.gif" border=0><% } %></a></td>
					<% } else if (tabLev2.equals("onsite_events")) {%>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=photos"><% if (tabLev3.equals("photos")) {%><img src="/i/tournament/tccc05/tabs/L3_photosOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_photosOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=movies"><% if (tabLev3.equals("movies")) {%><img src="/i/tournament/tccc05/tabs/L3_moviesOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_moviesOff.gif" border=0><% } %></a></td>
					<% } else if (tabLev2.equals("specshow")) {%>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=specshow"><% if (tabLev3.equals("description")) {%><img src="/i/tournament/tccc05/tabs/L3_descriptionOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_descriptionOff.gif" border=0><% } %></a></td>
					<% } else if (tabLev2.equals("sponsors")) {%>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=motorola"><% if (tabLev3.equals("motorola")) {%><img src="/i/tournament/tccc05/tabs/L3_motorolaOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_motorolaOff.gif" border=0><% } %></a></td>
					<% } else {%>
						<td class=subNavBG><img src="/i/clear.gif" height="35" width="1" border=0/></td>
					<% } %>
				<% } else if (tabLev1.equals("algorithm")) { %>
					<% if (tabLev2.equals("details")) {%>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_description"><% if (tabLev3.equals("description")) {%><img src="/i/tournament/tccc05/tabs/L3_descriptionOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_descriptionOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_schedule"><% if (tabLev3.equals("schedule")) {%><img src="/i/tournament/tccc05/tabs/L3_scheduleOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_scheduleOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_rules"><% if (tabLev3.equals("rules")) {%><img src="/i/tournament/tccc05/tabs/L3_rulesOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_rulesOff.gif" border=0><% } %></a></td>
					<% } else if (tabLev2.equals("advancers")) {%>
						<td class=subnav><a href="/tc?module=SimpleStats&c=tccc05_alg_qual&trans=true&d1=tournaments&d2=tccc05&d3=alg_qualification"><% if (tabLev3.equals("qualification")) {%><img src="/i/tournament/tccc05/tabs/L3_qualificationOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_qualificationOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=SimpleStats&c=tccc05_alg_adv_overview&trans=true&d1=tournaments&d2=tccc05&d3=alg_adv_overview"><% if (tabLev3.equals("overview")) {%><img src="/i/tournament/tccc05/tabs/L3_overviewOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_overviewOff.gif" border=0><% } %></a></td>
<%--
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_bracket"><% if (tabLev3.equals("bracket")) {%><img src="/i/tournament/tccc05/tabs/L3_bracketOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_bracketOff.gif" border=0><% } %></a></td>
--%>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=radeye_rd3" target="_blank"><% if (tabLev3.equals("radeye")) {%><img src="/i/tournament/tccc05/tabs/L3_radeyeOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_radeyeOff.gif" border=0><% } %></a></td>
					<% } else if (tabLev2.equals("summary")) {%>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_sum_onlinerounds"><% if (tabLev3.equals("online")) {%><img src="/i/tournament/tccc05/tabs/L3_onlineroundsOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_onlineroundsOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_room1_analysis"><% if (tabLev3.equals("room1")) {%><img src="/i/tournament/tccc05/tabs/L3_room1On.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_room1Off.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_room2_analysis"><% if (tabLev3.equals("room2")) {%><img src="/i/tournament/tccc05/tabs/L3_room2On.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_room2Off.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_room3_analysis"><% if (tabLev3.equals("room3")) {%><img src="/i/tournament/tccc05/tabs/L3_room3On.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_room3Off.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_wildcard_analysis"><% if (tabLev3.equals("wildcard")) {%><img src="/i/tournament/tccc05/tabs/L3_wildcardOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_wildcardOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=alg_finals_analysis"><% if (tabLev3.equals("finals")) {%><img src="/i/tournament/tccc05/tabs/L3_finalsOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_finalsOff.gif" border=0><% } %></a></td>
					<% } %>
				<% } else if (tabLev1.equals("component")) { %>
					<% if (tabLev2.equals("details")) {%>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_description"><% if (tabLev3.equals("description")) {%><img src="/i/tournament/tccc05/tabs/L3_descriptionOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_descriptionOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_schedule"><% if (tabLev3.equals("schedule")) {%><img src="/i/tournament/tccc05/tabs/L3_scheduleOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_scheduleOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_rules"><% if (tabLev3.equals("rules")) {%><img src="/i/tournament/tccc05/tabs/L3_rulesOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_rulesOff.gif" border=0><% } %></a></td>
					<% } else if (tabLev2.equals("design")) {%>
						<td class=subnav><a href="/tc?module=TCCC05Results&ph=112"><% if (tabLev3.equals("results")) {%><img src="/i/tournament/tccc05/tabs/L3_resultsOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_resultsOff.gif" border=0><% } %></a></td>
<%--
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_des_finals"><% if (tabLev3.equals("finals")) {%><img src="/i/tournament/tccc05/tabs/L3_finalsOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_finalsOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_des_summary"><% if (tabLev3.equals("summary")) {%><img src="/i/tournament/tccc05/tabs/L3_summaryOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_summaryOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_des_bracket"><% if (tabLev3.equals("bracket")) {%><img src="/i/tournament/tccc05/tabs/L3_bracketOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_bracketOff.gif" border=0><% } %></a></td>
--%>
					<% } else if (tabLev2.equals("development")) {%>
						<td class=subnav><a href="/tc?module=TCCC05Results&ph=113"><% if (tabLev3.equals("results")) {%><img src="/i/tournament/tccc05/tabs/L3_resultsOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_resultsOff.gif" border=0><% } %></a></td>
<%--
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_dev_finals"><% if (tabLev3.equals("finals")) {%><img src="/i/tournament/tccc05/tabs/L3_finalsOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_finalsOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_dev_summary"><% if (tabLev3.equals("summary")) {%><img src="/i/tournament/tccc05/tabs/L3_summaryOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_summaryOff.gif" border=0><% } %></a></td>
						<td class=subnav><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=comp_dev_bracket"><% if (tabLev3.equals("bracket")) {%><img src="/i/tournament/tccc05/tabs/L3_bracketOn.gif" border=0><% } else { %><img src="/i/tournament/tccc05/tabs/L3_bracketOff.gif" border=0><% } %></a></td>
--%>
					<% } %>
				<% } %>
				<td class=subNavBG width="100%">&#160;</td>
			</tr>
		</table>
		</td>
	</tr>
<%--
	<tr><td class=tabL3Bottom colspan=3><img src="/i/clear.gif" width=1 height=7 border=0/></td></tr>
--%>
</table> 