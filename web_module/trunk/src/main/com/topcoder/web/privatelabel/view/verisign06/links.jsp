<%@ page import="com.topcoder.web.privatelabel.Constants"%>
<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
%>

<div class="mainNav" align="left" valign="middle">
<!-- Overview tab -->
            <% if (selectedTab.equals("overview")) {%>
                 Overview <img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } else { %>
                  <a class="whiteNav" href="/pl/?module=Static&d1=verisign06&d2=overview">Overview</a> <img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } %>

<!-- Schedule tab -->
            <% if (selectedTab.equals("schedule")) {%>
                 Schedule <img border="0" width="20" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } else { %>
                  <a class="whiteNav" href="/pl/?module=Static&d1=verisign06&d2=schedule">Schedule</a> <img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } %>

<!-- Rules tab -->
            <% if (selectedTab.equals("rules")) {%>
                 Rules <img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } else { %>
                  <a class="whiteNav" href="/pl/?module=Static&d1=verisign06&d2=rules">Rules</a> <img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } %>

<!-- Registration tab -->
<%--

            <% if (selectedTab.equals("registration")) {%>
                 Registration<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } else { %>
                  <a href="/pl/?module=Static&d1=verisign06&d2=reg_closed">Registration</a> <img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } %>
--%>

<!-- Instructions tab -->
            <% if (selectedTab.equals("instructions")) {%>
                 Instructions <img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } else { %>
                  <a class="whiteNav" href="/pl/?module=Static&d1=verisign06&d2=instructions">Instructions</a> <img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } %>

<!-- FAQ tab -->
            <% if (selectedTab.equals("faq")) {%>
                 FAQ <img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } else { %>
                  <a class="whiteNav" href="/pl/?module=Static&d1=verisign06&d2=faq">FAQ</a> <img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } %>

<!-- Advancers tab -->
            <% if (selectedTab.equals("advancers")) {%>
                 Advancers <img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } else { %>
                  <a class="whiteNav" href="/pl/?module=Static&d1=verisign06&d2=advancers">Advancers</a> <img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />|<img border="0" width="20" height="1" src="/i/events/verisign06/spacer.gif" />
            <% } %>
            

<!-- Practice Arena  tab -->
            <% if (selectedTab.equals("arena")) {%>
                 Competition Arena
            <% } else { %>
                  <a class="whiteNav" href="/pl/?module=Static&d1=verisign06&d2=arena">Competition Arena</a> 
            <% } %>

</div>