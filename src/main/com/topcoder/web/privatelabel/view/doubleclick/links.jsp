<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
%>

<table width="750" cellpadding="0" cellspacing="7" border="0" align="center">
   <tr><td align="left" valign="bottom"><a href="http://www.doubleclick.com/us/"><img src="/i/events/doubleclick/dccc_logo.gif" width="200" height="100" alt="DoubleClick" border="0"/></a></td>
   <td align="right" valign="bottom"><a href="/"><img src="/i/events/doubleclick/pbtc.gif" width="220" height="70" alt="TopCoder" border="0"/></a></td>
   </tr>
</table>

<% if (tabLev1.equals("collegiate")) {%>
<table width="750" align="center" border="0" cellpadding="2" cellspacing="1" class="dc_subnav_box">
   <tr valign="top">
      <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
<% if (tabLev2.equals("overview")) {%>
                 <td align="center" class="dc_subnav_on"><a class="dc_subnav_on_link" href="/pl/?&module=Static&d1=doubleclick&d2=col_overview">Tournament Overview</a></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><a class="dc_subnav_link" href="/pl/?&module=Static&d1=doubleclick&d2=col_overview">Tournament Overview</a></td>
<% } %>

<% if (tabLev2.equals("schedule")) {%>
                 <td align="center" class="dc_subnav_on"><a class="dc_subnav_on_link" href="/pl/?&module=Static&d1=doubleclick&d2=col_schedule">Schedule</a></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><a class="dc_subnav_link" href="/pl/?&module=Static&d1=doubleclick&d2=col_schedule">Schedule</a></td>
<% } %>

<% if (tabLev2.equals("registration")) {%>
                 <td align="center" class="dc_subnav_on"><a class="dc_subnav_on_link" href="/pl/?module=DCReg&cid=2998&eid=1">Registration</a></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><a class="dc_subnav_link" href="/pl/?module=DCReg&cid=2998&eid=1">Registration</a></td>
<% } %>

<% if (tabLev2.equals("rules")) {%>
                 <td align="center" class="dc_subnav_on"><a class="dc_subnav_on_link" href="/pl/?&module=Static&d1=doubleclick&d2=col_rules">Rules</a></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><a class="dc_subnav_link" href="/pl/?&module=Static&d1=doubleclick&d2=col_rules">Rules</a></td>
<% } %>

<% if (tabLev2.equals("arena")) {%>
                 <td align="center" class="dc_subnav_on"><a class="dc_subnav_on_link" href="/pl/?&module=Static&d1=doubleclick&d2=col_arena">Practice Arena</a></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><a class="dc_subnav_link" href="/pl/?&module=Static&d1=doubleclick&d2=col_arena">Practice Arena</a></td>
<% } %>

      <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
   </tr>
</table>

<% } else if(tabLev1.equals("internal")){ %>
<table width="750" align="center" border="0" cellpadding="2" cellspacing="1" class="dc_subnav_box">
   <tr valign="top">
      <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
<% if (tabLev2.equals("overview")) {%>
                 <td align="center" class="dc_subnav_on"><a class="dc_subnav_on_link" href="/pl/?&module=Static&d1=doubleclick&d2=int_overview" class="dc_subnav_on_link">Tournament Overview</a></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><a class="dc_subnav_link" href="/pl/?&module=Static&d1=doubleclick&d2=int_overview" class="dc_subnav_link">Tournament Overview</a></td>
<% } %>

<% if (tabLev2.equals("schedule")) {%>
                 <td align="center" class="dc_subnav_on"><a class="dc_subnav_on_link" href="/pl/?&module=Static&d1=doubleclick&d2=int_schedule" class="dc_subnav_on_link">Schedule</a></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><a class="dc_subnav_link" href="/pl/?&module=Static&d1=doubleclick&d2=int_schedule" class="dc_subnav_link">Schedule</a></td>
<% } %>

<% if (tabLev2.equals("registration")) {%>
                 <td align="center" class="dc_subnav_on"><a class="dc_subnav_on_link" href="/pl/?module=DCReg&cid=2998&eid=2">Registration</a></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><a class="dc_subnav_link" href="/pl/?module=DCReg&cid=2998&eid=2">Registration</a></td>
<% } %>

<% if (tabLev2.equals("rules")) {%>
                 <td align="center" class="dc_subnav_on"><a class="dc_subnav_on_link" href="/pl/?&module=Static&d1=doubleclick&d2=int_rules" class="dc_subnav_on_link">Rules</a></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><a class="dc_subnav_link" href="/pl/?&module=Static&d1=doubleclick&d2=int_rules" class="dc_subnav_link">Rules</a></td>
<% } %>

      <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
   </tr>
</table>
<% } %>