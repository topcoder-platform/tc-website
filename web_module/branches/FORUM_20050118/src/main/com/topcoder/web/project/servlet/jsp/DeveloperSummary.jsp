<%
int developerIds[] = ProjectBean.getProjectDeveloperIds(project.getProject());
%>
<TABLE WIDTH="100%" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255">
		<DIV CLASS="box_lt">
			<DIV CLASS=header><NOBR>DEVELOPER(S)&nbsp;&nbsp;&nbsp;
<% if (isManager) { %>
[<A HREF="javascript:submitPage('ProjectDeveloper', 'new', '<%= project.getProject() %>');">Add New Developer</A>]
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
