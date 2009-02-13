<HTML>
<HEAD>
<%@ include file="header.jsp" %>
</HEAD>

<%@ include file="stylesheet.jsp" %>
<%@ include file="body.jsp" %>
<%@ include file="nav.jsp" %>

<%
	// Get key from params
	String s_projectId = "" + htParams.get("projectId");
	Project project = new Project();
	boolean invalid = false;

	try {
		project = ProjectBean.getProjectById(Integer.parseInt(s_projectId));
		invalid = (project == null);
	} catch (NumberFormatException nfe) {
		invalid = true;
	}
%>

<% if (invalid) { %> <SCRIPT Language="Javascript1.2">submitPage('<%= pt_vp %>', 'project_list', '<%= ACTION_NONE %>', '');</SCRIPT> <% } %>

<DIV CLASS=box><DIV CLASS=subheader>&nbsp;Project</DIV></DIV>
<TABLE WIDTH="<%= tableWidth %>">
    <TR VALIGN="TOP">
        <TD WIDTH="100" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Name</DIV></TD>
        <TD><DIV CLASS=mcontent>
            <% nav_generic.setLink(pt_vp, "project", ACTION_VIEW, "[projectId=" + project.getProject_id() + "]"); %>
            <%= nav_generic.displayLink(project.getName()) %>
        </DIV></TD>
    </TR>
    <TR VALIGN="TOP">
        <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Description</DIV></TD>
        <TD><DIV CLASS=mcontent><%= project.getProject_desc() %></DIV></TD>
    </TR>
    <TR VALIGN="TOP">
        <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Tech Lead</DIV></TD>
        <TD><DIV CLASS=mcontent><%= (project.getTech_lead() > 0 ? ProjectBean.getUserString(new Integer(ProjectBean.getUserId(project.getTech_lead()))) : "unassigned") %></DIV></TD>
    </TR>
    <TR VALIGN="TOP">
        <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Start Date</DIV></TD>
        <TD><DIV CLASS=mcontent><%= project.getStart_date() %></DIV></TD>
    </TR>
    <TR VALIGN="TOP">
        <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Deadline</DIV></TD>
        <TD><DIV CLASS=mcontent><%= project.getDeadline_date() %></DIV></TD>
    </TR>
    <TR VALIGN="TOP">
        <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Status</DIV></TD>
        <TD><DIV CLASS=mcontent><%= ProjectBean.getProjectStatusString(project.getStatus_id()) %></DIV></TD>
    </TR>
</TABLE>

<BR>

<% if (groups.indexOf("[1]") > -1 || groups.indexOf("[2]") > -1) { %>
<DIV CLASS=box><DIV CLASS=subheader>&nbsp;Project Updates</DIV></DIV>
<DIV CLASS=mcontent>
<%
int projectUserId = ProjectBean.getProjectUserId(user_id, project.getProject_id(), pt_vp);

ArrayList projectUpdateList = new ArrayList();
projectUpdateList = ProjectBean.getProjectUserUpdates(project.getProject_id());
%>
<% if (groups.indexOf("[2]") > -1) { %>
<% nav_generic.setLink(pt_vp, "projectUserUpdate", ACTION_NEW, "[projectId=" + project.getProject_id() + "][projectUserUpdateId=0][projectUserId=" + projectUserId + "][projectTaskId=0]"); %>
<%= nav_generic.displayLink("Add Project Update") %>
<% } %>
<TABLE WIDTH="<%= tableWidth %>" BORDER=0>
        <TR VALIGN="TOP">
            <TD WIDTH="15" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>DATE</DIV></TD>
            <TD WIDTH="15%" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent><NOBR>UPDATED BY</NOBR></DIV></TD>
            <TD WIDTH="70%" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent><NOBR>UPDATE NOTES</NOBR></DIV></TD>
        </TR>
<%
for (int id = 0; id < projectUpdateList.size(); id++) {
	ProjectUserUpdate projectUserUpdate = (ProjectUserUpdate) projectUpdateList.get(id);
%>
        <TR VALIGN="TOP">
            <TD>
                <DIV CLASS=mcontent>
                    <% nav_generic.setLink(pt_vp, "projectUserUpdate", ACTION_VIEW, "[projectId=" + project.getProject_id() + "][projectUserUpdateId=" + projectUserUpdate.getProject_user_update_id() + "][projectUserId=" + projectUserId + "][projectTaskId=0]"); %>
                    <NOBR>
                        <%= nav_generic.displayLink("" + projectUserUpdate.getModify_date()) %>
                    </NOBR>
                </DIV>
            </TD>
            <TD>
                <DIV CLASS=content>
                    <NOBR><%= ProjectBean.getUserString(new Integer(ProjectBean.getUserId(projectUserUpdate.getProject_user_id()))) %></NOBR>
                </DIV>
            </TD>
            <TD>
                <DIV CLASS=mcontent>
                    <%= projectUserUpdate.getUpdate_notes() %>
                </DIV>
            </TD>
        </TR>
<% } %>
</TABLE>
</DIV>

<BR>
<% }%>

<DIV CLASS=box><DIV CLASS=subheader>&nbsp;Project Users</DIV></DIV>
<DIV CLASS=mcontent>
<% if (groups.indexOf("[1]") > -1 || groups.indexOf("[2]") > -1) { %>
<% nav_generic.setLink(pt_vp, "projectUser", ACTION_NEW, "[projectId=" + project.getProject_id() + "][projectUserId=0]"); %>
<%= nav_generic.displayLink("Add Project User") %>
<% } %>
<TABLE>
    <TR>
        <TD WIDTH="100" BGCOLOR="#CCCCEE">
            <DIV CLASS=mcontent>Manager(s)&nbsp;</DIV>
        </TD>
        <TD>
            <DIV CLASS=mcontent>
                <% Integer projectManagers[] = ProjectBean.getProjectUserIds(project.getProject_id(), ProjectBean.ROLE_MANAGER); %>
                <% if (projectManagers.length == 0) { out.println("Not assigned"); } else { 
                    for (int m=0; m < projectManagers.length; m++) { %>
                        <% nav_generic.setLink(pt_vp, "message_write", ACTION_MESSAGE_WRITE, "[toUserId=" + ProjectBean.getUserId(projectManagers[m].intValue()) + "]"); %>
                        <NOBR>
                        <%= nav_generic.displayLink(ProjectBean.getUserString(new Integer(ProjectBean.getUserId(projectManagers[m].intValue())))) %>
                        </NOBR>
                    <% } %>
                <% } %>
            </DIV>
        </TD>
    </TR>
    <TR>
        <TD WIDTH="100" BGCOLOR="#CCCCEE">
            <DIV CLASS=mcontent>Developer(s)&nbsp;</DIV>
        </TD>
        <TD>
            <DIV CLASS=mcontent>
                <% Integer projectDevelopers[] = ProjectBean.getProjectUserIds(project.getProject_id(), ProjectBean.ROLE_DEVELOPER); %>
                <% if (projectDevelopers.length == 0) { out.println("Not assigned"); } else { 
                    for (int m=0; m < projectDevelopers.length; m++) { %>
                        <% nav_generic.setLink(pt_vp, "message_write", ACTION_MESSAGE_WRITE, "[toUserId=" + ProjectBean.getUserId(projectDevelopers[m].intValue()) + "]"); %>
                        <NOBR>
                        <%= nav_generic.displayLink(ProjectBean.getUserString(new Integer(ProjectBean.getUserId(projectDevelopers[m].intValue())))) %>
                        </NOBR>
                    <% } %>
                <% } %>
            </DIV>
        </TD>
    </TR>
</TABLE>
</DIV>

<BR>

<DIV CLASS=box><DIV CLASS=subheader>&nbsp;Project Tasks</DIV></DIV>
<DIV CLASS=mcontent>
<%
ArrayList alTasks = ProjectBean.getProjectTasks(project.getProject_id(), 0);
%>
<% if (groups.indexOf("[1]") > -1 || groups.indexOf("[2]") > -1 || ProjectBean.getUserId(project.getTech_lead()) == user_id) { %>
<% nav_generic.setLink(pt_vp, "projectTask", ACTION_NEW, "[projectId=" + project.getProject_id() + "][projectTaskId=0]"); %>
<%= nav_generic.displayLink("Add Project Task") %>
<% } %>
<TABLE WIDTH="<%= tableWidth %>" BORDER=0>
        <TR VALIGN="TOP">
            <TD WIDTH="20%" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>NAME</DIV></TD>
            <TD WIDTH="50%" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent><NOBR>DESCRIPTION</NOBR></DIV></TD>
            <TD WIDTH="15%" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent><NOBR>DEADLINE</NOBR></DIV></TD>
            <TD WIDTH="15%" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent><NOBR>STATUS</NOBR></DIV></TD>
        </TR>
<%
for (int id = 0; id < alTasks.size(); id++) {
	ProjectTask projectTask = (ProjectTask) alTasks.get(id);
%>
        <TR VALIGN="TOP">
            <TD>
                <DIV CLASS=mcontent>
                    <% nav_generic.setLink(pt_vp, "projectTask_summary", ACTION_VIEW, "[projectId=" + project.getProject_id() + "][projectTaskId=" + projectTask.getProject_task_id() + "]"); %>
                    <NOBR>
                        <%= nav_generic.displayLink("" + projectTask.getName()) %>
                    </NOBR>
                </DIV>
            </TD>
            <TD>
                <DIV CLASS=mcontent>
                    <%= projectTask.getProject_task_desc() %>
                </DIV>
            </TD>
            <TD>
                <DIV CLASS=mcontent>
                    <NOBR><%= projectTask.getEnd_date() %></NOBR>
                </DIV>
            </TD>
            <TD>
                <DIV CLASS=mcontent>
                    <NOBR><%= ProjectBean.getProjectTaskStatusString(projectTask.getStatus_id()) %></NOBR>
                </DIV>
            </TD>
        </TR>
<% } %>
</TABLE>

</DIV>

<BR>

<DIV CLASS=box><DIV CLASS=subheader>&nbsp;Project Issues</DIV></DIV>
<DIV CLASS=mcontent>
<%
ArrayList alIssues = ProjectBean.getProjectIssues(project.getProject_id());
%>
<% nav_generic.setLink(pt_vp, "projectIssue", ACTION_NEW, "[projectId=" + project.getProject_id() + "][projectIssueId=0]"); %>
<%= nav_generic.displayLink("Add Project Issue") %>
<TABLE WIDTH="<%= tableWidth %>" BORDER=0>
        <TR VALIGN="TOP">
            <TD WIDTH="20%" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Open Date</DIV></TD>
            <TD WIDTH="50%" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent><NOBR>ISSUE TEXT</NOBR></DIV></TD>
        </TR>
<%
for (int id = 0; id < alIssues.size(); id++) {
	ProjectIssue projectIssue = (ProjectIssue) alIssues.get(id);
%>
        <TR VALIGN="TOP">
            <TD>
                <DIV CLASS=mcontent>
                    <% nav_generic.setLink(pt_vp, "projectIssue", ACTION_VIEW, "[projectId=" + project.getProject_id() + "][projectIssueId=" + projectIssue.getProject_issue_id() + "]"); %>
                    <NOBR>
                        <%= nav_generic.displayLink("" + projectIssue.getOpen_date()) %>
                    </NOBR>
                </DIV>
            </TD>
            <TD>
                <DIV CLASS=mcontent>
                    <%= projectIssue.getIssue_text() %>
                </DIV>
            </TD>
        </TR>
<% } %>
</TABLE>

</DIV>

</BODY>
</HTML>
