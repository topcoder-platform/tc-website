<HTML>
<HEAD>
<%@ include file="header.jsp" %>
</HEAD>

<%@ include file="stylesheet.jsp" %>
<%@ include file="body.jsp" %>
<%@ include file="nav.jsp" %>

<%
    boolean invalid = false;
    boolean inEdit = false;
    ProjectTask projectTask = new ProjectTask();
    String s_projectId = "" + htParams.get("projectId");
    String s_projectTaskId = "" + htParams.get("projectTaskId");
    
    if (pt_action == ACTION_NEW) {
        inEdit = true;
    }

    if (pt_action == ACTION_VIEW) {
        try {
            projectTask = ProjectBean.getProjectTaskById(Integer.parseInt(s_projectTaskId));
            invalid = (projectTask == null);
            inEdit = false;
        } catch (NumberFormatException nfe) {
            invalid = true;
        }
    }

    if (pt_action == ACTION_EDIT) {
        try {
            projectTask = ProjectBean.getProjectTaskById(Integer.parseInt(s_projectTaskId));
            invalid = (projectTask == null);
            inEdit = true;
        } catch (NumberFormatException nfe) {
            invalid = true;
        }
    }

    if (pt_action == ACTION_SAVE) {
        try {
            int projectTaskId = Integer.parseInt(s_projectTaskId);
            if (projectTaskId == 0) {
                // Add new
                projectTask.setProject_task_id(0);
            } else {
                // Update
                projectTask = ProjectBean.getProjectTaskById(Integer.parseInt(s_projectTaskId));
                invalid = (projectTask == null);
            }
        } catch (NumberFormatException nfe) {
                invalid = true;
        }
        if (!invalid) {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            // Get data from form and set project
            String strValue = "";
            strValue = request.getParameter("txtName");
            if (strValue != null && strValue.length() > 0) {
            projectTask.setName(strValue);
            }
            strValue = request.getParameter("taProjectTask_desc");
            if (strValue != null && strValue.length() > 0) {
            projectTask.setProject_task_desc(strValue);
            }
            strValue = request.getParameter("txtStart_date");
            if (strValue != null && strValue.length() > 0) {
            projectTask.setStart_date(df.parse(strValue));
            }
            strValue = request.getParameter("txtEnd_date");
            if (strValue != null && strValue.length() > 0) {
            projectTask.setEnd_date(df.parse(strValue));
            }
            strValue = request.getParameter("txtStatusId");
            if (strValue != null && strValue.length() > 0) {
            projectTask.setStatus_id(Integer.parseInt(strValue));
            }
            strValue = request.getParameter("txtCompletion_date");
            if (strValue != null && strValue.length() > 0) {
            projectTask.setCompletion_date(df.parse(strValue));
            }
            if (projectTask.getProject_task_id() == 0) {
                projectTask.setProject_id(Integer.parseInt(s_projectId));
                ProjectBean.addProjectTask(projectTask);
            } else {
                ProjectBean.saveProjectTask(projectTask);
            }
        }
    }

    if (pt_action == ACTION_CANCEL) {
        try {
            projectTask = ProjectBean.getProjectTaskById(Integer.parseInt(s_projectTaskId));
            invalid = (projectTask == null);
        } catch (NumberFormatException nfe) {
            invalid = true;
        }
    }
%>

<% if (invalid) { %> <SCRIPT Language="Javascript1.2">submitPage('<%= pt_vp %>', 'project_summary', '<%= ACTION_NONE %>', '[projectId=<%= s_projectId %>]');</SCRIPT> <% } %>

<DIV CLASS=box>
    <DIV CLASS=subheader>
            &nbsp;Project Task Form
    </DIV>
</DIV>

<% if (invalid) { %>
    <DIV CLASS=content>
        - Project Task form has an invalid state.
    </DIV>
<% } else { %>

    <% if (inEdit) { %>
        <FORM NAME="frmProjectTask" ACTION="/ProjectCtxServlet" METHOD="POST">
        <TABLE WIDTH="<%= tableWidth %>">
            <TR VALIGN="TOP">
                <TD WIDTH="150" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Name</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><INPUT TYPE="TEXT" NAME="txtName" SIZE="50" VALUE="<%= projectTask.getName() %>"></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Description</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><TEXTAREA ROWS=5 COLS=50 NAME="taProjectTask_desc"><%= projectTask.getProject_task_desc() %></TEXTAREA></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Start Date (yyyy-mm-dd)</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><INPUT TYPE="TEXT" NAME="txtStart_date" SIZE="50" VALUE="<%= projectTask.getStart_date() %>"></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Deadline (yyyy-mm-dd)</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><INPUT TYPE="TEXT" NAME="txtEnd_date" SIZE="50" VALUE="<%= projectTask.getEnd_date() %>"></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Status</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent>
                    <SELECT NAME="txtStatusId">
                    <% 
                        HashMap projectTaskStatuses = ProjectBean.getProjectTaskStatuses();
                        Iterator iter = projectTaskStatuses.keySet().iterator();
                        while (iter.hasNext()) {
                            String s_iter = "" + iter.next();
                    %>
                        <OPTION VALUE="<%= s_iter %>"<%= (("" + projectTask.getStatus_id()).equals(s_iter) ? " SELECTED" : "") %>><%= ProjectBean.getProjectTaskStatusString(Integer.parseInt(s_iter)) %>
                    <% } %>
                    </SELECT>
                </DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Completion Date (yyyy-mm-dd)</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><INPUT TYPE="TEXT" NAME="txtCompletion_date" SIZE="50" VALUE="<%= projectTask.getCompletion_date() %>"></DIV></TD>
            </TR>
        </TABLE>
        <% pt_params = "[projectId=" + s_projectId + "][projectTaskId=" + s_projectTaskId + "]"; %>
        <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
        <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectTask">
        <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_SAVE %>">
        <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
        <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Save">
        </FORM>
        <FORM NAME="frmProjectTask" ACTION="/ProjectCtxServlet" METHOD="POST">
                <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
                <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectTask">
                <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_CANCEL %>">
                <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
                <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Cancel">
        </FORM>
    <% } else { %>
        <TABLE WIDTH="<%= tableWidth %>">
            <TR VALIGN="TOP">
                <TD WIDTH="150" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Name</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= projectTask.getName() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Description</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= projectTask.getProject_task_desc() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Start Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= projectTask.getStart_date() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Deadline</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= projectTask.getEnd_date() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Status</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= ProjectBean.getProjectTaskStatusString(projectTask.getStatus_id()) %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Creation Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= projectTask.getCreation_date() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Modified On Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= projectTask.getModify_date() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Completion Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= projectTask.getCompletion_date() %></DIV></TD>
            </TR>
        </TABLE>
        <% if (groups.indexOf("[1]") > -1 || groups.indexOf("[2]") > -1 || ProjectBean.getUserId(ProjectBean.getProjectById(projectTask.getProject_id()).getTech_lead()) == user_id) { %>
        <% pt_params = "[projectId=" + s_projectId + "][projectTaskId=" + s_projectTaskId + "]"; %>
        <FORM NAME="frmProjectTask" ACTION="/ProjectCtxServlet" METHOD="POST">
                <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
                <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectTask">
                <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_EDIT %>">
                <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
                <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Edit">
        </FORM>
        <% } %>
    <% } %>

<% } %>

</BODY>
</HTML>