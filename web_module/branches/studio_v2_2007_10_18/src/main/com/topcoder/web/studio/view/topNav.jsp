<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<!-- menubar -->
<div id="menubar">
    <div id="nav">
        <ul>
            <li<% if (node.equals("home")) {%> class="active"<% } %>><a href="/" title="Home">Home</a></li>
            <li<% if (node.equals("contests")) {%> class="active"<% } %>><a href="/?module=ViewActiveContests" title="Contests">Contests</a></li>
            <li<% if (node.equals("forums")) {%> class="active"<% } %>><a href="/forums" title="Forums">Forums</a></li>
            <li<% if (node.equals("myStudio")) {%> class="active"<% } %>><a href="/?module=MyStudioHome" title="My Studio">My Studio</a></li>
            <li<% if (node.equals("support")) {%> class="active"<% } %>><a href="/?module=Static&amp;d1=support&amp;d2=getStarted" title="Support">Support</a></li>
            <li class="nobar<% if (node.equals("contactUs")) {%> active<% } %>"><a href="/?module=Static&amp;d1=contactUs" title="Contact Us">Contact Us</a></li>
        </ul>
    </div>
</div>
