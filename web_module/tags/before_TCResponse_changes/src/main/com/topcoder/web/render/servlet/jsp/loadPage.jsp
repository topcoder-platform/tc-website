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
    <title>Load a Web Page</title>
    <jsp:include page="script.jsp" />
  </head>
  <body class="bodyText">
    <h1 class="header">Load a Web Page</h1>
    <% String message = (String) request.getAttribute("message"); %>
    <%= (message == null) ? "" : ("<p class='notice'>" + message + "</p>") %>
    <p class="bodyText">
      &#160;Fill out and submit the form below to locate the page to edit.<br/>
      &#160;Items left blank match any page.
    </p>
    <form method="POST" action="/CmDispatch" target="workspaceFrame">
      <input type="hidden" name="page" value="pageHits" />
      <table>
        <tr>
          <td class="bodyText">search string:</td>
          <td class="bodyText"><input name="target" type="text" size="50" maxlength="255" value="" /></td>
        </tr><tr>
          <td class="bodyText">field to search:</td>
          <td class="bodyText">
            <input name="field" type="radio" value="pname" checked="yes" />page name<br />
            <input name="field" type="radio" value="title" />page title<br />
            <input name="field" type="radio" value="fname" />file name<br />
            <input name="field" type="radio" value="link" />link<br />
          </td>
        </tr><tr>
          <td colspan="2">
            <input type="submit" name="submit" value="Find Page" />
            <input type="reset" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
