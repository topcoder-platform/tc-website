<%@ page import="com.topcoder.web.project.common.*" %>
<jsp:useBean id="ProjectBean" class="com.topcoder.web.project.servlet.ProjectBean" scope="page" />

<html>
<head>
<title>View Project</title>
</head>

<body>

<%
String projectIdString = request.getParameter("projectId");
if (projectIdString != null) {
	try {
		int projectId = Integer.parseInt(projectIdString);
		Project project = ProjectBean.getProject(projectId);
		if (project != null) {
			%>
<a href="/editProject.jsp?projectId=<%= projectIdString %>">Edit</a><br>
<%
int[] taskIds = ProjectBean.getProjectTaskIds(projectId);
int[] updateIds = ProjectBean.getProjectUpdateIds(projectId);
if ((taskIds == null || taskIds.length == 0) &&
    (updateIds == null || updateIds.length == 0)) {
%>
<a href="/removeProject.jsp?projectId=<%= projectIdString %>">Remove</a><br>
<% } %>
Name: <%= project.getProjectName() %><br>
Description: <%= project.getProjectDescription() %><br>
Status: <%= project.getProjectStatus() %><br>
Status: <%= ProjectBean.getProjectStatusString(project.getProjectStatus()) %><br>
Start Date: <%= project.getStartDate() %><br>
Deadline: <%= project.getDeadline() %><br>
Manager Notes: <%= project.getManagerNotes() %><br>
<%
	String projectManagerString = "not set";
	if (project.getProjectManagerId() != null)
		projectManagerString = ProjectBean.getUserString(project.getProjectManagerId().intValue());
%>
Manager Id: <%= projectManagerString %><br>
<br>
<%
if (updateIds != null) {
%>
<table border=1 cellpadding=0 cellspacing=0>
<%
	for (int i = 0; i < updateIds.length; i++) {
		ProjectUpdate update = ProjectBean.getProjectUpdate(updateIds[i]);
		if (update != null) {
%>
<tr>
<td><%= update.getUpdatedOnDateAtTime() %></td>
<td><%= ProjectBean.getUserString(update.getUpdatedByManager()) %></td>
<td><%= update.getUpdateNotes() %></td>
</tr>
<%			
		}
	}
%>
</table>
<% } %>
<br>
Project Tasks:<br>
<br>
<a href="/editProjectTask.jsp?projectId=<%= projectId %>&projectTaskId=new">Create new task</a><br>
<br>
<%
if (taskIds != null) {
	for (int i = 0; i < taskIds.length; i++) {
		ProjectTask task = ProjectBean.getProjectTask(taskIds[i]);
		if (task != null) {
%>
<a href="/editProjectTask.jsp?projectId=<%= projectId %>&projectTaskId=<%= task.getProjectTask() %>">Edit task</a><br>
<a href="/removeProjectTask.jsp?projectId=<%= projectId %>&projectTaskId=<%= task.getProjectTask() %>">Remove task</a><br>
Task name: <%= task.getRefName() %><br>
Description: <%= task.getDescription() %><br>
Start date: <%= task.getTaskStartDate() %><br>
Deadline: <%= task.getTaskDeadline() %><br>
Status: <%= ProjectBean.getProjectTaskStatusString(task.getProjectTaskStatus()) %><br>
Percent Complete: <%= task.getPercentComplete() %><br>
Milestone: <%= task.getIsMilestone() %><br>
Completion Date: <%= task.getCompletedOnDate() %><br>
<%
String developer = "---not set---";
if (task.getAssignedToTCDeveloper() != null)
	developer = ProjectBean.getUserString(task.getAssignedToTCDeveloper().intValue());
%>
Developer: <%= developer %><br>
Dev Notes: <%= task.getDeveloperNotes() %><br>
<br>
<%
		}
	}
}
%>

			<%
		}
		else {
			%>
Project with id <%= projectId %> not found
			<%
		}
	}
	catch (NumberFormatException nfe) {
		%>
Invalid projectId format
		<%
	}
}
else {
	%>
No projectId specified
	<%
}
%>


</body>

</html>