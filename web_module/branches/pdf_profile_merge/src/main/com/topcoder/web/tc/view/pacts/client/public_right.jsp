<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
%>


<%if (nav.getLoggedIn()) { %>
<jsp:include page="my_features.jsp" />
<% } %>

