<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
  <head>
    <title>Technical Assessment</title>
  </head>
  <frameset cols="0,*">
    <frame name="clockFrame" src="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=CurrentTime" frameborder=0 noresize>
    <frame name="mainFrame" src="indexInner.jsp" frameborder=0 noresize>
  </frameset>
</html>
