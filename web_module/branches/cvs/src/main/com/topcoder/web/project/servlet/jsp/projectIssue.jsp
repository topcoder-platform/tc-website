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
    ProjectIssue projectIssue = new ProjectIssue();
    String s_projectId = "" + htParams.get("projectId");
    String s_projectIssueId = "" + htParams.get("projectIssueId");
    
    if (pt_action == ACTION_NEW) {
        inEdit = true;
        projectIssue.setOpen_date(new java.util.Date());
    }

    if (pt_action == ACTION_VIEW) {
        try {
            projectIssue = ProjectBean.getProjectIssueById(Integer.parseInt(s_projectIssueId));
            invalid = (projectIssue == null);
            inEdit = false;
        } catch (NumberFormatException nfe) {
            invalid = true;
        }
    }

    if (pt_action == ACTION_CONVERT_ISSUE) {
        try {
            projectIssue = ProjectBean.getProjectIssueById(Integer.parseInt(s_projectIssueId));
            invalid = (projectIssue == null);
            if (!invalid) ProjectBean.convertIssueToTask(projectIssue);
            inEdit = false;
            invalid = true;
        } catch (NumberFormatException nfe) {
            invalid = true;
        }
    }

    if (pt_action == ACTION_EDIT) {
        try {
            projectIssue = ProjectBean.getProjectIssueById(Integer.parseInt(s_projectIssueId));
            invalid = (projectIssue == null);
            inEdit = true;
        } catch (NumberFormatException nfe) {
            invalid = true;
        }
    }

    if (pt_action == ACTION_SAVE) {
        try {
            int projectIssueId = Integer.parseInt(s_projectIssueId);
            if (projectIssueId == 0) {
                // Add new
                projectIssue.setProject_issue_id(0);
            } else {
                // Update
                projectIssue = ProjectBean.getProjectIssueById(Integer.parseInt(s_projectIssueId));
                invalid = (projectIssue == null);
            }
        } catch (NumberFormatException nfe) {
                invalid = true;
        }
        if (!invalid) {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            // Get data from form and set project issue
            String strValue = "";
            strValue = request.getParameter("taIssueText");
            if (strValue != null && strValue.length() > 0) {
            projectIssue.setIssue_text(strValue);
            }
            if (projectIssue.getProject_issue_id() == 0) {
                projectIssue.setProject_id(Integer.parseInt(s_projectId));
                ProjectBean.addProjectIssue(projectIssue);
            } else {
                ProjectBean.saveProjectIssue(projectIssue);
            }
        }
    }

    if (pt_action == ACTION_CANCEL) {
        try {
            projectIssue = ProjectBean.getProjectIssueById(Integer.parseInt(s_projectIssueId));
            invalid = (projectIssue == null);
        } catch (NumberFormatException nfe) {
            invalid = true;
        }
    }
%>

<% if (invalid) { %> <SCRIPT Language="Javascript1.2">submitPage('<%= pt_vp %>', 'project_summary', '<%= ACTION_NONE %>', '[projectId=<%= s_projectId %>]');</SCRIPT> <% } %>

<DIV CLASS=box>
    <DIV CLASS=subheader>
            &nbsp;Project Issue Form
    </DIV>
</DIV>

<% if (invalid) { %>
    <DIV CLASS=content>
        - Project Issue form has an invalid state.
    </DIV>
<% } else { %>

    <% if (inEdit) { %>
        <FORM NAME="frmProjectIssue" ACTION="/ProjectCtxServlet" METHOD="POST">
        <TABLE WIDTH="<%= tableWidth %>">
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Open Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= projectIssue.getOpen_date() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Issue Text</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><TEXTAREA ROWS=5 COLS=50 NAME="taIssueText"><%= projectIssue.getIssue_text() %></TEXTAREA></DIV></TD>
            </TR>
        </TABLE>
        <% pt_params = "[projectId=" + s_projectId + "][projectIssueId=" + s_projectIssueId + "]"; %>
        <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
        <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectIssue">
        <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_SAVE %>">
        <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
        <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Save">
        </FORM>
        <FORM NAME="frmProjectIssue" ACTION="/ProjectCtxServlet" METHOD="POST">
                <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
                <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectIssue">
                <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_CANCEL %>">
                <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
                <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Cancel">
        </FORM>
    <% } else { %>
        <TABLE WIDTH="<%= tableWidth %>">
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Open Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= projectIssue.getOpen_date() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Issue Text</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= projectIssue.getIssue_text() %></DIV></TD>
            </TR>
        </TABLE>
        <% pt_params = "[projectId=" + s_projectId + "][projectIssueId=" + s_projectIssueId + "]"; %>
        <FORM NAME="frmProjectIssue" ACTION="/ProjectCtxServlet" METHOD="POST">
                <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
                <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectIssue">
                <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_EDIT %>">
                <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
                <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Edit">
        </FORM>
        <% if (groups.indexOf("[1]") > -1 || groups.indexOf("[2]") > -1 || ProjectBean.getUserId(ProjectBean.getProjectById(projectIssue.getProject_id()).getTech_lead()) == user_id) { %>
        <FORM NAME="frmProjectIssue" ACTION="/ProjectCtxServlet" METHOD="POST">
                <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
                <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectIssue">
                <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_CONVERT_ISSUE %>">
                <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
                <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Convert To Task">
        </FORM>
        <% } %>
    <% } %>

<% } %>

</BODY>
</HTML>