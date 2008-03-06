<%
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<!-- menubar -->
<div id="menubar">
    <div id="nav">
        <ul>
            <li<% if (node.equals("home")) {%> class="active"<% } %>><a href="${sessionInfo.servletPath}" title="Home" onfocus="this.blur();">Home</a></li>
            <li<% if (node.equals("contests")) {%> class="active"<% } %>><a href="${sessionInfo.servletPath}?module=ViewActiveContests" title="Contests" onfocus="this.blur();">Contests</a></li>
            <li<% if (node.equals("forums")) {%> class="active"<% } %>><a href="/forums" title="Forums" onfocus="this.blur();">Forums</a></li>
            <li<% if (node.equals("myStudio")) {%> class="active"<% } %>><a href="${sessionInfo.servletPath}?module=MyStudioHome" title="My Studio" onfocus="this.blur();">My Studio</a></li>
            <li<% if (node.equals("support")) {%> class="active"<% } %>><a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=getStarted" title="Support" onfocus="this.blur();">Help</a></li>
            <li<% if (node.equals("contactUs")) {%> class="active_nobar"<% } else { %> class="nobar"<% } %>><a href="${sessionInfo.servletPath}?module=Static&amp;d1=contactUs" title="Contact Us" onfocus="this.blur();">Contact Us</a></li>
        </ul>
    </div>
</div>
