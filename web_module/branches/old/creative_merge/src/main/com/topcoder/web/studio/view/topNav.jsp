<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<div id="topNav">
    <A<% if (node.equals("home")) {%> class="highlight"<% } %> href="/">Home</A>
    <A<% if (node.equals("contests")) {%> class="highlight"<% } %> href="/?module=ViewActiveContests">Contests</A>
    <A<% if (node.equals("forums")) {%> class="highlight"<% } %> href="/forums">Forums</A>
    <A<% if (node.equals("support")) {%> class="highlight"<% } %> href="/?module=Static&d1=support&d2=getStarted">Support</A>
    <A<% if (node.equals("about_us")) {%> class="highlight"<% } %> href="/?module=Static&d1=about">About Us</A>
</div>
