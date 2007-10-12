<%
    String user = request.getParameter("user") == null ? "" : request.getParameter("user");
    String node = request.getParameter("node") == null ? "" : request.getParameter("node");
%>

<% if (user.equals("professor")) {%>
<div id="navigation">
    <div>
         <ul>
              <li><a href="javascript:arena();"<% if (node.equals("arena")) {%> class="on"<% } %>><span>Launch arena</span></a></li>
              <li>|</li>
              <li><a href="/ep/"<% if (node.equals("home")) {%> class="on"<% } %>><span>Administration</span></a></li>
              <li>|</li>
              <li><a href="/ep/?module=Static&amp;d1=reports&amp;d2=selectClassroom"<% if (node.equals("reports")) {%> class="on"<% } %>><span>Reports</span></a></li>
              <li>|</li>
              <li><a href="#"<% if (node.equals("")) {%> class="on"<% } %>><span>Help</span></a></li>
         </ul>
    </div>
</div>
<% } else { %>
<% } %>