<%
    String user = request.getParameter("user") == null ? "" : request.getParameter("user");
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<% if (user.equals("professor")) {%>
<div id="navigation">
    <div>
         <ul>
              <li><a href="/ep/"<% if (node.equals("home")) {%> class="on"<% } %>><span>Administration</span></a></li>
              <li>|</li>
              <li><a href="#"<% if (node.equals("reports")) {%> class="on"<% } %>><span>Reports</span></a></li>
              <li>|</li>
              <li><a href="#"<% if (node.equals("")) {%> class="on"<% } %>><span>Help</span></a></li>
         </ul>
    </div>
</div>
<% } else { %>
<% } %>