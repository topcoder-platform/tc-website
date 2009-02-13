<%
int updateIds[] = ProjectBean.getProjectUpdateIds(project.getProject());
%>
<TABLE WIDTH="100%" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255">
		<DIV CLASS="box_lt">
			<DIV CLASS=header><NOBR>MANAGER NOTES&nbsp;&nbsp;&nbsp;
<% if (isManager) { %>
[<A HREF="javascript:submitPage('ProjectUpdate', 'new', '<%= project.getProject() %>');">Add New Update</A>]
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
							
							<NOBR><A HREF="javascript:submitPage('ProjectUpdate', 'view', '<%= pu.getProjectUpdate() %>');"><%= pu.getUpdatedOnDateAtTime() %></A></NOBR>
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
