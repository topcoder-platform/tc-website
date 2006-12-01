<%@ page import="com.topcoder.web.common.tag.HandleTag" %>
<% String type = request.getParameter("type");
if (type == null) type = HandleTag.COMPONENT;
type = type.trim().toLowerCase(); %>

<div style="float:left;">
<% String jsp = "/tc?module=ComponentRecordbook&c="  + (String)request.getAttribute("handle"); %>
<% if (type.equals(HandleTag.DESIGN)) { %>
Design | <a href="<%=jsp + "&type=" + HandleTag.DEVELOPMENT%>">Development</a> <% }
else if (type.equals(HandleTag.DEVELOPMENT)) { %>
<a href="<%=jsp + "&type=" + HandleTag.DESIGN%>">Design</a> | Development <% } %>
</div>