<%@ page session="true" errorPage="error.jsp" %>
<%-- force a reasonable timeout for new sessions --%>
<% if ( session.isNew() ) session.setMaxInactiveInterval(1800); %>
<%-- instantiate the state bean and bind it into the session --%>
<jsp:useBean id="state" scope="session" class="com.topcoder.web.render.bean.CmStateBean" />
<!-- Frameset definition for the TopCoder content management web application
     Written by John C. Bollinger
     Copyright 2002, TopCoder, Inc. -->
<!DOCTYPE html 
          PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN"
          "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>TopCoder PageBuilder</title>
  </head>
  <frameset id="pbFrameSet" rows="15%, *" >
    <frame name="pageMenuFrame" src="/CmDispatch?page=pageMenu"
           noresize="true" frameborder="0" marginwidth="0" marginheight="0" />
    <frame name="workspaceFrame" src='/CmDispatch?page=<%=state.isAuthenticated()?"blank":"login"%>'
           noresize="true" frameborder="0" marginwidth="0" marginheight="0" />
    <noframes>
      <h1 id="noFramesTitle">Oops!</h1>
      <p class="errorExpl">
        PageBuilder requires support for frames by your browser.  Either your
        browser does not support frames, or it is configured to not display
        them.  PageBuilder cannot continue.
      </p>
    </noframes>
  </frameset>
</html>
