<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3")==null?"":request.getParameter("tabLev3");
%>




<!-- LEVEL 2 TABS -->
<table border="0" cellspacing="0" cellpadding="0" width="100%" bgcolor="#EBEBEB">
    <tr>
        <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>

      <% if (tabLev1.equals("algorithm")) { %>
            <% if (tabLev2.equals("details")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_alg_description" class="statTextBig"><img src="/i/tournament/tco04/tab_details_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_alg_description" class="statTextBig"><img src="/i/tournament/tco04/tab_details_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>
            <% if (tabLev2.equals("advancers")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=SimpleStats&c=tco04_alg_adv_overview&trans=true" class="statTextBig"><img src="/i/tournament/tco04/tab_advancers_on.gif" alt="advancers" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=SimpleStats&c=tco04_alg_adv_overview&trans=true" class="statTextBig"><img src="/i/tournament/tco04/tab_advancers_off.gif" alt="advancers" width="88" height="22" border="0" /></A></td>
            <% } %>
            <% if (tabLev2.equals("summary")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_finals_analysis" class="statTextBig"><img src="/i/tournament/tco04/tab_summary_on.gif" alt="details" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_finals_analysis" class="statTextBig"><img src="/i/tournament/tco04/tab_summary_off.gif" alt="details" width="88" height="22" border="0" /></A></td>
            <% } %>
<%--            
--%>

    <% } else if (tabLev1.equals("component")) { %>
            <% if (tabLev2.equals("details")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_comp_description" class="statTextBig"><img src="/i/tournament/tco04/tab_details_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_comp_description" class="statTextBig"><img src="/i/tournament/tco04/tab_details_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>
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
            <% if (tabLev2.equals("coaches")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_comp_coaches" class="statTextBig"><img src="/i/tournament/tco04/tab_coaches_on.gif" alt="development" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_comp_coaches" class="statTextBig"><img src="/i/tournament/tco04/tab_coaches_off.gif" alt="development" width="88" height="22" border="0" /></A></td>
            <% } %>

    <% } else if (tabLev1.equals("overview")) { %>

            <% if (tabLev2.equals("details")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_about" class="statTextBig"><img src="/i/tournament/tco04/tab_details_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_about" class="statTextBig"><img src="/i/tournament/tco04/tab_details_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>
            
            <% if (tabLev2.equals("join_us")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_onsite_schedule" class="statTextBig"><img src="/i/tournament/tco04/tab_joinus_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_onsite_schedule" class="statTextBig"><img src="/i/tournament/tco04/tab_joinus_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>
<%--            
            <% if (tabLev2.equals("sponsors")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_sponsors" class="statTextBig"><img src="/i/tournament/tco04/tab_sponsors_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_sponsors" class="statTextBig"><img src="/i/tournament/tco04/tab_sponsors_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>
--%>
            
            <% if (tabLev2.equals("onsite_events")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=reception" class="statTextBig"><img src="/i/tournament/tco04/tab_onsiteevents_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco04&d3=reception" class="statTextBig"><img src="/i/tournament/tco04/tab_onsiteevents_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>
   <% } %>

      <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
   </tr>
</table>


<!-- LEVEL 3 TABS -->
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tco04SubNav">
                <tr>
                    <td class="tco04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
      <% if (tabLev1.equals("algorithm")) { %>
            <% if (tabLev2.equals("details")) {%>
                    <td class="<%=tabLev3.equals("description")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_alg_description" class="topLink">Description</a></td>
                    <td class="<%=tabLev3.equals("schedule")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_alg_schedule" class="topLink">Schedule</a></td>
                    <td class="<%=tabLev3.equals("rules")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_alg_rules" class="topLink">Rules</a></td>
            <% } else if (tabLev2.equals("advancers")) {%>
                    <td class="<%=tabLev3.equals("qualification")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=SimpleStats&c=tco04_alg_qual&trans=true" class="topLink">Qualification</a></td>
                    <td class="<%=tabLev3.equals("overview")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=SimpleStats&c=tco04_alg_adv_overview&trans=true" class="topLink">Overview</a></td>
                    <td class="<%=tabLev3.equals("bracket")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_bracket" class="topLink">Bracket</a></td>
                    <td class="<%=tabLev3.equals("radeye")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=radeye_semi" target="_blank" class="topLink">radeye's Odds</a></td>
            <% } else if (tabLev2.equals("summary")) {%>
                    <td class="<%=tabLev3.equals("online")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_sum_onlinerounds" class="topLink">Online Rounds</a></td>
                    <td class="<%=tabLev3.equals("room1")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_room1_analysis" class="topLink">Room 1</a></td>
                    <td class="<%=tabLev3.equals("room2")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_room2_analysis" class="topLink">Room 2</a></td>
                    <td class="<%=tabLev3.equals("room3")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_room3_analysis" class="topLink">Room 3</a></td>
                    <td class="<%=tabLev3.equals("wildcard")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_wildcard_analysis" class="topLink">Wildcard</a></td>
                    <td class="<%=tabLev3.equals("finals")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=alg_finals_analysis" class="topLink">Finals</a></td>
            <% } else { %>
                     <td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
            <% } %>

      <% } else if (tabLev1.equals("component")) { %>
            <% if (tabLev2.equals("details")) {%>
                    <td class="<%=tabLev3.equals("description")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_comp_description" class="topLink">Description</a></td>
                    <td class="<%=tabLev3.equals("schedule")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_comp_schedule" class="topLink">Schedule</a></td>
                    <td class="<%=tabLev3.equals("rules")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_comp_rules" class="topLink">Rules</a></td>
            <% } else if (tabLev2.equals("design")) {%>
                    <td class="<%=tabLev3.equals("round1")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_des_rd1" class="topLink">Round 1</a></td>
                    <td class="<%=tabLev3.equals("round2")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_des_rd2" class="topLink">Round 2</a></td>
                    <td class="<%=tabLev3.equals("finals")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_des_finals" class="topLink">Finals</a></td>
                    <td class="<%=tabLev3.equals("editorial")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_des_editorial" class="topLink">Editorial</a></td>
                    <td class="<%=tabLev3.equals("bracket")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_des_bracket" class="topLink">Bracket</a></td>

            <% } else if (tabLev2.equals("development")) {%>
                    <td class="<%=tabLev3.equals("round1")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_dev_rd1" class="topLink">Round 1</a></td>
                    <td class="<%=tabLev3.equals("round2")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_dev_rd2" class="topLink">Round 2</a></td>
                    <td class="<%=tabLev3.equals("finals")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_dev_finals" class="topLink">Finals</a></td>
                    <td class="<%=tabLev3.equals("editorial")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_dev_editorial" class="topLink">Editorial</a></td>
                    <td class="<%=tabLev3.equals("bracket")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=comp_dev_bracket" class="topLink">Bracket</a></td>
            <% } else if (tabLev2.equals("coaches")) {%>
                    <td class="<%=tabLev3.equals("description")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_comp_coaches" class="topLink">Description</a></td>
                    <td class="<%=tabLev3.equals("request")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_comp_coachesreq" class="topLink">Request a coach</a></td>
            <% } else { %>
                     <td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
            <% } %>
            
      <% } else if (tabLev1.equals("overview")) { %>
            <% if (tabLev2.equals("join_us")) {%>
<%--
                    <td class="<%=tabLev3.equals("spectator")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=spectator_package" class="topLink">Spectator Package</a></td>
--%>
                    <td class="<%=tabLev3.equals("schedule")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_onsite_schedule" class="topLink">Schedule</a></td>
                    <td class="<%=tabLev3.equals("directions")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_directions" class="topLink">Directions</a></td>
                    <td class="<%=tabLev3.equals("transportation")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_transportation" class="topLink">Transportation</a></td>
                    <td class="<%=tabLev3.equals("hotels")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_hotels" class="topLink">Hotels</a></td>
            <% } else if (tabLev2.equals("onsite_events")) {%>
                    <td class="<%=tabLev3.equals("reception")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=reception" class="topLink">Reception</a></td>
                    <td class="<%=tabLev3.equals("photos")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=photos" class="topLink">Photos</a></td>
<%--
                    <td class="<%=tabLev3.equals("movies")?"tco04SubNav_On":"tco04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco04&d3=tco04_movies" class="topLink">Movies</a></td>
--%>
            <% } else { %>
                     <td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
            <% } %>
      <% } %>
            
            
                    <td class="tco04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
            </table>