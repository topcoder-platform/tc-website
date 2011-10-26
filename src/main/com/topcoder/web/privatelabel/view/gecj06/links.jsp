<%
    String selectedTab = request.getParameter("selectedTab") == null?"" : request.getParameter("selectedTab");
%>
<font size="-1">
<%-- Overview tab --%>
<% if (selectedTab.equals("overview")) {%>
<font color="006633">Overview</font> | 
<% } else { %>
<a href="/pl/?module=Static&d1=gecj06&d2=overview">Overview</a> | 
<% } %>
<%-- Schedule tab --%>
<% if (selectedTab.equals("schedule")) {%>
<font color="006633">Schedule</font> | 
<% } else { %>
<a href="/pl/?module=Static&d1=gecj06&d2=schedule">Schedule</a> | 
<% } %>

<%-- Rules tab --%>
<% if (selectedTab.equals("rules")) {%>
<font color="006633">Rules</font> | 
<% } else { %>
<a href="/pl/?module=Static&d1=gecj06&d2=rules">Rules</a> | 
<% } %>

<%-- Registration tab --%>
<%--
--%>
<% if (selectedTab.equals("registration")) {%>
<font color="006633">Registration</font> | 
<% } else { %>
<a href="/pl/?module=Static&d1=gecj06&d2=login">Registration</a> | 
<% } %>

<%-- Instructions tab --%>
<% if (selectedTab.equals("instructions")) {%>
<font color="006633">Instructions</font> | 
<% } else { %>
<a href="/pl/?module=Static&d1=gecj06&d2=instructions">Instructions</a> | 
<% } %>

<%-- FAQ tab --%>
<% if (selectedTab.equals("faq")) {%>
<font color="006633">FAQ</font> | 
<% } else { %>
<a href="/pl/?module=Static&d1=gecj06&d2=faq">FAQ</a> | 
<% } %>

<%-- Advancers tab--%>
<% if (selectedTab.equals("advancers")) {%>
<font color="006633">Advancers</font> | 
<% } else { %>
<a href="/pl/?module=Static&d1=gecj06&d2=advancers">Advancers</a> | 
<% } %>


<%-- Practice Arena  tab --%>
<% if (selectedTab.equals("arena")) {%>
<font color="006633">Competition Arena</font> | 
<% } else { %>
<a href="/pl/?module=Static&d1=gecj06&d2=arena">Competition Arena</a> | 
<% } %>

<%-- Google Groups  tab --%>
<% if (selectedTab.equals("forum")) {%>
<font color="006633">Code Jam Group</font>
<% } else { %>
<a href="/?t=sponsor&c=link&link=http://groups.google.com/group/Code-Jam-Europe" target="_blank">Code Jam Group</a>
<% } %>

</font>

<br><br>

<span class="bigRed"><A href="/pl/?module=Static&d1=gecj06&d2=advFinal" class="bigRed">Click here</A> to see the winners!</span>
