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
    ProjectUser projectUser = new ProjectUser();
    String s_projectId = "" + htParams.get("projectId");

    if (pt_action == ACTION_NEW) {
        inEdit = true;
    }

    if (pt_action == ACTION_SAVE) {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        // Get data from form and set projectUserUpdate
        String strValue = "";
        strValue = request.getParameter("txtUserId");
        int userId = ProjectBean.getUserId(strValue);
        if (userId > 0) {
            projectUser.setUser_id(userId);
        } else {
            formError += "UserId was not found.<BR>";
        }
        strValue = request.getParameter("txtRoleId");
        projectUser.setRole_id(Integer.parseInt(strValue));

        projectUser.setProject_id(Integer.parseInt(s_projectId));
        if (formError.length() == 0) {
            if (projectUser.getProject_user_id() == 0) {
                ProjectBean.addProjectUser(projectUser);
            } else {
                ProjectBean.saveProjectUser(projectUser);
            }
        } else {
            inEdit = true;
        }
    }

    if (pt_action == ACTION_CANCEL) {
        invalid = true;
    }
%>
<% if (invalid) { %> <SCRIPT Language="Javascript1.2">submitPage('<%= pt_vp %>', 'project_summary', '<%= ACTION_NONE %>', '[projectId=<%= s_projectId %>]');</SCRIPT> <% } %>

<DIV CLASS=box>
    <DIV CLASS=subheader>
            &nbsp;Project User Form
    </DIV>
</DIV>

<% if (inEdit) { %>
    <% if (formError.length() > 0) { %>
    <DIV CLASS=error>ERROR<BR><%= formError%></DIV>
    <% } %>
    <FORM NAME="frmProjectUser" ACTION="/ProjectCtxServlet" METHOD="POST">
    <TABLE WIDTH="<%= tableWidth %>">
        <TR VALIGN="TOP">
            <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>User Id</DIV></TD>
            <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><INPUT TYPE="TEXT" NAME="txtUserId" SIZE="50" VALUE="<%= (projectUser.getUser_id() == 0 ? "" : ProjectBean.getUserString(new Integer(projectUser.getUser_id()))) %>"></DIV></TD>
        </TR>
        <TR VALIGN="TOP">
            <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Role</DIV></TD>
            <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent>
                <SELECT NAME="txtRoleId">
                    <OPTION VALUE="<%= ProjectBean.ROLE_MANAGER %>">Manager
                    <OPTION VALUE="<%= ProjectBean.ROLE_DEVELOPER %>">Developer                 
                </SELECT>
            </DIV></TD>
        </TR>
    </TABLE>
    <% pt_params = "[projectId=" + s_projectId + "]"; %>
    <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
    <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectUser">
    <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_SAVE %>">
    <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
    <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Save">
    </FORM>
    <FORM NAME="frmProjectUser" ACTION="/ProjectCtxServlet" METHOD="POST">
            <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
            <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="projectUser">
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