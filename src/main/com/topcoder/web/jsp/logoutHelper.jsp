<%@ page contentType="text/html"
         import="com.topcoder.web.common.BaseServlet" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% String next = request.getAttribute(BaseServlet.NEXT_PAGE_KEY)==null?"":(String)request.getAttribute(BaseServlet.NEXT_PAGE_KEY); %>
<html>
  <form method="GET" name="help" action="<%=next%>">
  </form>
  <body onload="document.help.submit();" />
</html>