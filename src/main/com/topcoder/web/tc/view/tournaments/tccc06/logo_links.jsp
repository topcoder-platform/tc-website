<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
%>

<!-- Overview tab -->
            <% if (selectedTab.equals("overview")) {%>
                 Overview | 
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_overview">Overview</a> | 
            <% } %>
<!-- Rules tab -->
            <% if (selectedTab.equals("rules")) {%>
                 Rules | 
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_rules">Rules</a> | 
            <% } %>

<!-- Past Winners tab -->
            <% if (selectedTab.equals("past")) {%>
                 Past Winners | 
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_pastWinners">Past Winners</a> | 
            <% } %>

<!-- Registration tab -->
<%-- 
            <% if (selectedTab.equals("submit")) {%>
                 Submit Your Design | 
            <% } else { %>
                  <a href="/tc?module=TCCC06LogoTerms">Submit Your Design</a> | 
            <% } %>
--%>

<!-- View Submissions tab -->
            <% if (selectedTab.equals("submissions")) {%>
                 View Submissions |
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_submissions_6">View Submissions</a> |
            <% } %>
 

<!-- Finalists tab -->
            <% if (selectedTab.equals("finalists")) {%>
                 Finalists 
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_finalists">Finalists</a> 
            <% } %>
|
<!-- Winners tab -->
            <% if (selectedTab.equals("winner")) {%>
                 Winner
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_winner">Winner</a>
            <% } %>
<%--
--%>
