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
<!-- select resource page for the TopCoder content management web application
     Written by John C. Bollinger
     Copyright 2002, TopCoder, Inc. -->
<!DOCTYPE html 
          PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Select Resource to Edit</title>
    <jsp:include page="script.jsp" />
  </head>
  <body class="bodyText">
    <% String message = (String) request.getAttribute("message"); %>
    <%= (message == null) ? "" : ("<p class='notice'>" + message + "</p>") %>
    <h1 class="header">Select Resource to Edit</h1>
    <p class="bodyText">
      Select the resource to edit.
    </p>
    <form method="POST" action="/CmDispatch" target="workspaceFrame">
      <input type="hidden" name="page" value="editResource" />
      <table>
        <tr>
          <td>
            <select name="selected" size="<%--= Math.min(state.numResourceHits(), 25) --%>">
              <%= CmFormHelperBean.optionList(state.getNonPageResources(), 0, true) %>
            </select>
          </td><td>
            <input type="submit" name="submit" value="Edit Resource" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
