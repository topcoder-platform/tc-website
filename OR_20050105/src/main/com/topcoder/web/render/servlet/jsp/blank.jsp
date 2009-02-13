<%@ page errorPage="error.jsp" %>
<!-- blank (default workspace) page for the TopCoder content management web application
     Written by John C. Bollinger
     Copyright 2002, TopCoder, Inc. -->
<!DOCTYPE html 
          PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Blank</title>
  </head>
  <body>
    <% String message = (String) request.getAttribute("message"); %>
    <%= (message == null) ? "" : ("<p class='notice'>" + message + "</p>") %>
  </body>
</html>
