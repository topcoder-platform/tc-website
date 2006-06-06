<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedTab = request.getParameter("selectedTab")==null?"":request.getParameter("selectedTab");
%>

<!-- Overview tab -->
            <% if (selectedTab.equals("overview")) {%>
                 Overview&#160;|&#160;
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_overview">Overview</a>&#160;|&#160;
            <% } %>
<!-- Rules tab -->
            <% if (selectedTab.equals("rules")) {%>
                 Rules&#160;|&#160;
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_rules">Rules</a>&#160;|&#160;
            <% } %>

<!-- Past Winners tab -->
            <% if (selectedTab.equals("past")) {%>
                 Past Winners&#160;|&#160;
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_pastWinners">Past Winners</a>&#160;|&#160;
            <% } %>

<!-- Registration tab -->
            <% if (selectedTab.equals("submit")) {%>
                 Submit Your Design<%--&#160;|&#160;--%>
            <% } else { %>
                  <a href="/tc?module=TCCC06LogoTerms">Submit Your Design</a><%--&#160;|&#160;--%>
            <% } %>

<!-- View Submissions tab -->
            <% if (selectedTab.equals("submissions")) {%>
                 View Submissions
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_submissions">View Submissions</a>
            <% } %>

<%-- 
&#160;|&#160;

<!-- Finalists tab -->
            <% if (selectedTab.equals("finalists")) {%>
                 Finalists
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_finalists">Finalists</a>
            <% } %>

&#160;|&#160;
<!-- Winners tab -->
            <% if (selectedTab.equals("winner")) {%>
                 Winner
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=logo_winner">Winner</a>
            <% } %>
<%--
--%>