<%@ page import="java.util.*" %>
<%@ page import="com.topcoder.web.project.common.*" %>
<jsp:useBean id="ProjectBean" class="com.topcoder.web.project.servlet.ProjectBean" scope="page" />

<%
	String redirectURL = "/ProjectCtxServlet";
	String projectTaskIdString = request.getParameter("projectTaskId");
	if (projectTaskIdString != null) {
		try {
			int projectTaskId = Integer.parseInt(projectTaskIdString);
			if (ProjectBean.removeProjectTask(projectTaskId))
				response.sendRedirect(redirectURL);
		}
		catch (NumberFormatException nfe) {
		}
	}
%>

<html>
<head>
<title>Remove Project Task</title>
</head>
<body>
Remove project task failed
</body>
</html>
