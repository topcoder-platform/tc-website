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
                 <td class="statTextBig" width="88"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_overview" class="statTextBig"><img src="/i/tournament/vcc03/tab_overview_on.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_overview" class="statTextBig"><img src="/i/tournament/vcc03/tab_overview_off.gif" alt="Overview" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Schedule tab -->
            <% if (selectedTab.equals("schedule")) {%>
                 <td class="statTextBig" width="88"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_sched" class="statTextBig"><img src="/i/tournament/vcc03/tab_schedule_on.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_sched" class="statTextBig"><img src="/i/tournament/vcc03/tab_schedule_off.gif" alt="Schedule" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Rules tab -->
            <% if (selectedTab.equals("rules")) {%>
                 <td class="statTextBig" width="88"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_overview" class="statTextBig"><img src="/i/tournament/vcc03/tab_rules_on.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="88"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_overview" class="statTextBig"><img src="/i/tournament/vcc03/tab_rules_off.gif" alt="Rules" width="88" height="22" border="0" /></A></td>
            <% } %>

<!-- Register Now tab -->
            <% if (selectedTab.equals("register_now")) {%>
                 <td class="statTextBig" width="108"><A href="/pl/?&module=FullReg&eid=1&cid=1747"class="statTextBig"><img src="/i/tournament/vcc03/tab_register_now_on.gif" alt="register_now" width="108" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="108"><A href="/pl/?&module=FullReg&eid=1&cid=1747"class="statTextBig"><img src="/i/tournament/vcc03/tab_register_now_off.gif" alt="register_now" width="108" height="22" border="0" /></A></td>
            <% } %>
            
<!-- Practice Arena tab -->
            <% if (selectedTab.equals("arena")) {%>
                 <td class="statTextBig" width="108"><A href="Javascript:openWin('?module=Static&d1=verizon&d2=vcc03_quick_launch','comp',300,225);"class="statTextBig"><img src="/i/tournament/vcc03/tab_arena_on.gif" alt="Arena" width="108" height="22" border="0" /></A></td>
            <% } else { %>
                 <td class="statTextBig" width="108"><A href="Javascript:openWin('?module=Static&d1=verizon&d2=vcc03_quick_launch','comp',300,225);"class="statTextBig"><img src="/i/tournament/vcc03/tab_arena_off.gif" alt="Arena" width="108" height="22" border="0" /></A></td>
            <% } %>            

                                
      <td width="49%"><img src="/i/clear.gif" alt="" width="5" height="10" border="0" /></td>
   </tr>
</table>
