<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
%>


<%if (nav.getLoggedIn()) { %>
<%@ include file="my_features.jsp" %>
<% } %>

