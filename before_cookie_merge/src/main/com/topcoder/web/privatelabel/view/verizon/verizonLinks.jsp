<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
    String selectedSubtab = request.getParameter("selectedSubtab")==null?"":request.getParameter("selectedSubtab");    
%>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<table border="0" cellspacing="0" cellpadding="0" width="100%">


<!-- Summary tab -->
            <% if (selectedTab.equals("overview")) {%>
                 <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_overview" class="statTextBig"><img src="/i/events/verizon2003/tab_overview_on.gif" alt="Overview" width="127" height="25" border="0" /></A></td></tr>
            <% } else { %>
                 <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_overview" class="statTextBig"><img src="/i/events/verizon2003/tab_overview_off.gif" alt="Overview" width="127" height="25" border="0" /></A></td></tr>
            <% } %>

<!-- Schedule tab -->
            <% if (selectedTab.equals("schedule")) {%>
                 <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_sched" class="statTextBig"><img src="/i/events/verizon2003/tab_schedule_on.gif" alt="Schedule" width="127" height="25" border="0" /></A></td></tr>
            <% } else { %>
                 <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_sched" class="statTextBig"><img src="/i/events/verizon2003/tab_schedule_off.gif" alt="Schedule" width="127" height="25" border="0" /></A></td></tr>
            <% } %>

<!-- Rules tab -->
            <% if (selectedTab.equals("rules")) {%>
                 <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_overview" class="statTextBig"><img src="/i/events/verizon2003/tab_rules_on.gif" alt="Rules" width="127" height="25" border="0" /></A></td></tr>
            <% } else { %>
                 <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_overview" class="statTextBig"><img src="/i/events/verizon2003/tab_rules_off.gif" alt="Rules" width="127" height="25" border="0" /></A></td></tr>
            <% } %>

<!-- Sublinks -->
            <% if (selectedTab.equals("rules")) {%>

               <% if (selectedSubtab.equals("general")) {%>
                    <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_overview" class="statTextBig"><img src="/i/events/verizon2003/tab_general_on.gif" alt="Rules" width="127" height="25" border="0" /></A></td></tr>
               <% } else { %>
                    <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_overview" class="statTextBig"><img src="/i/events/verizon2003/tab_general_off.gif" alt="Rules" width="127" height="25" border="0" /></A></td></tr>
               <% } %>

               <% if (selectedSubtab.equals("eligibility")) {%>
                    <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_eligibility" class="statTextBig"><img src="/i/events/verizon2003/tab_eligibility_on.gif" alt="Rules" width="127" height="25" border="0" /></A></td></tr>
               <% } else { %>
                    <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_eligibility" class="statTextBig"><img src="/i/events/verizon2003/tab_eligibility_off.gif" alt="Rules" width="127" height="25" border="0" /></A></td></tr>
               <% } %>

               <% if (selectedSubtab.equals("conditions")) {%>
                    <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_conditions" class="statTextBig"><img src="/i/events/verizon2003/tab_conditions_on.gif" alt="Rules" width="127" height="25" border="0" /></A></td></tr>
               <% } else { %>
                    <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_conditions" class="statTextBig"><img src="/i/events/verizon2003/tab_conditions_off.gif" alt="Rules" width="127" height="25" border="0" /></A></td></tr>
               <% } %>

               <% if (selectedSubtab.equals("structure")) {%>
                    <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_structure" class="statTextBig"><img src="/i/events/verizon2003/tab_structure_on.gif" alt="Rules" width="127" height="25" border="0" /></A></td></tr>
               <% } else { %>
                    <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_structure" class="statTextBig"><img src="/i/events/verizon2003/tab_structure_off.gif" alt="Rules" width="127" height="25" border="0" /></A></td></tr>
               <% } %>

               <% if (selectedSubtab.equals("prizes")) {%>
                    <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_prizes" class="statTextBig"><img src="/i/events/verizon2003/tab_prizes_on.gif" alt="Rules" width="127" height="25" border="0" /></A></td></tr>
               <% } else { %>
                    <tr><td class="statTextBig" width="127"><A href="/pl/?&module=Static&d1=verizon&d2=vcc03_rules_prizes" class="statTextBig"><img src="/i/events/verizon2003/tab_prizes_off.gif" alt="Rules" width="127" height="25" border="0" /></A></td></tr>
               <% } %>

            <% } else { %>
            <% } %>

<!-- Register Now tab -->
            <% if (selectedTab.equals("register_now")) {%>
                 <tr><td class="statTextBig" width="127"><A href="?&<%=Constants.MODULE_KEY+"="+Constants.VERIZON_REG_MAIN+"&"+Constants.COMPANY_ID+"=1747&"+Constants.EVENT_ID+"=1"%>"><img src="/i/events/verizon2003/tab_register_now_on.gif" alt="register_now" width="127" height="25" border="0" /></A></td></tr>
            <% } else { %>
                 <tr><td class="statTextBig" width="127"><A href="?&<%=Constants.MODULE_KEY+"="+Constants.VERIZON_REG_MAIN+"&"+Constants.COMPANY_ID+"=1747&"+Constants.EVENT_ID+"=1"%>"><img src="/i/events/verizon2003/tab_register_now_off.gif" alt="register_now" width="127" height="25" border="0" /></A></td></tr>
            <% } %>
            
<!-- Practice Arena tab -->
                 <tr><td class="statTextBig" width="127"><A href="Javascript:openWin('?module=Static&d1=verizon&d2=vcc03_quick_launch','comp',300,225);"class="statTextBig"><img src="/i/events/verizon2003/tab_applet.gif" alt="Arena" width="127" height="25" border="0" /></A></td></tr>

                                
</table>
