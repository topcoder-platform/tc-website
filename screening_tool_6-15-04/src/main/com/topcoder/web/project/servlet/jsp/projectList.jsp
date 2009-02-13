<HTML>
<HEAD>
<%@ include file="header.jsp" %>
<%@ page import="com.topcoder.web.project.common.Project" %>
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
		&nbsp;Project List
	</DIV>
</DIV>

<TABLE WIDTH="<%= tableWidth %>" BORDER=0>
        <TR VALIGN="TOP">
            <TD WIDTH="20%"><DIV CLASS=mcontent>&nbsp;</DIV></TD>
            <TD WIDTH="16%"><DIV CLASS=mcontent><NOBR>STATUS</NOBR></DIV></TD>
            <TD WIDTH="16%"><DIV CLASS=mcontent><NOBR>MANAGER</NOBR></DIV></TD>
            <TD WIDTH="16%"><DIV CLASS=mcontent><NOBR>CREATION DATE</NOBR></DIV></TD>
            <TD WIDTH="16%"><DIV CLASS=mcontent><NOBR>START DATE</NOBR></DIV></TD>
            <TD WIDTH="16%"><DIV CLASS=mcontent><NOBR>DEADLINE</NOBR></DIV></TD>
        </TR>
<%
for (int id = 0; id < projectList.size(); id++) {
	Project project = (Project) projectList.get(id);
%>
        <TR VALIGN="TOP" BGCOLOR="#DDDDFF">
            <TD BGCOLOR="#333344">
							<DIV CLASS=mcontent_lt>
								<NOBR><A HREF="javascript:submitPage('<%= pt_vp %>', 'projectSummary', '<%= ACTION_NONE %>', '<%= "[projectId=" + project.getProject() + "]" %>');"><%= project.getRefName() %></A></NOBR>
							</DIV>
						</TD>
            <TD>
							<DIV CLASS=content>
								<%= ProjectBean.getProjectStatusString(project.getProjectStatus()) %>
						</TD>
            <TD>
							<DIV CLASS=content>
								<NOBR><%= (project.getProjectManager() != null ? ProjectBean.getUserString(project.getProjectManager()) : "Not assigned") %></NOBR>
							</DIV>
						</TD>
            <TD>
							<DIV CLASS=content>
								<NOBR><%= project.getCreatedOnDateAtTime() %></NOBR>
							</DIV>
						</TD>
            <TD>
							<DIV CLASS=content>
								<NOBR><%= project.getStartDate() %></NOBR>
							</DIV>
						</TD>
            <TD>
							<DIV CLASS=content>
								<NOBR><B><FONT COLOR="#CC3333"><%= project.getDeadline() %></FONT></B></NOBR>
							</DIV>
						</TD>
        </TR>
<% } %>
</TABLE>

</BODY>
</HTML>