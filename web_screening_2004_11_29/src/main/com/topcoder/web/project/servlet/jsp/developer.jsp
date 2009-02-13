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

<% vp = "3"; %>

<% if (invalid) { %>
    <SCRIPT Language="Javascript1.2">submitPage('menu', 'view', '', '<%= vp %>');</SCRIPT>        
<% } %>

<DIV CLASS=box>
<TABLE WIDTH="100%" BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255"><DIV CLASS=header><NOBR>
                    P R O J E C T
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
<%
int taskIds[] = ProjectBean.getProjectTaskIds(project.getProject(), user_id);
for (int i=0; i < taskIds.length; i++) {
    ProjectTask pt = ProjectBean.getProjectTask(taskIds[i]);
    int updateIds[] = ProjectBean.getProjectTaskUpdateIds(pt.getProjectTask()); 
%>
<TABLE WIDTH="100%" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255">
		<DIV CLASS="box_lt">
			<DIV CLASS=header>
                            <NOBR><%= pt.getRefName() %>&nbsp;&nbsp;&nbsp;[<A HREF="javascript:submitPage('ProjectTaskUpdate', 'new', '<%= pt.getProjectTask() %>', '<%= vp %>');">Add New Task Update</A>]</NOBR>
                        </DIV> 
		</DIV>
		</TD>
		<TD COLSPAN=3 WIDTH="100%"></TD>
	</TR>
	<TR VALIGN="TOP">
		<TD COLSPAN=4 BGCOLOR="#FFFFFF">
		<DIV CLASS="box_lt">
			<DIV CLASS=subcontent>
                            <I><%= pt.getDescription() %></I>
                        </DIV> 
		</DIV>
		</TD>
	</TR>
        <TR BGCOLOR="#447744">
                <TD WIDTH=50>
                        <DIV CLASS=subheader>
                                <FONT COLOR="WHITE"><NOBR>Start Date</NOBR></FONT>
                        </DIV>
                </TD>
                <TD WIDTH=90>
                        <DIV CLASS=subheader>
                                <FONT COLOR="WHITE"><NOBR>Assigned On Date</NOBR></FONT>
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
        <TR>
                <TD BGCOLOR="#CCCCFF">
                        <DIV CLASS=subcontent>
                        <%= pt.getTaskStartDate() %>
                        </DIV>
                </TD>
                <TD BGCOLOR="#CCCCFF">
                        <DIV CLASS=subcontent>
                        <%= pt.getTaskAssignedOnDate() %>
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
	<TR VALIGN="TOP">
		<TD COLSPAN=4 BGCOLOR="#222255">
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
<% for (int j=0; j < updateIds.length; j++) {
		ProjectTaskUpdate ptu = ProjectBean.getProjectTaskUpdate(updateIds[j]); %>
				<TR>
					<TD BGCOLOR="#555599">
						<DIV CLASS=subheader>
							
							<NOBR><A HREF="javascript:submitPage('ProjectTaskUpdate', 'view', '<%= ptu.getProjectTaskUpdate() %>', '<%= vp %>');"><%= ptu.getUpdatedOnDateAtTime() %></A></NOBR>
						</DIV>
					</TD>
					<TD BGCOLOR="#CCCCFF">
						<DIV CLASS=subcontent>
							<%= ptu.getUpdateNotes() %>
						</DIV>
					</TD>
				</TR>
<% } %>
			</TABLE>
		</TD>
	</TR>
</TABLE>
<BR>
<% } %>
</TD>
</TR>
</TABLE>

</BODY>
</HTML>
