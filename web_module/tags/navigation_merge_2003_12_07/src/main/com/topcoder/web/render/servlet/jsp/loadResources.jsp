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
<!-- load resources page for the TopCoder content management web application
     Written by John C. Bollinger
     Copyright 2002, TopCoder, Inc. -->
<!DOCTYPE html 
          PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Load Resources</title>
    <jsp:include page="script.jsp" />
  </head>
  <body>
    <h1 class="header">Load Resources</h1>
    <% String message = (String) request.getAttribute("message"); %>
    <%= (message == null) ? "" : ("<p class='notice'>" + message + "</p>") %>
    <p class="bodyText">
      &#160;Fill out and submit the form below to locate resources (HTML fragments, images, etc) for use in the page.
    </p>
    <form method="POST" action="/CmDispatch" target="workspaceFrame">
      <input type="hidden" name="page" value="resourceHits" />
      <table>
        <!-- name, description, group -->
        <tr>
          <td class="bodyText" colspan="2" align="left">Select resources by</td>
        </tr><tr>
          <td class="bodyText" align="left">
            <input name="field" type="radio" value="name" checked="yes" />
            name:
          </td>
          <td><input name="name" type="text" size="50" maxlength="100" value="" /></td>
        </tr><tr>
          <td class="bodyText" align="left">
            <input name="field" type="radio" value="desc" />
            description:
          </td>
          <td><input name="desc" type="text" size="50" maxlength="50" value="" /></td>
        </tr><tr>
          <td class="bodyText" align="left">
            <input name="field" type="radio" value="group" />
            group:
          </td><td>
            <select name="group" >
              <%= CmFormHelperBean.optionList(state.getWebGroups(), 0, false, true) %>
            </select>
          </td>
        </tr><tr>
          <td colspan="2">
            <input type="submit" name="submit" value="Find Resources" />
            <input type="reset" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
