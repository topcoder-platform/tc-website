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
<!-- release resources page for the TopCoder content management web application
     Written by John C. Bollinger
     Copyright 2002, TopCoder, Inc. -->
<!DOCTYPE html 
          PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Release Resources</title>
    <jsp:include page="script.jsp" />
  </head>
  <body>
    <h1 class="header">Release Resources</h1>
    <% String message = (String) request.getAttribute("message"); %>
    <%= (message == null) ? "" : ("<p class='notice'>" + message + "</p>") %>
    <p class="bodyText">
      On the form below, select the resources you want to release.  After
      you submit the form, those resources will no longer appear on your list
      of available resources. 
    </p>
    <form method="POST" action="/CmDispatch" target="workspaceFrame">
      <input type="hidden" name="page" value="releaseResources" />
      <table>
        <tr>
          <td>
            <select name="resources" size="<%= Math.min(25, state.getNumResources()) %>" multiple="yes">
              <%= CmFormHelperBean.optionList(state.getResources(), -1, true) %>
            </select>
          </td>
        </tr><tr>
          <td>
            <input type="submit" name="submit" value="Release Selected" />
            <input type="submit" name="submit" value="Release All" />
            <input type="reset" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
