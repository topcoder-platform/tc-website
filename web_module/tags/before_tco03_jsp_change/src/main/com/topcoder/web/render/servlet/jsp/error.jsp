<%@ page isErrorPage="true" %>
<!-- error page for the TopCoder content management web application
     Written by John C. Bollinger
     Copyright 2002, TopCoder, Inc. -->
<!DOCTYPE html 
          PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Error</title>
  </head>
  <body>
    <p class="notice">
      Your command could not be executed because of an internal error.  If
      this problem persists then contact a system administrator for assistance.
    </p>
    <p class="notice">
      Information about this error:
    </p>
    <% exception.printStackTrace(new PrintWriter(out)); %>
  </body>
</html>
