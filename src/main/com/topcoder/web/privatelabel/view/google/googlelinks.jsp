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

<font size="-1">
<!-- Overview tab -->
            <% if (selectedTab.equals("overview")) {%>
                 <font color="006633">Overview</font> &nbsp;|&nbsp; 
            <% } else { %>
                  <a href="/pl/?&module=Static&d1=google&d2=google_overview">Overview</a> &nbsp;|&nbsp; 
            <% } %>

<!-- Schedule tab -->
            <% if (selectedTab.equals("schedule")) {%>
                 <font color="006633">Schedule</font> &nbsp;|&nbsp; 
            <% } else { %>
                  <a href="/pl/?&module=Static&d1=google&d2=google_sched">Schedule</a> &nbsp;|&nbsp; 
            <% } %>

<!-- Rules tab -->
            <% if (selectedTab.equals("rules")) {%>
                 <font color="006633">Rules</font> &nbsp;|&nbsp; 
            <% } else { %>
                  <a href="/pl/?&module=Static&d1=google&d2=google_rules_overview">Rules</a> &nbsp;|&nbsp; 
            <% } %>

<!-- Registration tab -->
            <% if (selectedTab.equals("registration")) {%>
                 <font color="006633">Registration</font> &nbsp;|&nbsp; 
            <% } else { %>
                  <a href="/pl/?&module=Static&d1=google&d2=google_registration">Registration</a> &nbsp;|&nbsp; 
            <% } %>

<!-- FAQ tab -->
            <% if (selectedTab.equals("faq")) {%>
                 <font color="006633">FAQ</font> &nbsp;|&nbsp; 
            <% } else { %>
                  <a href="/pl/?&module=Static&d1=google&d2=google_faq">FAQ</a> &nbsp;|&nbsp; 
            <% } %>

<!-- Advancers tab -->
            <% if (selectedTab.equals("advancers")) {%>
                 <font color="006633">Advancers</font> &nbsp;|&nbsp; 
            <% } else { %>
                  <a href="/pl/?&module=Static&d1=google&d2=google_advancers">Advancers</a> &nbsp;|&nbsp; 
            <% } %>

<!-- Practice Arena  tab -->
            <% if (selectedTab.equals("arena")) {%>
                 <font color="006633">Competition Arena</font>
            <% } else { %>
                  <a href="/pl/?&module=Static&d1=google&d2=google_arena">Competition Arena</a>
            <% } %>
</font>