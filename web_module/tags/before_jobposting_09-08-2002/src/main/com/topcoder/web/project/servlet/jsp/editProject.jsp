<%@ page import="java.util.*" %>
<%@ page import="com.topcoder.web.project.common.Project" %>
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
	String redirectURL = ProjectBean.getRedirectURL(params);
	if (redirectURL != null)
		response.sendRedirect(redirectURL);
	else
		errors = true;
}
%>

<html>
<head>
<title>Edit Project</title>
</head>

<body>
<% if (errors) { %>
<b>There were errors in your input or the data was not saved</b><p>
<% } %>
<%
String projectIdString = request.getParameter("projectId");
if (projectIdString != null) {
	HashMap projectStatuses = ProjectBean.getProjectStatuses();
	HashMap users = ProjectBean.getUsers();
	Object[] status_ids = projectStatuses.keySet().toArray();
	Arrays.sort(status_ids);
	Object[] user_ids = users.keySet().toArray();
	Arrays.sort(user_ids);
	if (projectIdString.equals("new")) {
		%>
<form action="" method=post>
Name: <input type=text name=projectname value=""><br>
Description: <input type=text name=projectdescription value=""><br>
Status: <select name="projectstatus">
<% for (int i = 0; i < status_ids.length; i++) { %>
<% String status_name = (String) projectStatuses.get(status_ids[i]); %>
<option value="<%= status_ids[i] %>"><%= status_name %>
<% } %>
</select>
<br>
Start Date: <input type=text name=startdate value="">(yyyy-mm-dd)<br>
Deadline: <input type=text name=deadline value="">(yyyy-mm-dd)<br>
Manager Notes: <textarea rows=10 cols=40 name=managernotes></textarea><br>
Manager Id: <select name="projectmanagerid">
<option value="">---not set---
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
	else {
		try {
			int projectId = Integer.parseInt(projectIdString);
			Project project = ProjectBean.getProject(projectId);
			if (project != null) {
				%>
<form action="" method=post>
Name: <input type=text name=projectname value="<%= project.getProjectName() %>"><br>
Description: <input type=text name=projectdescription value="<%= project.getProjectDescription() %>"><br>

Status: <select name="projectstatus">
<% String selected = ""; %>
<% for (int i = 0; i < status_ids.length; i++) { %>
<% String status_name = (String) projectStatuses.get(status_ids[i]); %>
<% if (((Integer)status_ids[i]).intValue() == project.getProjectStatus())
	selected = " selected";
   else
	selected = "";
%>
<option value="<%= status_ids[i] %>" <%= selected %>><%= status_name %>

<% } %>
</select>

<br>
Start Date: <input type=text name=startdate value="<%= project.getStartDate() %>">(yyyy-mm-dd)<br>
Deadline: <input type=text name=deadline value="<%= project.getDeadline() %>">(yyyy-mm-dd)<br>
Manager Notes: <textarea rows=10 cols=40 name=managernotes><%= project.getManagerNotes() %></textarea><br>
Manager Id: <select name="projectmanagerid">
<%
if (project.getProjectManagerId() == null)
	selected = " selected";
else
	selected = "";
%>
<option value="" <%= selected %>>---not set---
<% for (int i = 0; i < user_ids.length; i++) { %>
<% String user_name = (String) users.get(user_ids[i]); %>
<% if (project.getProjectManagerId() != null && ((Integer)user_ids[i]).intValue() == project.getProjectManagerId().intValue())
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
}
else {
	%>
No projectId specified
	<%
}
%>


</body>

</html>