<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
%>

<font size="-1">
<!-- Overview tab -->
            <% if (selectedTab.equals("overview")) {%>
                 <font color="006633">Overview</font> &nbsp;|&nbsp;
            <% } else { %>
                  <a href="/pl/?module=Static&d1=gccj05&d2=EN_overview_temp">Overview</a> &nbsp;|&nbsp;
            <% } %>

<!-- Schedule tab -->
            <% if (selectedTab.equals("schedule")) {%>
                 <font color="006633">Schedule</font> &nbsp;|&nbsp;
            <% } else { %>
                  <a href="/pl/?module=Static&d1=gccj05&d2=EN_schedule">Schedule</a> &nbsp;|&nbsp;
            <% } %>

<!-- Rules tab -->
            <% if (selectedTab.equals("rules")) {%>
                 <font color="006633">Rules</font> &nbsp;|&nbsp;
            <% } else { %>
                  <a href="/pl/?module=Static&d1=gccj05&d2=EN_rules">Rules</a> &nbsp;|&nbsp;
            <% } %>

<!-- Registration tab -->

            <% if (selectedTab.equals("registration")) {%>
                 <font color="006633">Registration</font> &nbsp;|&nbsp;
            <% } else { %>
                  <a href="/pl/?module=Static&d1=gccj05&d2=EN_reg_closed">Registration</a> &nbsp;|&nbsp;
            <% } %>

<!-- Instructions tab -->
            <% if (selectedTab.equals("instructions")) {%>
                 <font color="006633">Instructions</font> &nbsp;|&nbsp;
            <% } else { %>
                  <a href="/pl/?module=Static&d1=gccj05&d2=EN_instructions">Instructions</a> &nbsp;|&nbsp;
            <% } %>

<!-- FAQ tab -->
            <% if (selectedTab.equals("faq")) {%>
                 <font color="006633">FAQ</font> &nbsp;|&nbsp;
            <% } else { %>
                  <a href="/pl/?module=Static&d1=gccj05&d2=EN_faq">FAQ</a> &nbsp;|&nbsp;
            <% } %>

<%--
<!-- Advancers tab -->
            <% if (selectedTab.equals("advancers")) {%>
                 <font color="006633">Advancers</font> &nbsp;|&nbsp;
            <% } else { %>
                  <a href="/pl/?module=Static&d1=gccj05&d2=EN_advancers">Advancers</a> &nbsp;|&nbsp;
            <% } %>
--%>
<!-- Practice Arena  tab -->
            <% if (selectedTab.equals("arena")) {%>
                 <font color="006633">Competition Arena</font>
            <% } else { %>
                  <a href="/pl/?module=Static&d1=gccj05&d2=EN_arena">Competition Arena</a>
            <% } %>
</font>
