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
    String formError = "";
    ProjectUserTask projectUserTask = new ProjectUserTask();
    String s_projectId = "" + htParams.get("projectId");
    String s_projectTaskId = "" + htParams.get("projectTaskId");

    if (pt_action == ACTION_NEW) {
        inEdit = true;
    }

    if (pt_action == ACTION_SAVE) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        // Get data from form and set projectUserTaskUpdate
        String strValue = "";
        strValue = request.getParameter("txtProjectUserId");
        projectUserTask.setProject_user_id(Integer.parseInt(strValue));
        projectUserTask.setProject_task_id(Integer.parseInt(s_projectTaskId));
        strValue = request.getParameter("txtAssignDate");
        if (strValue != null && strValue.length() > 0) {
        projectUserTask.setAssign_date(df.parse(strValue));
        }
        if (formError.length() == 0) {
            if (projectUserTask.getProject_user_task_id() == 0) {
                ProjectBean.addProjectUserTask(projectUserTask);
            } else {
                ProjectBean.saveProjectUserTask(projectUserTask);
            }
        } else {
            inEdit = true;
        }
    }

    if (pt_action == ACTION_CANCEL) {
        invalid = true;
    }
%>
<% if (invalid) { %> <SCRIPT Language="Javascript1.2">submitPage('<%= pt_vp %>', 'projectTask_summary', '<%= ACTION_NONE %>', '[projectId=<%= s_projectId %>][projectTaskId=<%= s_projectTaskId %>]');</SCRIPT> <% } %>

<DIV CLASS=box>
    <DIV CLASS=subheader>
            &nbsp;Project User Task Form
    </DIV>
</DIV>

<% if (inEdit) { %>
    <% if (formError.length() > 0) { %>
    <DIV CLASS=error>ERROR<BR><%= formError%></DIV>
    <% } %>
    <FORM NAME="frmProjectUserTask" ACTION="/ProjectCtxServlet" METHOD="POST">
    <TABLE WIDTH="<%= tableWidth %>">
        <TR VALIGN="TOP">
            <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Project User</DIV></TD>
            <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent>
                <SELECT NAME="txtProjectUserId">
                <%
                    Integer projectUserIds[] = ProjectBean.getProjectUserIds(Integer.parseInt(s_projectId), ProjectBean.ROLE_DEVELOPER);
                    for (int i=0; i < projectUserIds.length; i++) {
                %>
                        <OPTION VALUE="<%= projectUserIds[i] %>"><%= ProjectBean.getUserString(new Integer(ProjectBean.getUserId(projectUserIds[i].intValue()))) %>
                <% } %>
                </SELECT>
            </DIV></TD>
        </TR>
        <TR VALIGN="TOP">
            <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Assigned On (yyyy-mm-dd)</DIV></TD>
            <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><INPUT TYPE="TEXT" NAME="txtAssignDate" VALUE="<%= projectUserTask.getAssign_date() %>"></DIV></TD>
        </TR>
    </TABLE>
    <% pt_params = "[projectId=" + s_projectId + "][projectTaskId=" + s_projectTaskId + "]"; %>
    <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
    <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectUserTask">
    <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_SAVE %>">
    <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
    <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Save">
    </FORM>
    <FORM NAME="frmProjectUserTask" ACTION="/ProjectCtxServlet" METHOD="POST">
            <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
            <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectUserTask">
            <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_CANCEL %>">
            <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
            <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Cancel">
    </FORM>
<% } else { %>
    <DIV CLASS=content>
        Project user was added.
    </DIV>
<% } %>

</BODY>
</HTML>