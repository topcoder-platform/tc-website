<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<div id="topNav">
    <A onfocus="this.blur();" <% if (node.equals("home")) {%> class="highlight"<% } %> href="/">Home</A>
    <A onfocus="this.blur();" <% if (node.equals("contests")) {%> class="highlight"<% } %> href="/?module=ViewActiveContests">Contests</A>
    <A onfocus="this.blur();" <% if (node.equals("forums")) {%> class="highlight"<% } %> href="/forums">Forums</A>
<%--
    <A onfocus="this.blur();" <% if (node.equals("myStudio")) {%> class="highlight"<% } %> href="/?module=MyStudioHome">My Studio</A>
--%>
    <A onfocus="this.blur();" <% if (node.equals("support")) {%> class="highlight"<% } %> href="/?module=Static&amp;d1=support&amp;d2=getStarted">Support</A>
    <A onfocus="this.blur();" <% if (node.equals("contactUs")) {%> class="highlight"<% } %> href="/?module=Static&amp;d1=contactUs">Contact Us</A>
</div>
