<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
    String tabLev2 = request.getParameter("tabLev2")==null?"":request.getParameter("tabLev2");
%>

<% if (tabLev1.equals("collegiate")) {%>
<table width="750" align="center" border="0" cellpadding="2" cellspacing="1" class="dc_subnav_box">
   <tr valign="top">
      <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
<% if (tabLev2.equals("overview")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=col_overview" class="dc_subnav_on_link">Tournament Overview</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=col_overview" class="dc_subnav_link">Tournament Overview</A></td>
<% } %>

<% if (tabLev2.equals("schedule")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=col_schedule" class="dc_subnav_on_link">Schedule</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=col_schedule" class="dc_subnav_link">Schedule</A></td>
<% } %>

<% if (tabLev2.equals("rules")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=col_rules" class="dc_subnav_on_link">Rules</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=col_rules" class="dc_subnav_link">Rules</A></td>
<% } %>

<% if (tabLev2.equals("registration")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=col_registration" class="dc_subnav_on_link">Registration</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=col_registration" class="dc_subnav_link">Registration</A></td>
<% } %>

<% if (tabLev2.equals("advancers")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=col_advancers" class="dc_subnav_on_link">Advancers</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=col_advancers" class="dc_subnav_link">Advancers</A></td>
<% } %>

      <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
   </tr>
</table>

<% } else if(tabLev1.equals("internal")){ %>
<table width="750" align="center" border="0" cellpadding="2" cellspacing="1" class="dc_subnav_box">
   <tr valign="top">
      <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
<% if (tabLev2.equals("overview")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=int_overview" class="dc_subnav_on_link">Tournament Overview</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=int_overview" class="dc_subnav_link">Tournament Overview</A></td>
<% } %>

<% if (tabLev2.equals("schedule")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=int_schedule" class="dc_subnav_on_link">Schedule</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=int_schedule" class="dc_subnav_link">Schedule</A></td>
<% } %>

<% if (tabLev2.equals("rules")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=int_rules" class="dc_subnav_on_link">Rules</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=int_rules" class="dc_subnav_link">Rules</A></td>
<% } %>

<% if (tabLev2.equals("registration")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=int_registration" class="dc_subnav_on_link">Registration</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=int_registration" class="dc_subnav_link">Registration</A></td>
<% } %>

<% if (tabLev2.equals("advancers")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=int_advancers" class="dc_subnav_on_link">Advancers</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=int_advancers" class="dc_subnav_link">Advancers</A></td>
<% } %>

      <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
   </tr>
</table>
<% } %>