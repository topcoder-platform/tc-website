<TABLE WIDTH="100%" BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255"><DIV CLASS=header><NOBR>
<A HREF="javascript:submitPage('Project', 'view', '<%= project.getProject() %>');">P R O J E C T</A>
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
