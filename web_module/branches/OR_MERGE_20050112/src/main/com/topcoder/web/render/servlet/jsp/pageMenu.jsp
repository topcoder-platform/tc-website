<%@ page session="true" errorPage="error.jsp" %>
<!-- Menu page for the TopCoder content management web application
     Written by John C. Bollinger
     Copyright 2002, TopCoder, Inc. -->
<!DOCTYPE html 
          PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>PageBuilder Page Menu</title>
    <jsp:include page="script.jsp" />
  </head>
  <body class="bodyText">
    <br/><p class="header">&#160;TopCoder <em>PageBuilder</em></p>
    &#160;&#160;<a class="MenuItem" href="/CmDispatch?page=newPage"
       target="workspaceFrame">New Page</a> |
    <a class="MenuItem" href="/CmDispatch?page=loadPage"
       target="workspaceFrame">Load Page</a> |
    <a class="MenuItem" href="/CmDispatch?page=editPage"
       target="workspaceFrame">Edit Page</a> |
    <a class="MenuItem" href="/CmDispatch?submit=preview"
       target="_new"          >Preview Page</a> :::
    <a class="MenuItem" href="/CmDispatch?page=newResource"
       target="workspaceFrame">New Resource</a> |
    <a class="MenuItem" href="/CmDispatch?page=loadResources"
       target="workspaceFrame">Load Resources</a> |
    <a class="MenuItem" href="/CmDispatch?page=selectResource"
       target="workspaceFrame">Edit Resources</a> |
    <a class="MenuItem" href="/CmDispatch?page=releaseResources"
       target="workspaceFrame">Release Resources</a> :::
    <a class="MenuItem" href="/CmDispatch?page=pageBuilder&submit=logout"
       target="_top">Log Out</a>
  </body>
</html>
