<%@ page import="com.topcoder.web.common.tag.HandleTag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% String type = request.getParameter("type");
if (type == null) type = HandleTag.COMPONENT;
type = type.trim().toLowerCase(); %>

<% String jsp = "/tc?module=ComponentRecordbook&c="  + (String)request.getAttribute("handle"); %>
<% if (type.equals(HandleTag.DESIGN)) { %>
Design | <a href="<%=jsp + "&type=" + HandleTag.DEVELOPMENT%>">Development</a> | <a href="<%=jsp + "&type=" + HandleTag.COMPONENT%>">Overall</a> <% }
else if (type.equals(HandleTag.DEVELOPMENT)) { %>
<a href="<%=jsp + "&type=" + HandleTag.DESIGN%>">Design</a> | Development | <a href="<%=jsp + "&type=" + HandleTag.COMPONENT%>">Overall</a> <% }
else if (type.equals(HandleTag.COMPONENT)) { %>
<a href="<%=jsp + "&type=" + HandleTag.DESIGN%>">Design</a> | <a href="<%=jsp + "&type=" + HandleTag.DEVELOPMENT%>">Development</a> | Overall <% } %>
</html>
