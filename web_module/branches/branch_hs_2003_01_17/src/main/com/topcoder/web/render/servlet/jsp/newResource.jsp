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
    <title>New Resource</title>
    <jsp:include page="script.jsp" />
  </head>
  <body>
    <h1 class="header">New Resource</h1>
    <p class="bodyText">
      Fill out and submit the form below to create and load a new resource.
    </p>
    <% String message = (String) request.getAttribute("message"); %>
    <%= (message == null) ? "" : ("<p class='notice'>" + message + "</p>") %>
    <form method="POST" action="/CmDispatch" target="workspaceFrame">
      <input type="hidden" name="page" value="newResource" />
      <table>
        <tr>
          <td class="bodyText" colspan="2" align="left">-- For Any Resource --</td>
        </tr><tr>
          <td class="bodyText">Name:</td>
          <td><input type="text" name="name" size="50" maxlength="50" value="" /></td>
        </tr><tr>
          <td class="bodyText">Description:</td>
          <td><input type="text" name="desc" size="50" maxlength="50" value="" /></td>
        </tr><tr>
          <td class="bodyText" colspan="2" align="left">-- For a File Resource --</td>
        </tr><tr>
          <td class="bodyText">System:</td>
          <td><input type="text" name="system" size="25" maxlength="25" value="" /></td>
        </tr><tr>
          <td class="bodyText">Path:</td>
          <td><input type="text" name="path" size="50" maxlength="255" value="" /></td>
        </tr><tr>
          <td class="bodyText">Link:</td>
          <td><input type="text" name="link" size="50" maxlength="255" value="" /></td>
        </tr><tr>
          <td class="bodyText">Status:</td>
          <td><input type="text" name="status" size="1" maxlength="1" value=" " /></td>
        </tr><tr>
          <td class="bodyText">(for image files)</td>
          <td></td>
        </tr><tr>
          <td class="bodyText">Height:</td>
          <td><input type="text" name="height" size="5" maxlength="5" value="0" /></td>
        </tr><tr>
          <td class="bodyText">Width:</td>
          <td><input type="text" name="width" size="5" maxlength="5" value="0" /></td>
        </tr><tr>
          <td colspan="2">
            <input type="hidden" name="language" value="EN" />
            <input type="hidden" name="country" value="840" />
            <input type="submit" name="submit" value="Create File Resource" />
            <input type="reset" />
          </td>
        </tr><tr>
          <td class="bodyText" colspan="2" align="left">-- For a Stored Content Resource --</td>
        </tr><tr>
          <td class="bodyText">group:</td>
          <td>
            <select name="group" size="">
              <%= CmFormHelperBean.optionList(state.getWebGroups(), 0, false) %>
            </select>
          </td>
        </tr><tr>
          <td class="bodyText">status:</td>
          <td>
            <select name="statusInx" size="">
              <%= CmFormHelperBean.optionList(state.getStatuses(), 0, false) %>
            </select>
          </td>
        </tr><tr>
          <td colspan="2">
            <textarea name="content" rows="15" cols="80">
&lt;!-- Enter content here --&gt;
            </textarea>
          </td>
        </tr><tr>
          <td colspan="2">
            <input type="submit" name="submit" value="Create Stored Content Resource" />
            <input type="reset" />
          </td>
        </tr>
      </table>
    </form>
  </body>
</html>
