<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3")==null?"":request.getParameter("tabLev3");
%>

<!-- Large Coding/Component Tabs begins -->
<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td width="49%" align="right"></td>
<% if (tabLev1.equals("algorithm")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview"><img src="/i/tournament/tccc04/tab_algorithm_on.gif" alt="Algorithm Tab" width="200" height="26" border="0" vspace="0" hspace="0"/></A></td>
<% } else if (tabLev1.equals("both")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview"><img src="/i/tournament/tccc04/tab_algorithm_on.gif" alt="Algorithm Tab" width="200" height="26" border="0" vspace="0" hspace="0"/></A></td>
<% } else { %>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview"><img src="/i/tournament/tccc04/tab_algorithm_off.gif" alt="Algorithm Tab" width="200" height="26" border="0" vspace="0" hspace="0"/></A></td>
<% } %>

<% if (tabLev1.equals("component")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_overview"><img src="/i/tournament/tccc04/tab_component_on.gif" alt="Component tab" width="200" height="26" border="0" vspace="0" hspace="0"/></A></td>
<% } else if (tabLev1.equals("both")) { %>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_overview"><img src="/i/tournament/tccc04/tab_component_on.gif" alt="Component tab" width="200" height="26" border="0" vspace="0" hspace="0"/></A></td>
<% } else {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_overview"><img src="/i/tournament/tccc04/tab_component_off.gif" alt="Component tab" width="200" height="26" border="0" vspace="0" hspace="0"/></A></td>
<% } %>

<% if (tabLev1.equals("atthetccc")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview"><img src="/i/tournament/tccc04/tab_atthetccc_on.gif" alt="Media Tab" width="120" height="26" border="0" vspace="0" hspace="0"/></A></td>
<% } else if (tabLev1.equals("both")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview"><img src="/i/tournament/tccc04/tab_atthetccc_on.gif" alt="Media Tab" width="120" height="26" border="0" vspace="0" hspace="0"/></A></td>
<% } else { %>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview"><img src="/i/tournament/tccc04/tab_atthetccc_off.gif" alt="Media Tab" width="120" height="26" border="0" vspace="0" hspace="0"/></A></td>
<% } %>
      <td width="49%" align="left"></td>
   </tr>
    <tr>
      <td width="100%" align="center" colspan="5"><img src="/i/clear.gif" alt="" width="10" height="10" border="0"  vspace="0"/></td>
   </tr>
</table>
<!-- Large Coding/Component Tabs ends -->


<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
        <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>

<!-- About tab -->
            <% if (tabLev2.equals("about")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="statTextBig"><img src="/i/tournament/tccc04/tab_about_on.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="statTextBig"><img src="/i/tournament/tccc04/tab_about_off.gif" alt="about" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Advancers tab -->
            <% if (tabLev2.equals("advancers")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_adv_qual" class="statTextBig"><img src="/i/tournament/tccc04/tab_advancers_on.gif" alt="advancers" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_adv_qual" class="statTextBig"><img src="/i/tournament/tccc04/tab_advancers_off.gif" alt="advancers" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Details tab -->
            <% if (tabLev2.equals("details")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_details" class="statTextBig"><img src="/i/tournament/tccc04/tab_details_on.gif" alt="details" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_details" class="statTextBig"><img src="/i/tournament/tccc04/tab_details_off.gif" alt="details" width="88" height="22" border="0" /></A></td>
            <% } %>


      <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
   </tr>
</table>

      <% if (tabLev2.equals("about")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tccc04SubNav">
                <tr>
                    <td class="tccc04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tabLev3.equals("description")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="topLink">Description</a></td>
                    <td class="<%=tabLev3.equals("schedule")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_schedule" class="topLink">Schedule</a></td>
                    <td class="<%=tabLev3.equals("rules")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_rules" class="topLink">Rules</a></td>
                    <td class="tccc04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
            </table>

    <% } else if (tabLev2.equals("advancers")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tccc04SubNav">
                <tr>
                    <td class="tccc04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tabLev3.equals("qualification")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_adv_qual" class="topLink">Qualification</a></td>
                    <td class="<%=tabLev3.equals("overview")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_adv_overview" class="topLink">Overview</a></td>
                    <td class="<%=tabLev3.equals("bracket")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_adv_bracket" class="topLink">Bracket</a></td>
                    <td class="<%=tabLev3.equals("radeye")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_radeye_finals" target="_blank" class="topLink">radeye's Odds</a></td>
                    <td class="tccc04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
            </table>

    <% } else if (tabLev2.equals("details")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tccc04SubNav">
                <tr>
                    <td class="tccc04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tabLev3.equals("online")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="topLink">Online Rounds</a></td>
                    <td class="<%=tabLev3.equals("room1")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="topLink">Room 1</a></td>
                    <td class="<%=tabLev3.equals("room2")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="topLink">Room 2</a></td>
                    <td class="<%=tabLev3.equals("room3")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="topLink">Room 3</a></td>
                    <td class="<%=tabLev3.equals("room4")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="topLink">Room 4</a></td>
                    <td class="<%=tabLev3.equals("finals")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="topLink">Finals</a></td>
                    <td class="tccc04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
            </table>

    <% } else if (tabLev2.equals("onsite")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tccc04SubNav">
                <tr>
                    <td class="tccc04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tabLev3.equals("overview")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="topLink">Participate</a></td>
                    <td class="<%=tabLev3.equals("eligibility")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="topLink">Onsite</a></td>
                    <td class="<%=tabLev3.equals("conditions")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="topLink">Directions</a></td>
                    <td class="<%=tabLev3.equals("structure")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="topLink">Transportation</a></td>
                    <td class="<%=tabLev3.equals("prizes")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="topLink">Hotels</a></td>
                    <td class="tccc04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bodyText">
               <tr><td bgcolor="#666666" width="100%" height="3" class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="3" border="0" /></td></tr>
            </table>

    <% } else { %>
        <table width="100%" border="0" cellpadding="0" cellspacing="0" class="tccc04SubNav">
            <tr><td width="100%"><img src="/i/clear.gif" alt="" width="10" height="5" border="0" /></td></tr>
        </table>
    <% } %>