<%@ page import="java.util.*" %>
<%@ page import="com.topcoder.web.project.common.Project" %>
<jsp:useBean id="ProjectBean" class="com.topcoder.web.project.servlet.ProjectBean" scope="page" />

<%
	String redirectURL = "/ProjectCtxServlet";
	String projectIdString = request.getParameter("projectId");
	if (projectIdString != null) {
		try {
			int projectId = Integer.parseInt(projectIdString);
			if (ProjectBean.removeProject(projectId))
				response.sendRedirect(redirectURL);
		}
		catch (NumberFormatException nfe) {
		}
	}
%>

<html>
<head>
<title>Remove Project</title>
</head>
<body>
Remove project failed
</body>
</html>
