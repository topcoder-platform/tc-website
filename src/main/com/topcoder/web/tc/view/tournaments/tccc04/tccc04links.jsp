<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
    String tabLev3 = request.getParameter("tabLev3")==null?"":request.getParameter("tabLev3");
%>

<!-- Large Coding/Component Tabs begins -->
<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td width="49%" align="right"><img src="/i/clear.gif" alt="" width="5" height="10" border="0"  vspace="0"/></td>
<% if (tabLev1.equals("algorithm")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview"><img src="/i/tournament/tco03/coding_tab_on.gif" alt="Coding Tab" width="239" height="54" border="0" vspace="0" hspace="0"/></A></td>
<% } else if (tabLev1.equals("both")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview"><img src="/i/tournament/tco03/coding_tab_on.gif" alt="Coding Tab" width="239" height="54" border="0" vspace="0" hspace="0"/></A></td>
<% } else { %>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview"><img src="/i/tournament/tco03/coding_tab_off.gif" alt="Coding Tab" width="239" height="54" border="0" vspace="0" hspace="0"/></A></td>
<% } %>

<% if (tabLev1.equals("component")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_overview"><img src="/i/tournament/tco03/component_tab_on.gif" alt="Component tab" width="239" height="54" border="0" vspace="0" hspace="0"/></A></td>
<% } else if (tabLev1.equals("both")) { %>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_overview"><img src="/i/tournament/tco03/component_tab_on.gif" alt="Component tab" width="239" height="54" border="0" vspace="0" hspace="0"/></A></td>
<% } else {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_comp_overview"><img src="/i/tournament/tco03/component_tab_off.gif" alt="Component tab" width="239" height="54" border="0" vspace="0" hspace="0"/></A></td>
<% } %>
      <td width="49%" align="left"><img src="/i/clear.gif" alt="" width="5" height="10" border="0"  vspace="0"/></td>
   </tr>
</table>
<!-- Large Coding/Component Tabs ends -->


<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
        <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>

<!-- Overview tab -->
            <% if (tabLev2.equals("overview")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="statTextBig"><img src="/i/tournament/tccc04/tab_overview_on.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_overview" class="statTextBig"><img src="/i/tournament/tccc04/tab_overview_off.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Schedule tab -->
            <% if (tabLev2.equals("schedule")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_schedule" class="statTextBig"><img src="/i/tournament/tccc04/tab_schedule_on.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_schedule" class="statTextBig"><img src="/i/tournament/tccc04/tab_schedule_off.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Rules tab -->
            <% if (tabLev2.equals("rules")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_rules_overview" class="statTextBig"><img src="/i/tournament/tccc04/tab_rules_on.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_rules_overview" class="statTextBig"><img src="/i/tournament/tccc04/tab_rules_off.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Advancers tab -->
            <% if (tabLev2.equals("advancers")) {%>
                 <td class="statTextBig" width="128"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_advancers" class="statTextBig"><img src="/i/tournament/tccc04/tab_advancers_on.gif" alt="Advancers" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="128"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_advancers" class="statTextBig"><img src="/i/tournament/tccc04/tab_advancers_off.gif" alt="Advancers" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Summary tab -->
            <% if (tabLev2.equals("summary")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_summary" class="statTextBig"><img src="/i/tournament/tccc04/tab_summary_on.gif" alt="Summary" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_summary" class="statTextBig"><img src="/i/tournament/tccc04/tab_summary_off.gif" alt="Summary" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Photos tab -->
            <% if (tabLev2.equals("photos")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_photos" class="statTextBig"><img src="/i/tournament/tccc04/tab_photos_on.gif" alt="Photos" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=tccc04_alg_photos" class="statTextBig"><img src="/i/tournament/tccc04/tab_photos_off.gif" alt="Photos" width="88" height="22" border="0" /></A></td>
            <% } %>


      <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
   </tr>
</table>

    <% if (tabLev2.equals("rules")) { %>
            <table width="100%" border="0" cellspacing="0" cellpadding="2" class="tccc04SubNav">
                <tr>
                    <td class="tccc04SubNav" width="49%"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                    <td class="<%=tabLev3.equals("overview")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco&d3=tccc04_alg_overview" class="topLink">Participate</a></td>
                    <td class="<%=tabLev3.equals("eligibility")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco&d3=tccc04_alg_overview" class="topLink">Onsite</a></td>
                    <td class="<%=tabLev3.equals("conditions")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco&d3=tccc04_alg_overview" class="topLink">Directions</a></td>
                    <td class="<%=tabLev3.equals("structure")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco&d3=tccc04_alg_overview" class="topLink">Transportation</a></td>
                    <td class="<%=tabLev3.equals("prizes")?"tccc04SubNav_on":"tccc04SubNav"%>" width="1" nowrap="nowrap"><a href="/tc?module=Static&d1=tournaments&d2=tco&d3=tccc04_alg_overview" class="topLink">Hotels</a></td>
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