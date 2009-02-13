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
	String s_projectTaskId = "" + htParams.get("projectTaskId");
	ProjectTask projectTask = new ProjectTask();
	boolean invalid = false;

	try {
		projectTask = ProjectBean.getProjectTaskById(Integer.parseInt(s_projectTaskId));
		invalid = (projectTask == null);
	} catch (NumberFormatException nfe) {
		invalid = true;
	}
%>

<% if (invalid) { %> <SCRIPT Language="Javascript1.2">submitPage('<%= pt_vp %>', 'project_summary', '<%= ACTION_NONE %>', '[projectId=<%= s_projectId %>]');</SCRIPT> <% } %>

<DIV CLASS=box><DIV CLASS=subheader>&nbsp;Project Task</DIV></DIV>
<TABLE WIDTH="<%= tableWidth %>">
    <TR VALIGN="TOP">
        <TD WIDTH="100" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Name</DIV></TD>
        <TD><DIV CLASS=mcontent>
            <% nav_generic.setLink(pt_vp, "projectTask", ACTION_VIEW, "[projectId=" + s_projectId + "][projectTaskId=" + projectTask.getProject_task_id() + "]"); %>
            <%= nav_generic.displayLink(projectTask.getName()) %>
        </DIV></TD>
    </TR>
    <TR VALIGN="TOP">
        <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Description</DIV></TD>
        <TD><DIV CLASS=mcontent><%= projectTask.getProject_task_desc() %></DIV></TD>
    </TR>
    <TR VALIGN="TOP">
        <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Start Date</DIV></TD>
        <TD><DIV CLASS=mcontent><%= projectTask.getStart_date() %></DIV></TD>
    </TR>
    <TR VALIGN="TOP">
        <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Deadline</DIV></TD>
        <TD><DIV CLASS=mcontent><%= projectTask.getEnd_date() %></DIV></TD>
    </TR>
    <TR VALIGN="TOP">
        <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Status</DIV></TD>
        <TD><DIV CLASS=mcontent><%= ProjectBean.getProjectTaskStatusString(projectTask.getStatus_id()) %></DIV></TD>
    </TR>
</TABLE>

<BR>

<DIV CLASS=box><DIV CLASS=subheader>&nbsp;Project Task Updates</DIV></DIV>
<DIV CLASS=mcontent>
<%
int projectUserId = ProjectBean.getProjectUserId(user_id, projectTask.getProject_id(), pt_vp);

ArrayList projectTaskUpdateList = new ArrayList();
projectTaskUpdateList = ProjectBean.getProjectUserUpdates(projectTask.getProject_id(), projectTask.getProject_task_id());
%>
<% nav_generic.setLink(pt_vp, "projectUserUpdate", ACTION_NEW, "[projectId=" + projectTask.getProject_id() + "][projectTaskId=" + projectTask.getProject_id() + "][projectUserUpdateId=0][projectUserId=" + projectUserId + "][projectTaskId=" + projectTask.getProject_task_id() + "]"); %>
<%= nav_generic.displayLink("Add Project Update") %>
<TABLE WIDTH="<%= tableWidth %>" BORDER=0>
        <TR VALIGN="TOP">
            <TD WIDTH="15" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>DATE</DIV></TD>
            <TD WIDTH="15%" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent><NOBR>UPDATED BY</NOBR></DIV></TD>
            <TD WIDTH="70%" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent><NOBR>UPDATE NOTES</NOBR></DIV></TD>
        </TR>
<%
for (int id = 0; id < projectTaskUpdateList.size(); id++) {
	ProjectUserUpdate projectUserUpdate = (ProjectUserUpdate) projectTaskUpdateList.get(id);
%>
        <TR VALIGN="TOP">
            <TD>
                <DIV CLASS=mcontent>
                    <% nav_generic.setLink(pt_vp, "projectUserUpdate", ACTION_VIEW, "[projectId=" + projectTask.getProject_id() + "][projectTaskId=" + projectTask.getProject_id() + "][projectUserUpdateId=" + projectUserUpdate.getProject_user_update_id() + "][projectUserId=" + projectUserId + "][projectTaskId=0]"); %>
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

<DIV CLASS=box><DIV CLASS=subheader>&nbsp;Project Task Users</DIV></DIV>
<DIV CLASS=mcontent>
<% if (groups.indexOf("[1]") > -1 || groups.indexOf("[2]") > -1 || ProjectBean.getUserId(ProjectBean.getProjectById(projectTask.getProject_id()).getTech_lead()) == user_id) { %>
<% nav_generic.setLink(pt_vp, "projectUserTask", ACTION_NEW, "[projectId=" + projectTask.getProject_id() + "][projectTaskId=" + projectTask.getProject_task_id() + "][projectUserId=0]"); %>
<%= nav_generic.displayLink("Add Project User") %>
<% } %>
<TABLE>
    <TR>
        <TD WIDTH="100" BGCOLOR="#CCCCEE">
            <DIV CLASS=mcontent>Developer(s)&nbsp;</DIV>
        </TD>
        <TD>
            <DIV CLASS=mcontent>
                <% 
                    ArrayList alTaskDevelopers = ProjectBean.getProjectUserTasks(projectTask.getProject_task_id());
                    if (alTaskDevelopers.size() == 0) { out.println("Not assigned"); } else { 
                    ProjectUserTask put = null;
                    for (int m=0; m < alTaskDevelopers.size(); m++) {
                        put = (ProjectUserTask)alTaskDevelopers.get(m);
                %>
                        <% nav_generic.setLink(pt_vp, "message_write", ACTION_MESSAGE_WRITE, "[toUserId=" + ProjectBean.getUserId(put.getProject_user_id()) + "]"); %>
                        <NOBR>
                        <%= nav_generic.displayLink(ProjectBean.getUserString(new Integer(ProjectBean.getUserId(put.getProject_user_id())))) %> (<%= put.getAssign_date() %>)
                        </NOBR>
                    <% } %>
                <% } %>
            </DIV>
        </TD>
    </TR>
</TABLE>
</DIV>

<BR>

</BODY>
</HTML>
