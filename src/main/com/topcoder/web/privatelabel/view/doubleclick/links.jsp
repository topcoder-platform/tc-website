<%
    String tabLev1 = request.getParameter("tabLev1")==null?"":request.getParameter("tabLev1");
%>

<table width="750" align="center" border="0" cellpadding="2" cellspacing="1" class="dc_subnav_box">
   <tr valign="top">
      <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
<% if (tabLev1.equals("home")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=overview">Home</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=overview" class="dc_subnav_link">Home</A></td>
<% } %>

<% if (tabLev1.equals("schedule")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=schedule">Schedule</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=schedule" class="dc_subnav_link">Schedule</A></td>
<% } %>

<% if (tabLev1.equals("rules")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=schedule">Rules</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=schedule" class="dc_subnav_link">Rules</A></td>
<% } %>

<% if (tabLev1.equals("advancers")) {%>
                 <td align="center" class="dc_subnav_on"><A href="/pl/?&module=Static&d1=doubleclick&d2=schedule">Advancers</A></td>
<% } else { %>
                 <td align="center" class="dc_subnav"><A href="/pl/?&module=Static&d1=doubleclick&d2=schedule" class="dc_subnav_link">Advancers</A></td>
<% } %>

      <td class="dc_subnav" width="49%" align="center">&nbsp;</td>
   </tr>
</table>