<HTML>
<HEAD>
<%@ include file="header.jsp" %>
</HEAD>

<BODY TEXT="#DDDDFF" LINK="yellow" ALINK="yellow" VLINK="yellow" BACKGROUND="/i/track/back.gif" TOPMARGIN=0 LEFTMARGIN=0>
<%@ include file="menuInc.jsp" %>

<CENTER>
<TABLE WIDTH="96%">
<TR><TD>
<%
    Project project = new Project();
    boolean invalid = false;

    try {
        project = ProjectBean.getProject(Integer.parseInt(key));
        invalid = project == null;
    } catch (NumberFormatException nfe) {
        invalid = true;
    }
%>

<% vp = "1"; %>

<% if (invalid) { %>
    <SCRIPT Language="Javascript1.2">submitPage('menu', 'view', '', '<%= vp %>');</SCRIPT>        
<% } %>

<DIV CLASS=box>
<TABLE WIDTH="100%" BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255"><DIV CLASS=header><NOBR>
                    <A HREF="javascript:submitPage('Project', 'view', '<%= project.getProject() %>', '<%= vp %>');">P R O J E C T</A>
		</NOBR></DIV></TD>
		<TD BGCOLOR="#DDDDFF"><DIV CLASS=content><B><%= project.getRefName() %></B> <I>(last modified on <%= project.getLastModifiedOnDateAtTime() %>)</I></DIV></TD>
	</TR>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255"><DIV CLASS=header><NOBR>D E S C R I P T I O N</NOBR></DIV></TD>
		<TD BGCOLOR="#DDDDFF"><DIV CLASS=content><%= project.getDescription() %></DIV></TD>
	</TR>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255"><DIV CLASS=header><NOBR>S T A T U S</NOBR></DIV></TD>
		<TD BGCOLOR="#DDDDFF"><DIV CLASS=content><B><FONT COLOR="#228822"><%= ProjectBean.getProjectStatusString(project.getProjectStatus()) %></FONT></B> <I><%= project.getCompletedOnDate() %></I></DIV></TD>
	</TR>
	<TR><TD></TD></TR>
	<TR>
		<TD COLSPAN=2>
			<TABLE WIDTH="100%" CELLSPACING=1 CELLPADDING=0 BORDER=0>
				<TR VALIGN="TOP" BGCOLOR="#222255">
					<TD WIDTH="25%"><DIV CLASS=subheader><NOBR>MANAGER</NOBR></DIV></TD>
					<TD WIDTH="25%"><DIV CLASS=subheader><NOBR>CREATED ON DATE</NOBR></DIV></TD>
					<TD WIDTH="25%"><DIV CLASS=subheader><NOBR>START DATE</NOBR></DIV></TD>
					<TD WIDTH="25%"><DIV CLASS=subheader><NOBR>DEADLINE</NOBR></DIV></TD>
				</TR>
				<TR VALIGN="TOP" BGCOLOR="#DDDDFF">
					<TD><DIV CLASS=subcontent><NOBR><%= (project.getProjectManager() != null ? ProjectBean.getUserString(project.getProjectManager()) : "Not assigned") %></NOBR></DIV></TD>
					<TD><DIV CLASS=subcontent><NOBR><%= project.getCreatedOnDateAtTime() %></NOBR></DIV></TD>
					<TD><DIV CLASS=subcontent><NOBR><%= project.getStartDate() %></NOBR></DIV></TD>
					<TD><DIV CLASS=subcontent><NOBR><B><FONT COLOR="#CC3333"><%= project.getDeadline() %></FONT></B></NOBR></DIV></TD>
				</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
</DIV>
<BR>

<% int taskIds[] = ProjectBean.getProjectTaskIds(project.getProject()); %>
<TABLE WIDTH="100%" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255">
		<DIV CLASS="box_lt">
			<DIV CLASS=header><NOBR>PROJECT TASKS</NOBR></DIV> 
		</DIV>
		</TD>
		<TD WIDTH="100%"></TD>
	</TR>
	<TR VALIGN="TOP">
		<TD COLSPAN=2 BGCOLOR="#222255">
			<TABLE CELLSPACING=1 CELLPADDING=0 WIDTH="100%">
				<TR BGCOLOR="#447744">
					<TD WIDTH=90>
						<DIV CLASS=subheader>
							<FONT COLOR="WHITE"><NOBR>Task Id</NOBR></FONT>
						</DIV>
					</TD>
					<TD>
						<DIV CLASS=subheader>
							<FONT COLOR="WHITE">Description</FONT>
						</DIV>
					</TD>
					<TD WIDTH=90>
						<DIV CLASS=subheader>
							<FONT COLOR="WHITE"><NOBR>Assigned To</NOBR></FONT>
						</DIV>
					</TD>
					<TD WIDTH=50>
						<DIV CLASS=subheader>
							<FONT COLOR="WHITE"><NOBR>Start Date</NOBR></FONT>
						</DIV>
					</TD>
					<TD WIDTH=50>
						<DIV CLASS=subheader>
							<FONT COLOR="WHITE">Deadline</FONT>
						</DIV>
					</TD>
					<TD WIDTH=40>
						<DIV CLASS=subheader>
							<FONT COLOR="WHITE">Status</FONT>
						</DIV>
					</TD>
				</TR>
<% for (int i=0; i < taskIds.length; i++) {
		ProjectTask pt = ProjectBean.getProjectTask(taskIds[i]);
%>
				<TR>
					<TD BGCOLOR="#555599">
						<DIV CLASS=subheader>
							<NOBR><A HREF="javascript:submitPage('ProjectTask', 'view', '<%= pt.getProjectTask() %>', '<%= vp %>');">#<%= i+1 %></A> - <%= pt.getRefName() %></NOBR>
						</DIV>
					</TD>
					<TD BGCOLOR="#CCCCFF">
						<DIV CLASS=subcontent>
							<%= pt.getDescription() %>
						</DIV>
					</TD>
					<TD BGCOLOR="#CCCCFF">
						<DIV CLASS=subcontent>
						<%= ProjectBean.getUserString(pt.getAssignedToTCDeveloper()) %> <I><%= pt.getTaskAssignedOnDate() %></I>
						</DIV>
					</TD>
					<TD BGCOLOR="#CCCCFF">
						<DIV CLASS=subcontent>
						<%= pt.getTaskStartDate() %>
						</DIV>
					</TD>
					<TD BGCOLOR="#CCCCFF">
						<DIV CLASS=subcontent>
						<%= pt.getTaskDeadline() %>
						</DIV>
					</TD>
					<TD BGCOLOR="#77FF77">
						<DIV CLASS=indicator>
						<%= ProjectBean.getProjectStatusString(pt.getProjectTaskStatus()) %>
						</DIV>
					</TD>
				</TR>
<% } %>

			</TABLE>
		</TD>
	</TR>
</TABLE>

<BR>

<% int updateIds[] = ProjectBean.getProjectUpdateIds(project.getProject()); %>
<TABLE WIDTH="100%" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255">
		<DIV CLASS="box_lt">
			<DIV CLASS=header><NOBR>MANAGER NOTES</NOBR></DIV> 
		</DIV>
		</TD>
		<TD WIDTH="100%"></TD>
	</TR>
	<TR VALIGN="TOP">
		<TD COLSPAN=2 BGCOLOR="#222255">
			<TABLE CELLSPACING=1 CELLPADDING=0 WIDTH="100%">
				<TR BGCOLOR="#447744">
					<TD WIDTH=90>
						<DIV CLASS=subheader>
							<FONT COLOR="WHITE">Date</FONT>
						</DIV>
					</TD>
					<TD>
						<DIV CLASS=subheader>
							<FONT COLOR="WHITE">Description</FONT>
						</DIV>
					</TD>
				</TR>
<% for (int i=0; i < updateIds.length; i++) {
		ProjectUpdate pu = ProjectBean.getProjectUpdate(updateIds[i]);
%>
				<TR>
					<TD BGCOLOR="#555599">
						<DIV CLASS=subheader>
							
							<NOBR><%= pu.getUpdatedOnDateAtTime() %></NOBR>
						</DIV>
					</TD>
					<TD BGCOLOR="#CCCCFF">
						<DIV CLASS=subcontent>
							<%= pu.getUpdateNotes() %>
						</DIV>
					</TD>
				</TR>
<% } %>
			</TABLE>
		</TD>
	</TR>
</TABLE>

<BR>

<%
int developerIds[] = ProjectBean.getProjectDeveloperIds(project.getProject());
%>
<TABLE WIDTH="100%" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255">
		<DIV CLASS="box_lt">
			<DIV CLASS=header><NOBR>DEVELOPER(S)</NOBR></DIV> 
		</DIV>
		</TD>
		<TD WIDTH="100%"></TD>
	</TR>
	<TR VALIGN="TOP">
		<TD COLSPAN=2 BGCOLOR="#222255">
			<TABLE CELLSPACING=1 CELLPADDING=0 WIDTH="100%">
				<TR BGCOLOR="#447744">
					<TD WIDTH=90>
						<DIV CLASS=subheader>
							<FONT COLOR="WHITE">Handle</FONT>
						</DIV>
					</TD>
				</TR>
<% for (int i=0; i < developerIds.length; i++) {
		ProjectDeveloper pd = ProjectBean.getProjectDeveloper(developerIds[i]);
%>
				<TR>
					<TD BGCOLOR="#555599">
						<DIV CLASS=subheader>
							<%= ProjectBean.getUserString(new Integer(pd.getTCDeveloper())) %>
						</DIV>
					</TD>
				</TR>
<% } %>
			</TABLE>
		</TD>
	</TR>
</TABLE>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>
