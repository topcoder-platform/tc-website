<%@ page import="com.topcoder.web.render.bean.CmStateBean" session="true" errorPage="error.jsp" %>
<%@ page import="com.topcoder.web.render.bean.CmFormHelperBean" %>
<jsp:useBean id="state" scope="session" class="com.topcoder.web.render.bean.CmStateBean" />
<%
   if (request.getAttribute("dispatched") == null) {
      request.setAttribute("message", "Use the navigation controls");
%>
   <jsp:forward page="blank.jsp" />
<% } 
   if ( ! state.isAuthenticated() ) {
      request.setAttribute("message", "You must log in to use PageBuilder");
%>
   <jsp:forward page="login.jsp" />
<% } %>
<!-- select page page for the TopCoder content management web application
     Written by John C. Bollinger
     Copyright 2002, TopCoder, Inc. -->
<!DOCTYPE html 
          PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Matching Pages</title>
  </head>
  <body>
    <h1>Matching Pages</h1>
    <p class="pageInstructions">
      Select the page to load.
    </p>
    <form method="POST" action="/CmDispatch" target="workspaceFrame">
      <input type="hidden" name="page" value="editPage" />
      <table>
        <tr>
          <td>
            <select name="selected" size="<%-- <%= Math.min(state.getNumPageHits(), 25) %> --%>">
              <%= CmFormHelperBean.optionList(state.getPageHits(), 0, true) %>
            </select>
          </td><td>
            <input type="submit" name="submit" value="Load Page" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
