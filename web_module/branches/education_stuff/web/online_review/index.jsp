<%@ include file="includes/session.jsp" %>
<%
    if (securityEnabledUser == null) response.sendRedirect("login.jsp");
    else response.sendRedirect("viewOpenProjects.do");
%>