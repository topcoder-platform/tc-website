<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.topcoder.web.project.common.*" %>
<jsp:useBean id="ProjectBean" class="com.topcoder.web.project.servlet.ProjectBean" scope="page" />

<%
boolean errors = false;
if (request.getParameter("submit") != null) {
	//	Unsupported?  Oh well, create a map
	//	Map params = request.getParameterMap();
	HashMap params = new HashMap();
	Enumeration paramNames = request.getParameterNames();
	while (paramNames.hasMoreElements()) {
		String param = (String) paramNames.nextElement();
		params.put(param, request.getParameter(param));
	}
	String redirectURL = ProjectBean.getTaskRedirectURL(params);
	if (redirectURL != null)
		response.sendRedirect(redirectURL);
	else
		errors = true;
}
%>

<html>
<head>
<title>Edit Project Task</title>
</head>

<body>
<% if (errors) { %>
<b>There were errors in your input or the data was not saved</b><p>
<% } %>
<%
String projectTaskIdString = request.getParameter("projectTaskId");
if (projectTaskIdString != null) {
	HashMap taskStatuses = ProjectBean.getProjectTaskStatuses();
	HashMap users = ProjectBean.getUsers();
	Object[] status_ids = taskStatuses.keySet().toArray();
	Arrays.sort(status_ids);
	Object[] user_ids = users.keySet().toArray();
	Arrays.sort(user_ids);
	if (projectTaskIdString.equals("new")) {
		String projectIdString = request.getParameter("projectId");
		if (projectIdString != null) {
			try {
				int projectId = Integer.parseInt(projectIdString);
%>
<form action="" method=post>
Name: <input type=text name=projecttaskname value=""><br>
Description: <input type=text name=projecttaskdescription value=""><br>
Status: <select name="projecttaskstatus">
<% for (int i = 0; i < status_ids.length; i++) { %>
<% String status_name = (String) taskStatuses.get(status_ids[i]); %>
<option value="<%= status_ids[i] %>"><%= status_name %>
<% } %>
</select>
<br>
<% Date newdate = new Date(); %>
<% DateFormat df = new SimpleDateFormat("yyyy-MM-dd"); %>
Start Date: <input type=text name=startdate value="<%= df.format(newdate) %>">(yyyy-mm-dd)<br>
Deadline: <input type=text name=deadline value="<%= df.format(newdate) %>">(yyyy-mm-dd)<br>
Percent Complete: <input type=text size=3 name=percentcomplete value="0"><br>
Milestone: <input type=checkbox name=ismilestone value="yes"><br>
Developer Notes: <textarea rows=10 cols=40 name=developernotes></textarea><br>
Developer Id: <select name="projectdeveloperid">
<%--
<option value="">---not set---
--%>
<% for (int i = 0; i < user_ids.length; i++) { %>
<% String user_name = (String) users.get(user_ids[i]); %>
<option value="<%= user_ids[i] %>"><%= user_name %>
<% } %>
</select>
<br>
<input type=submit name=submit value=submit>
</form>
<%
			}
			catch (NumberFormatException nfe) {
%>
ProjectId invalid format
<%
			}
		}
		else {
%>
ProjectId was null
<%
		}
	}
	else {
		try {
			int projectTaskId = Integer.parseInt(projectTaskIdString);
			ProjectTask projectTask = ProjectBean.getProjectTask(projectTaskId);
			if (projectTask != null) {
				%>
<form action="" method=post>
Name: <input type=text name=projecttaskname value="<%= projectTask.getRefName() %>"><br>
Description: <input type=text name=projecttaskdescription value="<%= projectTask.getDescription() %>"><br>

Status: <select name="projecttaskstatus">
<% String selected = ""; %>
<% for (int i = 0; i < status_ids.length; i++) { %>
<% String status_name = (String) taskStatuses.get(status_ids[i]); %>
<% if (((Integer)status_ids[i]).intValue() == projectTask.getProjectTaskStatus())
	selected = " selected";
   else
	selected = "";
%>
<option value="<%= status_ids[i] %>" <%= selected %>><%= status_name %>

<% } %>
</select>

<br>
Start Date: <input type=text name=startdate value="<%= projectTask.getTaskStartDate() %>">(yyyy-mm-dd)<br>
Deadline: <input type=text name=deadline value="<%= projectTask.getTaskDeadline() %>">(yyyy-mm-dd)<br>
Percent Complete: <input type=text size=3 name=percentcomplete value="<%= projectTask.getPercentComplete() %>"><br>
<%
String checked = "";
if (projectTask.getIsMilestone()) checked = "checked";
%>
Milestone: <input type=checkbox name=ismilestone value="yes" <%= checked %> ><br>
Developer Notes: <textarea rows=10 cols=40 name=developernotes><%= projectTask.getDeveloperNotes() %></textarea><br>
Developer Id: <select name="projectdeveloperid">
<%
if (projectTask.getAssignedToTCDeveloper() == null)
	selected = " selected";
else
	selected = "";
%>
<%--
<option value="" <%= selected %>>---not set---
--%>
<% for (int i = 0; i < user_ids.length; i++) { %>
<% String user_name = (String) users.get(user_ids[i]); %>
<% if (projectTask.getAssignedToTCDeveloper() != null && ((Integer)user_ids[i]).intValue() == projectTask.getAssignedToTCDeveloper().intValue())
        selected = " selected";
   else
        selected = "";
%>
<option value="<%= user_ids[i] %>" <%= selected %>><%= user_name %>
<% } %>
</select>
<br>
<input type=submit name=submit value=submit>
</form>
				<%
			}
			else {
				%>
Project with id <%= projectTaskId %> not found
				<%
			}
		}
		catch (NumberFormatException nfe) {
			%>
Invalid projectTaskId format
			<%
		}
	}
}
else {
	%>
No projectTaskId specified
	<%
}
%>


</body>

</html>