<%@ page import="com.topcoder.web.privatelabel.Constants"%>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
%>
<table align="left" cellspacing="0" cellpadding="0" valign="top" width="760">
<tr>
<td>
<!-- Overview tab -->
            <% if (selectedTab.equals("overview")) {%>
                 <img border="0" width="97" height="20" src="/i/events/verisign06/tabs/tabOn_overview.gif" />
            <% } else { %>
                  <a href="/pl/?module=Static&d1=verisign06&d2=overview"><img border="0" width="97" height="20" src="/i/events/verisign06/tabs/tab_overview.gif" /></a>
            <% } %>
</td>
<td>
<!-- Schedule tab -->
            <% if (selectedTab.equals("schedule")) {%>
                 <img border="0" width="106" height="20" src="/i/events/verisign06/tabs/tabOn_schedule.gif" />
            <% } else { %>
                  <a href="/pl/?module=Static&d1=verisign06&d2=schedule"><img border="0" width="106" height="20" src="/i/events/verisign06/tabs/tab_schedule.gif" /></a>
            <% } %>
</td>
<td>
<!-- Rules tab -->
            <% if (selectedTab.equals("rules")) {%>
                 <img border="0" width="88" height="20" src="/i/events/verisign06/tabs/tabOn_rules.gif" />
            <% } else { %>
                  <a href="/pl/?module=Static&d1=verisign06&d2=rules"><img border="0" width="88" height="20" src="/i/events/verisign06/tabs/tab_rules.gif" /></a>
            <% } %>
</td>
<td>
<!-- Instructions tab -->
            <% if (selectedTab.equals("instructions")) {%>
                 <img border="0" width="121" height="20" src="/i/events/verisign06/tabs/tabOn_instructions.gif" />
            <% } else { %>
                  <a href="/pl/?module=Static&d1=verisign06&d2=instructions"><img border="0" width="121" height="20" src="/i/events/verisign06/tabs/tab_instructions.gif" /></a>
            <% } %>
</td>
<td>
<!-- FAQ tab -->
            <% if (selectedTab.equals("faq")) {%>
                 <img border="0" width="80" height="20" src="/i/events/verisign06/tabs/tabOn_faq.gif" />
            <% } else { %>
                  <a href="/pl/?module=Static&d1=verisign06&d2=faq"><img border="0" width="80" height="20" src="/i/events/verisign06/tabs/tab_faq.gif" /></a>
            <% } %>
</td>
<td>
<!-- Advancers tab -->
            <% if (selectedTab.equals("advancers")) {%>
                 <img border="0" width="114" height="20" src="/i/events/verisign06/tabs/tabOn_advancers.gif" />
            <% } else { %>
                  <a href="/pl/?module=Static&d1=verisign06&d2=advancers"><img border="0" width="114" height="20" src="/i/events/verisign06/tabs/tab_advancers.gif" /></a> 
            <% } %>
</td>
<td>
<!-- Practice Arena  tab -->
            <% if (selectedTab.equals("arena")) {%>
                 <img border="0" width="154" height="20" src="/i/events/verisign06/tabs/tabOn_arena.gif" />
            <% } else { %>
                  <a href="/pl/?module=Static&d1=verisign06&d2=arena"><img border="0" width="154" height="20" src="/i/events/verisign06/tabs/tab_arena.gif" /></a> 
            <% } %>
</td>
</tr>
</table>
