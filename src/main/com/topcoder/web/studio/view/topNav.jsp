<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<div id="topNav">
    <A<% if (node.equals("home")) {%> class="highlight"<% } %> href="/">Home</A>
    <A<% if (node.equals("contests")) {%> class="highlight"<% } %> href="/?module=ViewActiveContests">Contests</A>
    <A<% if (node.equals("forums")) {%> class="highlight"<% } %> href="/forums">Forums</A>
    <A<% if (node.equals("support")) {%> class="highlight"<% } %> href="/?module=Static&amp;d1=support&amp;d2=getStarted">Support</A>
    <A<% if (node.equals("contactUs")) {%> class="highlight"<% } %> href="/?module=Static&amp;d1=contactUs">Contact
        Us</A>
</div>
