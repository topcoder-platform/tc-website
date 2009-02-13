<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<!-- menubar -->
<div id="menubar">
    <div id="nav">
        <ul>
            <li<% if (node.equals("home")) {%> class="active"<% } %>><a href="/" title="Home" onfocus="this.blur();">Home</a></li>
            <li<% if (node.equals("contests")) {%> class="active"<% } %>><a href="/?module=ViewActiveContests" title="Contests" onfocus="this.blur();">Contests</a></li>
            <li<% if (node.equals("digitalrun")) {%> class="active"<% } %>><a href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=home" title="Contests" onfocus="this.blur();">Studio Cup</a></li>
            <li<% if (node.equals("forums")) {%> class="active"<% } %>><a href="/forums" title="Forums" onfocus="this.blur();">Forums</a></li>
            <li<% if (node.equals("myStudio")) {%> class="active"<% } %>><a href="/?module=MyStudioHome" title="My Studio" onfocus="this.blur();">My Studio</a></li>
            <li<% if (node.equals("support")) {%> class="active"<% } %>><a href="/?module=Static&amp;d1=support&amp;d2=getStarted" title="Support" onfocus="this.blur();">Help</a></li>
            <li<% if (node.equals("contactUs")) {%> class="active_nobar"<% } else { %> class="nobar"<% } %>><a href="/?module=Static&amp;d1=contactUs" title="Contact Us" onfocus="this.blur();">Contact Us</a></li>
        </ul>
    </div>
</div>
