<%
	int taskIds[] = ProjectBean.getProjectTaskIds(project.getProject());
%>
<TABLE WIDTH="100%" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255">
		<DIV CLASS="box_lt">
			<DIV CLASS=header><NOBR>PROJECT TASKS&nbsp;&nbsp;&nbsp;
<% if (isManager) { %>
[<A HREF="javascript:submitPage('ProjectTask', 'new', '<%= project.getProject() %>');">Add New Task</A>]
<% } %>
			</NOBR></DIV> 
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
							<NOBR><A HREF="javascript:submitPage('ProjectTask', 'view', '<%= pt.getProjectTask() %>');">#<%= i+1 %></A> - <%= pt.getRefName() %></NOBR>
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
