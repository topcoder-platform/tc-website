<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
%>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr>
        <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>

<!-- Summary tab -->
            <% if (selectedTab.equals("overview")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tco03&d2=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_overview_on.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tco03&d2=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_overview_off.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Schedule tab -->
            <% if (selectedTab.equals("schedule")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tco03&d2=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_schedule_on.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tco03&d2=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_schedule_off.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Rules tab -->
            <% if (selectedTab.equals("rules")) {%>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tco03&d2=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_rules_on.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/tc?module=Static&d1=tco03&d2=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_rules_off.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Advancers tab -->
            <% if (selectedTab.equals("advancers")) {%>
                 <td class="statTextBig" width="128"><A href="/tc?module=Static&d1=tco03&d2=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_advancers_on.gif" alt="Advancers" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="128"><A href="/tc?module=Static&d1=tco03&d2=tco03_overview" class="statTextBig"><img src="/i/tournament/tco03/tab_advancers_off.gif" alt="Advancers" width="88" height="22" border="0" /></A></td>
            <% } %>

      <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
   </tr>
</table>
