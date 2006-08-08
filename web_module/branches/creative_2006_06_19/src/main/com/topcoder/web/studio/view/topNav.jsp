<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<div id="topNav">
    <A href="/"<% if (node.equals("home")) {%> class="highlight"<% } %>>Home</A>
    <A href="/?module=ViewActiveContests"<% if (node.equals("contests")) {%> class="highlight"<% } %>>Contests</A>
    <A href="/forums"<% if (node.equals("forums")) {%> class="highlight"<% } %>>Forums</A>
    <A href="/?module=Static&d1=support&d2=getStarted"<% if (node.equals("support")) {%> class="highlight"<% } %>>Support</A>
    <A href="/?module=Static&d1=about"<% if (node.equals("about_us")) {%> class="highlight"<% } %>>About Us</A>
</div>
