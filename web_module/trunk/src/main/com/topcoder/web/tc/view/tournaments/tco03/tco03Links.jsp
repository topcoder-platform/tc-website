<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedContest = request.getParameter("selectedContest")==null?"":request.getParameter("selectedContest");
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
%>

<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td width="49%" align="right"><img src="/i/clear.gif" alt="" width="5" height="10" border="0"  vspace="0"/></td>
<% if (selectedContest.equals("coding")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_overview"><img src="/i/tournament/tco03/coding_tab_on.gif" alt="Coding Tab" width="239" height="54" border="0" vspace="0" hspace="0"/></A></td>
<% } else { %>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_overview"><img src="/i/tournament/tco03/coding_tab_off.gif" alt="Coding Tab" width="239" height="54" border="0" vspace="0" hspace="0"/></A></td>
<% } %>
<% if (selectedContest.equals("component")) {%>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_overview"><img src="/i/tournament/tco03/component_tab_on.gif" alt="Component tab" width="239" height="54" border="0" vspace="0" hspace="0"/></A></td>
<% } else { %>
                 <td align="center" width="239"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_overview"><img src="/i/tournament/tco03/component_tab_off.gif" alt="Component tab" width="239" height="54" border="0" vspace="0" hspace="0"/></A></td>
<% } %>
      <td width="49%" align="left"><img src="/i/clear.gif" alt="" width="5" height="10" border="0"  vspace="0"/></td>
   </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
      <tr>
         <td width="49%" align="right"><img src="/i/clear.gif" alt="" width="5" height="10" border="0"  vspace="0"/></td>
           <td align="center" valign="top"><img src="/i/tournament/tco03/bracket_left.gif" alt="bracket" width="25" height="19" border="0" vspace="0" hspace="0"/></td>
           <td align="center" valign="top"><img src="/i/tournament/tco03/bracket_middle.gif" alt="bracket" width="325" height="19" border="0" vspace="0" hspace="0"/></td>
           <td align="center" valign="top"><img src="/i/tournament/tco03/bracket_right.gif" alt="bracket" width="25" height="19" border="0" vspace="0" hspace="0"/></td>
         <td width="49%" align="left"><img src="/i/clear.gif" alt="" width="5" height="10" border="0"  vspace="0"/></td>
      </tr>
</table>

<% if (selectedContest.equals("coding")) {%>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td width="49%" align="right"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
<!-- Summary tab -->
            <% if (selectedTab.equals("coding_overview")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_overview_on.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_overview_off.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Schedule tab -->
            <% if (selectedTab.equals("coding_schedule")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_schedule" class="statTextBig"><img src="/i/tournament/tco03/tab_schedule_on.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_schedule" class="statTextBig"><img src="/i/tournament/tco03/tab_schedule_off.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Rules tab -->
            <% if (selectedTab.equals("coding_rules")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_rules_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_rules_on.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_rules_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_rules_off.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Advancers tab -->
            <% if (selectedTab.equals("coding_advancers")) {%>
                 <td class="statTextBig" width="128"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_highlights" class="statTextBig"><img src="/i/tournament/tco03/tab_advancers_on.gif" alt="Advancers" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="128"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_highlights" class="statTextBig"><img src="/i/tournament/tco03/tab_advancers_off.gif" alt="Advancers" width="88" height="22" border="0" /></A></td>
            <% } %>
      <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
   </tr>
</table>
<% } %>

<% if (selectedContest.equals("component")) {%>
<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td width="49%" align="right"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
<!-- Summary tab -->
            <% if (selectedTab.equals("component_overview")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_overview_on.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_overview_off.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Schedule tab -->
            <% if (selectedTab.equals("component_schedule")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_schedule" class="statTextBig"><img src="/i/tournament/tco03/tab_schedule_on.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_schedule" class="statTextBig"><img src="/i/tournament/tco03/tab_schedule_off.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Rules tab -->
            <% if (selectedTab.equals("component_rules")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_rules_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_rules_on.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_rules_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_rules_off.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Advancers tab -->
            <% if (selectedTab.equals("component_advancers")) {%>
                 <td class="statTextBig" width="128"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_des_rd1" class="statTextBig"><img src="/i/tournament/tco03/tab_advancers_on.gif" alt="Advancers" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="128"><A href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_comp_des_rd1" class="statTextBig"><img src="/i/tournament/tco03/tab_advancers_off.gif" alt="Advancers" width="88" height="22" border="0" /></A></td>
            <% } %>

      <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
   </tr>
</table>
<% } %>
