<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3")==null?"":request.getParameter("tabLev3");
%>

<!-- LEVEL 3 TABS -->
<table width="100%" border="0" cellspacing="0" cellpadding="2" class="tccc04SubNav">
	<tr>
                    <td class="tccc04SubNav" ><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
      <% if (tabLev1.equals("algorithm")) { %>
            <% if (tabLev2.equals("details")) {%>
                    <td class="<%=tabLev3.equals("description")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_description" class="topLink">Description</a></td>
                    <td class="<%=tabLev3.equals("schedule")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_schedule" class="topLink">Schedule</a></td>
                    <td class="<%=tabLev3.equals("rules")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_rules" class="topLink">Rules</a></td>
            <% } else if (tabLev2.equals("advancers")) {%>
                    <td class="<%=tabLev3.equals("qualification")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=SimpleStats&c=tccc04_alg_qual&trans=true" class="topLink">Qualification</a></td>
                    <td class="<%=tabLev3.equals("overview")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true" class="topLink">Overview</a></td>
                    <td class="<%=tabLev3.equals("bracket")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_bracket" class="topLink">Bracket</a></td>
                    <td class="<%=tabLev3.equals("radeye")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=radeye_semi" target="_blank" class="topLink">radeye's Odds</a></td>
            <% } else if (tabLev2.equals("summary")) {%>
                    <td class="<%=tabLev3.equals("online")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_sum_onlinerounds" class="topLink">Online Rounds</a></td>
                    <td class="<%=tabLev3.equals("room1")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_room1_analysis" class="topLink">Room 1</a></td>
                    <td class="<%=tabLev3.equals("room2")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_room2_analysis" class="topLink">Room 2</a></td>
                    <td class="<%=tabLev3.equals("room3")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_room3_analysis" class="topLink">Room 3</a></td>
                    <td class="<%=tabLev3.equals("wildcard")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_wildcard_analysis" class="topLink">Wildcard</a></td>
                    <td class="<%=tabLev3.equals("finals")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=alg_finals_analysis" class="topLink">Finals</a></td>
            <% } else { %>
                     <td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
            <% } %>

      <% } else if (tabLev1.equals("component")) { %>
            <% if (tabLev2.equals("details")) {%>
                    <td class="<%=tabLev3.equals("description")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_description" class="topLink">Description</a></td>
                    <td class="<%=tabLev3.equals("schedule")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_schedule" class="topLink">Schedule</a></td>
                    <td class="<%=tabLev3.equals("rules")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_rules" class="topLink">Rules</a></td>
            <% } else if (tabLev2.equals("design")) {%>
                    <td class="<%=tabLev3.equals("round1")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_des_rd1" class="topLink">Round 1</a></td>
                    <td class="<%=tabLev3.equals("round2")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_des_rd2" class="topLink">Round 2</a></td>
                    <td class="<%=tabLev3.equals("finals")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_des_finals" class="topLink">Finals</a></td>
                    <td class="<%=tabLev3.equals("editorial")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_des_editorial" class="topLink">Editorial</a></td>
                    <td class="<%=tabLev3.equals("bracket")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_des_bracket" class="topLink">Bracket</a></td>

            <% } else if (tabLev2.equals("development")) {%>
                    <td class="<%=tabLev3.equals("round1")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_dev_rd1" class="topLink">Round 1</a></td>
                    <td class="<%=tabLev3.equals("round2")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_dev_rd2" class="topLink">Round 2</a></td>
                    <td class="<%=tabLev3.equals("finals")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_dev_finals" class="topLink">Finals</a></td>
                    <td class="<%=tabLev3.equals("editorial")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_dev_editorial" class="topLink">Editorial</a></td>
                    <td class="<%=tabLev3.equals("bracket")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_dev_bracket" class="topLink">Bracket</a></td>
            <% } else if (tabLev2.equals("coaches")) {%>
                    <td class="<%=tabLev3.equals("description")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_coaches" class="topLink">Description</a></td>
                    <td class="<%=tabLev3.equals("request")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_coachesreq" class="topLink">Request a coach</a></td>
            <% } else { %>
                     <td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
            <% } %>
            
      <% } else if (tabLev1.equals("overview")) { %>
            <% if (tabLev2.equals("join_us")) {%>
<%--
                    <td class="<%=tabLev3.equals("spectator")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=spectator_package" class="topLink">Spectator Package</a></td>
--%>
                    <td class="<%=tabLev3.equals("schedule")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_onsite_schedule" class="topLink">Schedule</a></td>
                    <td class="<%=tabLev3.equals("directions")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_directions" class="topLink">Directions</a></td>
                    <td class="<%=tabLev3.equals("transportation")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_transportation" class="topLink">Transportation</a></td>
                    <td class="<%=tabLev3.equals("hotels")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_hotels" class="topLink">Hotels</a></td>
            <% } else if (tabLev2.equals("onsite_events")) {%>
                    <td class="<%=tabLev3.equals("reception")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=reception" class="topLink">Reception</a></td>
                    <td class="<%=tabLev3.equals("photos")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=photos" class="topLink">Photos</a></td>
<%--
                    <td class="<%=tabLev3.equals("movies")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_movies" class="topLink">Movies</a></td>
--%>
            <% } else { %>
                     <td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
            <% } %>
      <% } %>
            
            
                    <td class="tccc04SubNav"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
	<tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
</table>