<HTML>
<HEAD>
<%@ include file="header.jsp" %>
</HEAD>

<%@ include file="stylesheet.jsp" %>
<%@ include file="body.jsp" %>
<%@ include file="nav.jsp" %>

<%
ArrayList projectList = new ArrayList();
projectList = ProjectBean.getProjects(pt_vp, user_id, 0);
%>

<DIV CLASS=box>
	<DIV CLASS=subheader>
		<NOBR>&nbsp;Project List</NOBR>
	</DIV>
</DIV>

<TABLE WIDTH="<%= tableWidth %>" BORDER=0>
        <TR VALIGN="TOP">
            <TD WIDTH="26%"><DIV CLASS=mcontent>NAME</DIV></TD>
            <TD WIDTH="20%"><DIV CLASS=mcontent><NOBR>MANAGERS</NOBR></DIV></TD>
            <TD WIDTH="14%"><DIV CLASS=mcontent><NOBR>STARTED ON</NOBR></DIV></TD>
            <TD WIDTH="14%"><DIV CLASS=mcontent><NOBR>DEADLINE</NOBR></DIV></TD>
            <TD WIDTH="12%"><DIV CLASS=mcontent><NOBR>STATUS</NOBR></DIV></TD>
        </TR>
<%
for (int id = 0; id < projectList.size(); id++) {
	Project project = (Project) projectList.get(id);
%>
        <TR VALIGN="TOP" BGCOLOR="#DDDDFF">
            <TD BGCOLOR="#FFFFFF">
                    <DIV CLASS=mcontent>
                            <% nav_generic.setLink(pt_vp, "project_summary", ACTION_NONE, "[projectId=" + project.getProject_id() + "]"); %>
                            <NOBR>
                                    <%= nav_generic.displayLink(project.getName()) %>
                            </NOBR>
                    </DIV>
            </TD>
            <TD>
                    <DIV CLASS=content>
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
            <TD>
                    <DIV CLASS=content>
                            <NOBR><%= project.getStart_date() %></NOBR>
                    </DIV>
            </TD>
            <TD>
                    <DIV CLASS=content>
                            <NOBR><B><FONT COLOR="#CC3333"><%= project.getDeadline_date() %></FONT></B></NOBR>
                    </DIV>
            </TD>
            <TD>
                    <DIV CLASS=content>
                            <%= ProjectBean.getProjectStatusString(project.getStatus_id()) %>
            </TD>
        </TR>
<% } %>
</TABLE>

<BR>

<% if (groups.indexOf("[1]") > -1 || groups.indexOf("[2]") > -1) { %>
<DIV CLASS=box>
	<DIV CLASS=subheader>
		<NOBR>&nbsp;Project Management</NOBR>
	</DIV>
</DIV>

<DIV CLASS="content">
  <% nav_generic.setLink(pt_vp, "project", ACTION_NEW, ""); %>             
- <%= nav_generic.displayLink("Create New Project") %>
</DIV>
<% } %>

<BR>

<% if (groups.indexOf("[1]") > -1 || groups.indexOf("[2]") > -1) { %>
<DIV CLASS=box>
	<DIV CLASS=subheader>
		<NOBR>&nbsp;Project Search</NOBR>
	</DIV>
</DIV>

<DIV CLASS="content">
<!--TABLE>
    <TR>
        <TD>By name
        <TD><INPUT TYPE="TEXT" NAME="txtSearchName" VALUE=""></TD>
    </TR>
    <TR>
        <TD>By description
        <TD><INPUT TYPE="TEXT" NAME="txtSearchDesc" VALUE=""></TD>
    </TR>
    <TR>
        <TD>By status
        <TD><INPUT TYPE="TEXT" NAME="txtSearchStatus" VALUE=""></TD>
    </TR>
</TABLE>
</DIV-->
<% } %>

</BODY>
</HTML>