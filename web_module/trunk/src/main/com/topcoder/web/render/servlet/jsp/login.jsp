<%@ page session="true" errorPage="error.jsp" %>
<jsp:useBean id="state" scope="session" class="com.topcoder.web.render.bean.CmStateBean" />
<!-- login page for the TopCoder content management web application
     Written by John C. Bollinger
     Copyright 2002, TopCoder, Inc. -->
<!DOCTYPE html 
          PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Login to PageBuilder</title>
    <jsp:include page="script.jsp" />
  </head>
  <body class="bodyText">
    <% String message = (String) request.getAttribute("message"); %>
    <%= (message == null) ? "" : ("<p class='notice'>" + message + "</p>") %>
    <form method="POST" action="/CmDispatch" target="workspaceFrame">
      <input type="hidden" name="page" value="blank" />
      <table class="layoutTable" id="loginLayout">
        <tr>
          <th class="bodyText">Handle:</th>
          <td><input type="text" name="handle" size="15" /></td>
        </tr><tr>
          <th class="bodyText">Password:</th>
          <td><input type="password" name="password" size="15" /></td>
        </tr><tr>
          <td colspan="2" class="formButtons"><input type="submit"
            name="submit" value="login" /></td>
        </tr>
      </table>
    </form>
  </body>
</html>
