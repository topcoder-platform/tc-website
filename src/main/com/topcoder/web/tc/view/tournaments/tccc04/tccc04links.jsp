<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3")==null?"":request.getParameter("tabLev3");
%>

<table border="0" cellspacing="0" cellpadding="0" width="100%">

<!-- Headlines -->

    <tr align="center">
      <td width="100%" align="center" colspan="5">
<% if (tabLev1.equals("overview")) {%>
                 <img src="/i/tournament/tccc04/headline_tournament.gif" alt="Tournament Overview Headline" width="540" height="30" border="0" vspace="0" hspace="0"/>
<% } else { %>
                 
<% } %>

<% if (tabLev1.equals("algorithm")) {%>
                 <img src="/i/tournament/tccc04/headline_algorithm.gif" alt="Algorithm Headline" width="540" height="30" border="0" vspace="0" hspace="0"/>
<% } else { %>
                 
<% } %>

<% if (tabLev1.equals("component")) {%>
                 <img src="/i/tournament/tccc04/headline_component.gif" alt="Component Headline" width="540" height="30" border="0" vspace="0" hspace="0"/>
<% } else {%>
                 
<% } %>

      </td>
   </tr>


    <tr>
      <td width="100%" align="center" colspan="5"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"  vspace="0"/></td>
   </tr>
   
<!-- LEVEL 1 TABS -->
    <tr>
      <td width="49%" align="right">&#160;</td>
<% if (tabLev1.equals("overview")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_about"><img src="/i/tournament/tccc04/tab_tournament_on.gif" alt="Tournament Overview Tab" width="182" height="23" border="0" vspace="0" hspace="0"/></A></td>
<% } else { %>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_about"><img src="/i/tournament/tccc04/tab_tournament_off.gif" alt="Tournament Overview Tab" width="182" height="23" border="0" vspace="0" hspace="0"/></A></td>
<% } %>

<% if (tabLev1.equals("algorithm")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_description"><img src="/i/tournament/tccc04/tab_algorithm_on.gif" alt="Algorithm Tab" width="182" height="23" border="0" vspace="0" hspace="0"/></A></td>
<% } else { %>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_description"><img src="/i/tournament/tccc04/tab_algorithm_off.gif" alt="Algorithm Tab" width="182" height="23" border="0" vspace="0" hspace="0"/></A></td>
<% } %>

<% if (tabLev1.equals("component")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_description"><img src="/i/tournament/tccc04/tab_component_on.gif" alt="Component tab" width="176" height="23" border="0" vspace="0" hspace="0"/></A></td>
<% } else {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_description"><img src="/i/tournament/tccc04/tab_component_off.gif" alt="Component tab" width="176" height="23" border="0" vspace="0" hspace="0"/></A></td>
<% } %>

      <td width="49%" align="left">&#160;</td>
   </tr>
   
    <tr>
      <td width="100%" align="center" colspan="5"><img src="/i/clear.gif" alt="" width="10" height="15" border="0"/></td>
   </tr>
</table>


<!-- LEVEL 2 TABS -->
<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
        <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>

      <% if (tabLev1.equals("algorithm")) { %>
            <% if (tabLev2.equals("details")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_description" class="statTextBig"><img src="/i/tournament/tccc04/tab_details_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_description" class="statTextBig"><img src="/i/tournament/tccc04/tab_details_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>
            <% if (tabLev2.equals("advancers")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=SimpleStats&c=tccc04_alg_qual&trans=true" class="statTextBig"><img src="/i/tournament/tccc04/tab_advancers_on.gif" alt="advancers" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=SimpleStats&c=tccc04_alg_qual&trans=true" class="statTextBig"><img src="/i/tournament/tccc04/tab_advancers_off.gif" alt="advancers" width="88" height="22" border="0" /></A></td>
            <% } %>
<%--
            <% if (tabLev2.equals("summary")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_onlinerounds" class="statTextBig"><img src="/i/tournament/tccc04/tab_summary_on.gif" alt="details" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_onlinerounds" class="statTextBig"><img src="/i/tournament/tccc04/tab_summary_off.gif" alt="details" width="88" height="22" border="0" /></A></td>
            <% } %>
--%>

    <% } else if (tabLev1.equals("component")) { %>
            <% if (tabLev2.equals("details")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_description" class="statTextBig"><img src="/i/tournament/tccc04/tab_details_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_description" class="statTextBig"><img src="/i/tournament/tccc04/tab_details_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>
            <% if (tabLev2.equals("design")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_des_rd1" class="statTextBig"><img src="/i/tournament/tccc04/tab_design_on.gif" alt="design" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_des_rd1" class="statTextBig"><img src="/i/tournament/tccc04/tab_design_off.gif" alt="design" width="88" height="22" border="0" /></A></td>
            <% } %>
            <% if (tabLev2.equals("development")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_dev_rd1" class="statTextBig"><img src="/i/tournament/tccc04/tab_development_on.gif" alt="development" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_dev_rd1" class="statTextBig"><img src="/i/tournament/tccc04/tab_development_off.gif" alt="development" width="88" height="22" border="0" /></A></td>
            <% } %>
            <% if (tabLev2.equals("coaches")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_coaches" class="statTextBig"><img src="/i/tournament/tccc04/tab_coaches_on.gif" alt="development" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_coaches" class="statTextBig"><img src="/i/tournament/tccc04/tab_coaches_off.gif" alt="development" width="88" height="22" border="0" /></A></td>
            <% } %>

    <% } else if (tabLev1.equals("overview")) { %>

            <% if (tabLev2.equals("details")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_about" class="statTextBig"><img src="/i/tournament/tccc04/tab_details_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_about" class="statTextBig"><img src="/i/tournament/tccc04/tab_details_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>
            
            <% if (tabLev2.equals("join_us")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=spectator_package" class="statTextBig"><img src="/i/tournament/tccc04/tab_joinus_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=spectator_package" class="statTextBig"><img src="/i/tournament/tccc04/tab_joinus_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>
<%--            
            <% if (tabLev2.equals("sponsors")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_sponsors" class="statTextBig"><img src="/i/tournament/tccc04/tab_sponsors_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_sponsors" class="statTextBig"><img src="/i/tournament/tccc04/tab_sponsors_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>
            
            <% if (tabLev2.equals("onsite_events")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_onsite_events" class="statTextBig"><img src="/i/tournament/tccc04/tab_onsiteevents_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_onsite_events" class="statTextBig"><img src="/i/tournament/tccc04/tab_onsiteevents_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>
--%>
   <% } %>

      <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
   </tr>
</table>


<!-- LEVEL 3 TABS -->
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tccc04SubNav">
                <tr>
                    <td class="tccc04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
      <% if (tabLev1.equals("algorithm")) { %>
            <% if (tabLev2.equals("details")) {%>
                    <td class="<%=tabLev3.equals("description")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_description" class="topLink">Description</a></td>
                    <td class="<%=tabLev3.equals("schedule")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_schedule" class="topLink">Schedule</a></td>
                    <td class="<%=tabLev3.equals("rules")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_rules" class="topLink">Rules</a></td>
            <% } else if (tabLev2.equals("advancers")) {%>
                    <td class="<%=tabLev3.equals("qualification")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=SimpleStats&c=tccc04_alg_qual&trans=true" class="topLink">Qualification</a></td>
                    <td class="<%=tabLev3.equals("overview")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=SimpleStats&c=tccc04_alg_adv_overview&trans=true" class="topLink">Overview</a></td>
<%--
                    <td class="<%=tabLev3.equals("bracket")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_adv_bracket" class="topLink">Bracket</a></td>
--%>
                    <td class="<%=tabLev3.equals("radeye")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=radeye_r d2" target="_blank" class="topLink">radeye's Odds</a></td>
            <% } else if (tabLev2.equals("summary")) {%>
                    <td class="<%=tabLev3.equals("online")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_onlinerounds" class="topLink">Online Rounds</a></td>
                    <td class="<%=tabLev3.equals("room1")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_room1" class="topLink">Room 1</a></td>
                    <td class="<%=tabLev3.equals("room2")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_room2" class="topLink">Room 2</a></td>
                    <td class="<%=tabLev3.equals("room3")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_room3" class="topLink">Room 3</a></td>
                    <td class="<%=tabLev3.equals("room4")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_room4" class="topLink">Room 4</a></td>
                    <td class="<%=tabLev3.equals("finals")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_finals" class="topLink">Finals</a></td>
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
<%--
                    <td class="<%=tabLev3.equals("finals")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_des_finals" class="topLink">Finals</a></td>
                    <td class="<%=tabLev3.equals("bracket")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_des_bracket" class="topLink">Bracket</a></td>
--%>
            <% } else if (tabLev2.equals("development")) {%>
                    <td class="<%=tabLev3.equals("round1")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_dev_rd1" class="topLink">Round 1</a></td>
<%--
                    <td class="<%=tabLev3.equals("round2")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_dev_rd2" class="topLink">Round 2</a></td>
                    <td class="<%=tabLev3.equals("finals")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_dev_finals" class="topLink">Finals</a></td>
                    <td class="<%=tabLev3.equals("bracket")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=comp_dev_bracket" class="topLink">Bracket</a></td>
--%>
            <% } else if (tabLev2.equals("coaches")) {%>
                    <td class="<%=tabLev3.equals("description")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_coaches" class="topLink">Description</a></td>
                    <td class="<%=tabLev3.equals("request")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_coachesreq" class="topLink">Request a coach</a></td>
            <% } else { %>
                     <td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
            <% } %>
            
      <% } else if (tabLev1.equals("overview")) { %>
            <% if (tabLev2.equals("join_us")) {%>
                    <td class="<%=tabLev3.equals("spectator")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=spectator_package" class="topLink">Spectator Package</a></td>
                    <td class="<%=tabLev3.equals("schedule")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_onsite_schedule" class="topLink">Schedule</a></td>
                    <td class="<%=tabLev3.equals("directions")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_directions" class="topLink">Directions</a></td>
                    <td class="<%=tabLev3.equals("transportation")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_transportation" class="topLink">Transportation</a></td>
                    <td class="<%=tabLev3.equals("hotels")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_hotels" class="topLink">Hotels</a></td>
            <% } else if (tabLev2.equals("onsite_events")) {%>
                    <td class="<%=tabLev3.equals("reception")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_reception" class="topLink">Reception</a></td>
                    <td class="<%=tabLev3.equals("awards")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_awards" class="topLink">Awards</a></td>
                    <td class="<%=tabLev3.equals("photos")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_photos" class="topLink">Photos</a></td>
                    <td class="<%=tabLev3.equals("movies")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_movies" class="topLink">Movies</a></td>
            <% } else { %>
                     <td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td>
            <% } %>
      <% } %>
            
            
                    <td class="tccc04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
            </table>