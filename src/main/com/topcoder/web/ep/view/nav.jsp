<%
    String user = request.getParameter("user") == null ? "" : request.getParameter("user");
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<% if (user.equals("professor")) {%>
<div id="navigation">
    <div>
         <ul>
<%--              <li><a href="javascript:arena();"<% if (node.equals("arena")) {%> class="on"<% } %>><span>Launch Arena</span></a></li>
              <li>|</li> --%>
              <li><a href="/education/"<% if (node.equals("home")) {%> class="on"<% } %>><span>Manage classes</span></a></li>
              <li>|</li>
              <li><a href="/education/reports/?module=Home"<% if (node.equals("reports")) {%> class="on"<% } %>><span>Reports</span></a></li>
              <li>|</li>
              <li><a href="#"<% if (node.equals("help")) {%> class="on"<% } %>><span>Help</span></a></li>
         </ul>
    </div>
</div>
<% } else { %>
<div id="navigation">
    <div>
         <ul>
              <li><a href="javascript:arena();"<% if (node.equals("arena")) {%> class="on"<% } %>><span>Launch Arena</span></a></li>
              <li>|</li>
              <li><a href="/education/"<% if (node.equals("home")) {%> class="on"<% } %>><span>Manage classes</span></a></li>
              <li>|</li>
              <li><a href="/education/reports/?module=Home"<% if (node.equals("reports")) {%> class="on"<% } %>><span>Status & Scores</span></a></li>
              <li>|</li>
              <li><a target="_blank" href="/wiki/pages/viewpageattachments.action?pageId=6259167"<% if (node.equals("help")) {%> class="on"<% } %>><span>Help</span></a></li>
         </ul>
    </div>
</div>
<% } %>
