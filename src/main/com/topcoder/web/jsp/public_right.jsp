<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
%>


<%
   Navigation nav = (Navigation) session.getAttribute ( "navigation" );
   if ( nav == null ) nav = new Navigation();
   if (nav.getLoggedIn()) {
 %>
<jsp:include page="my_features.jsp" />
<% } %>

