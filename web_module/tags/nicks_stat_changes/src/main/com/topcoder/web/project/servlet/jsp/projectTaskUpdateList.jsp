<HTML>
<HEAD><%@ include file="header.jsp" %></HEAD>

<BODY TEXT="#DDDDFF" LINK="yellow" ALINK="yellow" VLINK="yellow" BACKGROUND="/i/track/back.gif" TOPMARGIN=0 LEFTMARGIN=0>
<%@ include file="menuInc.jsp" %>

<%
    ProjectDeveloper pd = new ProjectDeveloper();
    boolean invalid = false;

    try {
        pd = ProjectBean.getProjectDeveloper(Integer.parseInt(key));
        invalid = pd == null;
    } catch (NumberFormatException nfe) {
        invalid = true;
    }
%>

<% if (invalid) { %>
    <SCRIPT Language="Javascript1.2">submitPage('menu', 'view', '', '<%= vp %>');</SCRIPT>        
<% } %>

<CENTER>
<TABLE WIDTH="96%">
<TR><TD>
<%
int taskIds[] = ProjectBean.getProjectTaskIds(pd.getProject(), pd.getTCDeveloper());
for (int i=0; i < taskIds.length; i++) {
    ProjectTask pt = ProjectBean.getProjectTask(taskIds[i]);
    int updateIds[] = ProjectBean.getProjectTaskUpdateIds(pt.getProjectTask()); 
%>
<TABLE WIDTH="100%" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR VALIGN="TOP">
		<TD BGCOLOR="#222255">
		<DIV CLASS="box_lt">
			<DIV CLASS=header>
                            <NOBR><%= pt.getRefName() %>&nbsp;&nbsp;&nbsp;</NOBR>
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
                        <NOBR><%= pt.getTaskStartDate() %></NOBR>
                        </DIV>
                </TD>
                <TD BGCOLOR="#CCCCFF">
                        <DIV CLASS=subcontent>
                        <NOBR><%= pt.getTaskAssignedOnDate() %></NOBR>
                        </DIV>
                </TD>
                <TD BGCOLOR="#CCCCFF">
                        <DIV CLASS=subcontent>
                        <NOBR><%= pt.getTaskDeadline() %></NOBR>
                        </DIV>
                </TD>
                <TD BGCOLOR="#77FF77">
                        <DIV CLASS=indicator>
                        <NOBR><%= ProjectBean.getProjectStatusString(pt.getProjectTaskStatus()) %></NOBR>
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
							
							<NOBR><%= ptu.getUpdatedOnDateAtTime() %></NOBR>
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

<A HREF="javascript:submitPage('<%= htGroups.get(vp) %>', '', '<%= pd.getProject() %>', '<%= vp %>');">back to Project Summary</A>

</TD>
</TR>
</TABLE>

</BODY>
</HTML>