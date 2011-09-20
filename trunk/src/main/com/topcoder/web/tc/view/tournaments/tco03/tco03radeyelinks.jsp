<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%
    String selectedRound = request.getParameter("selectedRound")==null?"":request.getParameter("selectedRound");
%>

<font size="-1">
<!-- round1 tab -->
            <% if (selectedRound.equals("round1")) {%>
                 Round 1&nbsp;|&nbsp; 
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_radeye_rd1">Round 1</a>&nbsp;|&nbsp; 
            <% } %>

<!-- round2 tab -->
            <% if (selectedRound.equals("round2")) {%>
                 Round 2&nbsp;|&nbsp; 
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_radeye_rd2">Round 2</a>&nbsp;|&nbsp; 
            <% } %>

<!-- round3 -->
            <% if (selectedRound.equals("round3")) {%>
                 Round 3&nbsp;|&nbsp;
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_radeye_rd3">Round 3</a>&nbsp;|&nbsp; 
            <% } %>

<!-- round4 -->
            <% if (selectedRound.equals("round4")) {%>
                 Round 4&nbsp;|&nbsp; 
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_radeye_rd4">Round 4</a>&nbsp;|&nbsp; 
            <% } %>

<!-- round4 -->
            <% if (selectedRound.equals("semi")) {%>
                 Semifinals&nbsp;|&nbsp;
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_radeye_semi">Semifinals</a>&nbsp;|&nbsp; 
            <% } %>

<!-- round4 -->
            <% if (selectedRound.equals("finals")) {%>
                 Finals 
            <% } else { %>
                  <a href="/tc?module=Static&d1=tournaments&d2=tco03&d3=tco03_radeye_finals">Finals</a> 
            <% } %>
</font>