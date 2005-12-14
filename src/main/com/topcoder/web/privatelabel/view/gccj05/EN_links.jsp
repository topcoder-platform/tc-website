<%@ page contentType="text/html;charset=utf-8" %>
<%
    String selectedTab = request.getParameter("selectedTab") == null ? "" : request.getParameter("selectedTab");
%>

<font size="-1">
<!-- Overview tab -->
<% if (selectedTab.equals("overview")) {%>
<font color="006633">Overview</font>&#160;|&#160;
<% } else { %>
<a href="/pl/?module=Static&d1=gccj05&d2=EN_overview">Overview</a>&#160;|&#160;
<% } %>

<!-- Schedule tab -->
<% if (selectedTab.equals("schedule")) {%>
<font color="006633">Schedule</font>&#160;|&#160;
<% } else { %>
<a href="/pl/?module=Static&d1=gccj05&d2=EN_schedule">Schedule</a>&#160;|&#160;
<% } %>

<!-- Rules tab -->
<% if (selectedTab.equals("rules")) {%>
<font color="006633">Rules</font>&#160;|&#160;
<% } else { %>
<a href="/pl/?module=Static&d1=gccj05&d2=EN_rules">Rules</a>&#160;|&#160;
<% } %>

<!-- Registration tab -->
<%--
<% if (selectedTab.equals("registration")) {%>
<font color="006633">Registration</font>&#160;|&#160;
<% } else { %>
<a href="/pl/?module=Static&d1=gccj05&d2=EN_login">Registration</a>&#160;|&#160;
<a href="/pl/?module=Static&d1=gccj05&d2=EN_reg_closed">Registration</a>&#160;|&#160;
<% } %>
--%>

<!-- Instructions tab -->
<% if (selectedTab.equals("instructions")) {%>
<font color="006633">Instructions</font>&#160;|&#160;
<% } else { %>
<a href="/pl/?module=Static&d1=gccj05&d2=EN_instructions">Instructions</a>&#160;|&#160;
<% } %>

<!-- FAQ tab -->
<% if (selectedTab.equals("faq")) {%>
<font color="006633">FAQ</font>&#160;|&#160;
<% } else { %>
<a href="/pl/?module=Static&d1=gccj05&d2=EN_faq">FAQ</a>&#160;|&#160;
<% } %>

<%--
--%>
<!-- Advancers tab -->
<% if (selectedTab.equals("advancers")) {%>
<font color="006633">Advancers</font>&#160;|&#160;
<% } else { %>
<a href="/pl/?module=Static&d1=gccj05&d2=EN_advancers">Advancers</a>&#160;|&#160;
<% } %>

<!-- Practice Arena  tab -->
<% if (selectedTab.equals("arena")) {%>
<font color="006633">Competition Arena</font>&#160;|&#160;
<% } else { %>
<a href="/pl/?module=Static&d1=gccj05&d2=EN_arena">Competition Arena</a>&#160;|&#160;
<% } %>

<!-- Google Groups  tab -->
<% if (selectedTab.equals("forum")) {%>
<font color="006633">Code Jam China Group</font>
<% } else { %>
<a href="/?t=sponsor&c=link&link=http://groups.google.com/group/China-Code-Jam" target="_blank">Code Jam China Group</a>
<% } %>
</font>
