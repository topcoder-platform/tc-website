<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<%--
<div id="topNav">
    <a onfocus="this.blur();" <% if (node.equals("home")) {%> class="highlight"<% } %> href="/">Home</a>
    <a onfocus="this.blur();" <% if (node.equals("contests")) {%> class="highlight"<% } %> href="/?module=ViewActiveContests">Contests</a>
    <a onfocus="this.blur();" <% if (node.equals("forums")) {%> class="highlight"<% } %> href="/forums">Forums</a>
    <a onfocus="this.blur();" <% if (node.equals("myStudio")) {%> class="highlight"<% } %> href="/?module=MyStudioHome">My Studio</a>
    <a onfocus="this.blur();" <% if (node.equals("support")) {%> class="highlight"<% } %> href="/?module=Static&amp;d1=support&amp;d2=getStarted">Support</a>
    <a onfocus="this.blur();" <% if (node.equals("contactUs")) {%> class="highlight"<% } %> href="/?module=Static&amp;d1=contactUs">Contact Us</a>
</div>
--%>

<!-- menubar -->
<div id="menubar">
    <div id="nav">
        <ul>
            <li<% if (node.equals("home")) {%> class="active"<% } %>><a href="#" title="Home">Home</a></li>
            <li<% if (node.equals("contests")) {%> class="active"<% } %>><a href="#" title="Contests">Contests</a></li>
            <li<% if (node.equals("forums")) {%> class="active"<% } %>><a href="#" title="Forums">Forums</a></li>
            <li<% if (node.equals("myStudio")) {%> class="active"<% } %>><a href="#" title="My Studio">My Studio</a></li>
            <li<% if (node.equals("support")) {%> class="active"<% } %>><a href="#" title="Support">Support</a></li>
            <li<% if (node.equals("contactUs")) {%> class="active"<% } %> class="nobar"><a href="#" title="Contact Us">Contact Us</a></li>
        </ul>
    </div>
</div>
