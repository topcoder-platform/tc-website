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
<!-- new page page for the TopCoder content management web application
     Written by John C. Bollinger
     Copyright 2002, TopCoder, Inc. -->
<!DOCTYPE html 
          PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>New Web Page</title>
    <jsp:include page="script.jsp" />
  </head>
  <body class="bodyText">
    <h1 class="header">Create a New Web Page</h1>
    <% String message = (String) request.getAttribute("message"); %>
    <%= (message == null) ? "" : ("<p class='notice'>" + message + "</p>") %>
    <p class="bodyText">
      &#160;Enter the name of the file in which the page data will be stored and the
      absolute path to its directory in the form below.<br/>  
      &#160;Submit it to begin building a new web page.<strong><br/>
      &#160;NOTE: if you currently have a page loaded then any unsaved
      
      changes will be lost when you submit this form.</strong>
    </p>
    <form method="POST" action="/CmDispatch" target="workspaceFrame">
      <input type="hidden" name="page" value="editPage" />
      <table>
        <tr>
          <td class="bodyText">File Name:</td><td><input name="fname" type="text" size="50" maxlength="50" value="" />.jsp</td>
        </tr><tr>
          <td class="bodyText">O/S Path:</td><td><input name="fpath" type="text" size="50" maxlength="255" value="/" /></td>
        </tr><tr>
          <td class="bodyText">Web Site:</td>
          <td>
            <select name="site" size="">
              <%= CmFormHelperBean.optionList(state.getSites(), 0, false, true) %>
            </select>
          </td>
        </tr><tr>
          <td colspan="2" class="formButtons">
            <input type="submit" name="submit" value="Create Page" />
            <input type="reset" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
