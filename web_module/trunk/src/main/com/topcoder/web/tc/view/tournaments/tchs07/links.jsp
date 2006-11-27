<%
    String selectedTab = request.getParameter("selectedTab") == null ? "" : request.getParameter("selectedTab");
%>
<div align="left"">
    <!-- Overview tab -->
    <% if (selectedTab.equals("overview")) {%>
    <span class="leftNavOn">Overview</span><br>
          <img src="images/nav_ruleOn.gif"  style="padding: 0px 0px 5px 101px;" border="0" alt="" /><br>
    <% } else { %>
    <span class="leftNavOff"><A class="navLink" href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview">Overview</a></span><br>
          <img src="images/nav_ruleOff.gif"  style="padding: 0px 0px 5px 101px;" border="0" alt="" /><br>
    <% } %>

    <!-- Schedule tab -->
    <% if (selectedTab.equals("schedule")) {%>
    <span class="leftNavOn">Schedule</span><br>
          <img src="images/nav_ruleOn.gif"  style="padding: 0px 0px 5px 101px;" border="0" alt="" /><br>
    <% } else { %>
    <span class="leftNavOff"><a class="navLink" href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=schedule">Schedule</a></span><br>
          <img src="images/nav_ruleOff.gif"  style="padding: 0px 0px 5px 101px;" border="0" alt="" /><br>
    <% } %>

    <!-- Rules tab -->
    <% if (selectedTab.equals("rules")) {%>
    <span class="leftNavOn">Rules</span><br>
          <img src="images/nav_ruleOn.gif"  style="padding: 0px 0px 5px 101px;" border="0" alt="" /><br>
    <% } else { %>
    <span class="leftNavOff"><a class="navLink" href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=rules">Rules</a></span><br>
          <img src="images/nav_ruleOff.gif"  style="padding: 0px 0px 5px 101px;" border="0" alt="" /><br>
    <% } %>

    <!-- Sponsors tab -->
    <% if (selectedTab.equals("sponsors")) {%>
    <span class="leftNavOn">Sponsors</span><br>
          <img src="images/nav_ruleOn.gif"  style="padding: 0px 0px 5px 101px;" border="0" alt="" /><br>
    <% } else { %>
    <span class="leftNavOff"><a class="navLink" href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview">Rules</a></span><br>
          <img src="images/nav_ruleOff.gif"  style="padding: 0px 0px 5px 101px;" border="0" alt="" /><br>
    <% } %>

    <!-- Purdue tab -->
    <% if (selectedTab.equals("purdue")) {%>
    <span class="leftNavOn">Purdue</span><br>
          <img src="images/nav_ruleOn.gif"  style="padding: 0px 0px 5px 101px;" border="0" alt="" /><br>
    <% } else { %>
    <a class="navLink" href="/tc?module=Static&d1=tournaments&d2=tchs07&d3=overview">Rules</a></span><br>
          <img src="images/nav_ruleOff.gif"  style="padding: 0px 0px 5px 101px;" border="0" alt="" /><br>
    <% } %>
</div>
