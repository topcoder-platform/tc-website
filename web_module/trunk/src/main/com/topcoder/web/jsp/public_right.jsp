<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation"
%>


<%
   Navigation nav = (Navigation) session.getAttribute ( "navigation" );
   if ( nav == null ) nav = new Navigation();
   if (nav.getLoggedIn()) {
 %>
<jsp:include page="my_features.jsp" />
<% } %>

