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
    Project project = new Project();
    
    if (pt_action == ACTION_NEW) {
        inEdit = true;
    }

    if (pt_action == ACTION_VIEW) {
        String s_projectId = "" + htParams.get("projectId");
        try {
                project = ProjectBean.getProjectById(Integer.parseInt(s_projectId));
                invalid = (project == null);
                inEdit = false;
        } catch (NumberFormatException nfe) {
                invalid = true;
        }
    }

    if (pt_action == ACTION_EDIT) {
        String s_projectId = "" + htParams.get("projectId");
        try {
                project = ProjectBean.getProjectById(Integer.parseInt(s_projectId));
                invalid = (project == null);
                inEdit = true;
        } catch (NumberFormatException nfe) {
                invalid = true;
        }
    }

    if (pt_action == ACTION_SAVE) {
        String s_projectId = "" + htParams.get("projectId");
        try {
            int projectId = Integer.parseInt(s_projectId);
            if (projectId == 0) {
                // Add new
                project.setProject_id(0);
            } else {
                // Update
                project = ProjectBean.getProjectById(Integer.parseInt(s_projectId));
                invalid = (project == null);
            }
        } catch (NumberFormatException nfe) {
                invalid = true;
        }
        if (!invalid) {
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            // Get data from form and set project
            String strValue = "";
            strValue = request.getParameter("txtName");
            System.out.println("####### Project.Name = " + strValue);
            if (strValue != null && strValue.length() > 0) {
            project.setName(strValue);
            }
            strValue = request.getParameter("taProject_desc");
            if (strValue != null && strValue.length() > 0) {
            project.setProject_desc(strValue);
            }
            strValue = request.getParameter("txtStart_date");
            if (strValue != null && strValue.length() > 0) {
            project.setStart_date(df.parse(strValue));
            }
            strValue = request.getParameter("txtDeadline_date");
            if (strValue != null && strValue.length() > 0) {
            project.setDeadline_date(df.parse(strValue));
            }
            strValue = request.getParameter("txtStatusId");
            if (strValue != null && strValue.length() > 0) {
            project.setStatus_id(Integer.parseInt(strValue));
            }
            strValue = request.getParameter("txtCompletion_date");
            if (strValue != null && strValue.length() > 0) {
            project.setCompletion_date(df.parse(strValue));
            }
            strValue = request.getParameter("txtTechLead");
            if (strValue != null && strValue.length() > 0) {
            project.setTech_lead(Integer.parseInt(strValue));
            }
            if (project.getProject_id() == 0) {
                int projectKey = ProjectBean.addProject(project);
                if (pt_vp == ProjectBean.ROLE_MANAGER) {
                    ProjectUser pu = new ProjectUser();
                    pu.setProject_id(projectKey);
                    pu.setRole_id(ProjectBean.ROLE_MANAGER);
                    pu.setStatus_id(20);
                    pu.setUser_id(user_id);
                    ProjectBean.addProjectUser(pu);
                }
            } else {
                ProjectBean.saveProject(project);
            }
        }
    }

    if (pt_action == ACTION_CANCEL) {
        String s_projectId = "" + htParams.get("projectId");
        try {
                project = ProjectBean.getProjectById(Integer.parseInt(s_projectId));
                invalid = (project == null);
        } catch (NumberFormatException nfe) {
                invalid = true;
        }
    }
%>

<% if (invalid) { %> <SCRIPT Language="Javascript1.2">submitPage('<%= pt_vp %>', 'project_list', '<%= ACTION_NONE %>', '');</SCRIPT> <% } %>

<DIV CLASS=box>
    <DIV CLASS=subheader>
            &nbsp;Project Form
    </DIV>
</DIV>

<% if (invalid) { %>
    <DIV CLASS=content>
        - Project form has an invalid state.
    </DIV>
<% } else { %>

    <% if (inEdit) { %>
        <FORM NAME="frmProject" ACTION="/ProjectCtxServlet" METHOD="POST">
        <TABLE WIDTH="<%= tableWidth %>">
            <TR VALIGN="TOP">
                <TD WIDTH="150" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Name</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><INPUT TYPE="TEXT" NAME="txtName" SIZE="50" VALUE="<%= project.getName() %>"></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Description</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><TEXTAREA ROWS=5 COLS=50 NAME="taProject_desc"><%= project.getProject_desc() %></TEXTAREA></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Tech Lead</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent>
                    <SELECT NAME="txtTechLead">
                        <OPTION VALUE="0">Unassigned
                    <%
                        Integer projectUserIds[] = ProjectBean.getProjectUserIds(project.getProject_id(), ProjectBean.ROLE_DEVELOPER);
                        for (int i=0; i < projectUserIds.length; i++) {
                    %>
                            <OPTION VALUE="<%= projectUserIds[i] %>"<%= (projectUserIds[i].intValue() == project.getTech_lead() ? " SELECTED" : "") %>><%= ProjectBean.getUserString(new Integer(ProjectBean.getUserId(projectUserIds[i].intValue()))) %>
                    <% } %>
                    </SELECT>
                </DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Start Date (yyyy-mm-dd)</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><INPUT TYPE="TEXT" NAME="txtStart_date" SIZE="50" VALUE="<%= project.getStart_date() %>"></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Deadline (yyyy-mm-dd)</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><INPUT TYPE="TEXT" NAME="txtDeadline_date" SIZE="50" VALUE="<%= project.getDeadline_date() %>"></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Status</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent>
                    <SELECT NAME="txtStatusId">
                    <% 
                        HashMap projectStatuses = ProjectBean.getProjectStatuses();
                        Iterator iter = projectStatuses.keySet().iterator();                        
                        while (iter.hasNext()) {
                            String s_iter = "" + iter.next();
                    %>
                        <OPTION VALUE="<%= s_iter %>"<%= (("" + project.getStatus_id()).equals(s_iter) ? " SELECTED" : "") %>><%= ProjectBean.getProjectStatusString(Integer.parseInt(s_iter)) %>
                    <% } %>
                    </SELECT>
                </DIV></TD>
            </TR>
            <!--TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Creation Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><INPUT TYPE="TEXT" NAME="txtCreation_date" SIZE="50" VALUE="<%= project.getCreation_date() %>"></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Modified On Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><INPUT TYPE="TEXT" NAME="txtModify_date" SIZE="50" VALUE="<%= project.getModify_date() %>"></DIV></TD>
            </TR-->
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Completion Date (yyyy-mm-dd)</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><INPUT TYPE="TEXT" NAME="txtCompletion_date" SIZE="50" VALUE="<%= project.getCompletion_date() %>"></DIV></TD>
            </TR>
        </TABLE>
        <% pt_params = "[projectId=" + project.getProject_id() + "]"; %>
        <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
        <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="project">
        <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_SAVE %>">
        <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
        <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Save">
        </FORM>
        <FORM NAME="frmProject" ACTION="/ProjectCtxServlet" METHOD="POST">
                <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
                <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="project">
                <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_CANCEL %>">
                <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
                <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Cancel">
        </FORM>
    <% } else { %>
        <TABLE WIDTH="<%= tableWidth %>">
            <TR VALIGN="TOP">
                <TD WIDTH="150" BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Name</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= project.getName() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Description</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= project.getProject_desc() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Tech Lead</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= (project.getTech_lead() > 0 ? ProjectBean.getUserString(new Integer(ProjectBean.getUserId(project.getTech_lead()))) : "unassigned") %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Start Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= project.getStart_date() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Deadline</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= project.getDeadline_date() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Status</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= ProjectBean.getProjectStatusString(project.getStatus_id()) %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Creation Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= project.getCreation_date() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Modified On Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= project.getModify_date() %></DIV></TD>
            </TR>
            <TR VALIGN="TOP">
                <TD BGCOLOR="#CCCCEE"><DIV CLASS=mcontent>Completion Date</DIV></TD>
                <TD BGCOLOR="#DDDDFF"><DIV CLASS=mcontent><%= project.getCompletion_date() %></DIV></TD>
            </TR>
        </TABLE>
        <% if (groups.indexOf("[1]") > -1 || groups.indexOf("[2]") > -1) { %>
        <% pt_params = "[projectId=" + project.getProject_id() + "]"; %>
        <FORM NAME="frmProject" ACTION="/ProjectCtxServlet" METHOD="POST">
                <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
                <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="project">
                <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_EDIT %>">
                <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
                <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Edit">
        </FORM>
        <% } %>
    <% } %>

<% } %>

</BODY>
</HTML>