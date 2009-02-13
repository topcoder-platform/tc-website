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
    ProjectUserUpdate projectUserUpdate = new ProjectUserUpdate();
    String s_projectId = "" + htParams.get("projectId");

    if (pt_action == ACTION_NEW) {
        String s_projectUserUpdateId = "" + htParams.get("projectUserUpdateId");
        String s_projectUserId = "" + htParams.get("projectUserId");
        String s_projectTaskId = "" + htParams.get("projectTaskId");
        projectUserUpdate.setProject_user_update_id(0);
        projectUserUpdate.setProject_user_id(Integer.parseInt(s_projectUserId));
        projectUserUpdate.setProject_task_id(Integer.parseInt(s_projectTaskId));
        inEdit = true;
    }

    if (pt_action == ACTION_VIEW) {
        String s_projectUserUpdateId = "" + htParams.get("projectUserUpdateId");
        String s_projectUserId = "" + htParams.get("projectUserId");
        String s_projectTaskId = "" + htParams.get("projectTaskId");
        try {
                projectUserUpdate = ProjectBean.getProjectUserUpdateById(Integer.parseInt(s_projectUserUpdateId));
                invalid = (projectUserUpdate == null);
                inEdit = false;
                if (!invalid) {
                    projectUserUpdate.setProject_user_id(Integer.parseInt(s_projectUserId));
                    projectUserUpdate.setProject_task_id(Integer.parseInt(s_projectTaskId));
                }
        } catch (NumberFormatException nfe) {
                invalid = true;
        }
    }

    if (pt_action == ACTION_EDIT) {
        String s_projectUserUpdateId = "" + htParams.get("projectUserUpdateId");
        String s_projectUserId = "" + htParams.get("projectUserId");
        String s_projectTaskId = "" + htParams.get("projectTaskId");
        try {
                projectUserUpdate = ProjectBean.getProjectUserUpdateById(Integer.parseInt(s_projectUserUpdateId));
                invalid = (projectUserUpdate == null);
                inEdit = true;
                if (!invalid) {
                    projectUserUpdate.setProject_user_id(Integer.parseInt(s_projectUserId));
                    projectUserUpdate.setProject_task_id(Integer.parseInt(s_projectTaskId));
                }
        } catch (NumberFormatException nfe) {
                invalid = true;
        }
    }

    if (pt_action == ACTION_SAVE) {
        String s_projectUserUpdateId = "" + htParams.get("projectUserUpdateId");
        String s_projectUserId = "" + htParams.get("projectUserId");
        String s_projectTaskId = "" + htParams.get("projectTaskId");
        try {
            int projectUserUpdateId = Integer.parseInt(s_projectUserUpdateId);
            if (projectUserUpdateId == 0) {
                // Add new
                projectUserUpdate.setProject_user_update_id(0);
                projectUserUpdate.setProject_user_id(Integer.parseInt(s_projectUserId));
                projectUserUpdate.setProject_task_id(Integer.parseInt(s_projectTaskId));
            } else {
                // Update
                projectUserUpdate = ProjectBean.getProjectUserUpdateById(Integer.parseInt(s_projectUserUpdateId));
                invalid = (projectUserUpdate == null);
            }
        } catch (NumberFormatException nfe) {
                invalid = true;
        }
        if (!invalid) {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            // Get data from form and set projectUserUpdate
            String strValue = "";
            strValue = request.getParameter("taUpdateNotes");
            if (strValue != null && strValue.length() > 0) {
            projectUserUpdate.setUpdate_notes(strValue);
            }
            if (projectUserUpdate.getProject_user_update_id() == 0) {
                ProjectBean.addProjectUserUpdate(projectUserUpdate);
            } else {
                ProjectBean.saveProjectUserUpdate(projectUserUpdate);
            }
        }
    }

    if (pt_action == ACTION_CANCEL) {
        String s_projectUserUpdateId = "" + htParams.get("projectUserUpdateId");
        try {
                projectUserUpdate = ProjectBean.getProjectUserUpdateById(Integer.parseInt(s_projectUserUpdateId));
                invalid = (projectUserUpdate == null);
        } catch (NumberFormatException nfe) {
                invalid = true;
        }
    }
%>

<% if (invalid) { %> <SCRIPT Language="Javascript1.2">submitPage('<%= pt_vp %>', 'project_summary', '<%= ACTION_NONE %>', '[projectId=<%= s_projectId %>]');</SCRIPT> <% } %>

<DIV CLASS=box>
    <DIV CLASS=subheader>
            &nbsp;Project User Update Form
    </DIV>
</DIV>

<% if (invalid) { %>
    <DIV CLASS=content>
        - ProjectUserUpdate form has an invalid state.
    </DIV>
<% } else { %>

    <% if (inEdit) { %>
        <FORM NAME="frmProjectUserUpdate" ACTION="/ProjectCtxServlet" METHOD="POST">
        <TABLE WIDTH="<%= tableWidth %>">
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Update Notes</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><TEXTAREA ROWS=5 COLS=50 NAME="taUpdateNotes"><%= projectUserUpdate.getUpdate_notes() %></TEXTAREA></DIV></TD>
            </TR>
        </TABLE>
        <% pt_params = "[projectId=" + s_projectId + "][projectUserUpdateId=" + projectUserUpdate.getProject_user_update_id() + "][projectUserId=" + projectUserUpdate.getProject_user_id() + "][projectTaskId=" + projectUserUpdate.getProject_task_id() + "]"; %>
        <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
        <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectUserUpdate">
        <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_SAVE %>">
        <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
        <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Save">
        </FORM>
        <FORM NAME="frmProjectUserUpdate" ACTION="/ProjectCtxServlet" METHOD="POST">
                <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
                <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectUserUpdate">
                <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_CANCEL %>">
                <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
                <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Cancel">
        </FORM>
    <% } else { %>
        <TABLE WIDTH="<%= tableWidth %>">
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Modified Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= projectUserUpdate.getModify_date() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Update Notes</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= projectUserUpdate.getUpdate_notes() %></DIV></TD>
            </TR>
        </TABLE>
        <% pt_params = "[projectId=" + s_projectId + "][projectUserUpdateId=" + projectUserUpdate.getProject_user_update_id() + "][projectUserId=" + projectUserUpdate.getProject_user_id() + "][projectTaskId=" + projectUserUpdate.getProject_task_id() + "]"; %>
        <FORM NAME="frmProjectUserUpdate" ACTION="/ProjectCtxServlet" METHOD="POST">
                <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
                <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectUserUpdate">
                <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_EDIT %>">
                <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
                <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Edit">
        </FORM>
    <% } %>

<% } %>

</BODY>
</HTML>