<%@ page import="com.topcoder.web.codinginterface.techassess.Constants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
  <head>
    <title>Technical Assessment</title>
  </head>
  <frameset cols="0,*">
    <frame name="clockFrame" src="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=?module=Static&d1=clockFrame" frameborder=0 noresize>
    <frame name="mainFrame" src="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=<%=Constants.RP_VIEW_PROBLEM_SET_INNER%>&<%=Constants.MESSAGE_ID%>=<%=request.getParameter(Constants.MESSAGE_ID)%>&<%=Constants.PROBLEM_TYPE_ID%>=<%=request.getParameter(Constants.PROBLEM_TYPE_ID)%>" frameborder=0 noresize>
  </frameset>
</html>