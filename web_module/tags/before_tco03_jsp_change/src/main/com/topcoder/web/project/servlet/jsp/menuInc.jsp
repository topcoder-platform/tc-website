<TABLE CELLSPACING=0 CELLPADDING=0 WIDTH="100%" BORDER=0>
	<TR>
		<TD ALIGN="CENTER">&nbsp;</TD>
		<TD ALIGN="CENTER"><%= ((!vp.equals("null") && vp.length() > 0) ? "<DIV class=menu>" + htGroups.get(vp) + "</DIV>": "") %></TD>
		<TD ALIGN="CENTER"></TD>
		<TD ALIGN="CENTER"><%= (rpage.equals("menu") ? "<DIV class=menu>view</DIV>" : "") %></TD>
		<TD ALIGN="CENTER"></TD>
		<TD ALIGN="CENTER">
                <% 
                    if (rpage.equals("projectList")) { 
                        out.println("<DIV class=menu>list</DIV>");
                    } else {
                        if (rpage.equals("Project")) {
                            out.println("<DIV class=menu>" + action + "</DIV>");
                        } else {
                            if (rpage.equals("manager") || rpage.equals("developer") || rpage.equals("executive")) {
                                out.println("<DIV class=menu>summary</DIV>");
                            }
                        }
                    }
                %>
                </TD>
		<TD ALIGN="CENTER"></TD>
		<TD ALIGN="CENTER">
                <%
                    if (rpage.equals("ProjectUpdate")) {
                        out.println("<DIV class=menu>" + action + "</DIV>");
                    }
                %>
                </TD>
		<TD ALIGN="CENTER"></TD>
		<TD ALIGN="CENTER">
                <%
                    if (rpage.equals("ProjectDeveloper")) {
                        out.println("<DIV class=menu>" + action + "</DIV>");
                    }
                %>
                </TD>
		<TD ALIGN="CENTER"></TD>
		<TD ALIGN="CENTER">
                <%
                    if (rpage.equals("ProjectTask")) {
                        out.println("<DIV class=menu>" + action + "</DIV>");
                    }
                %>
                </TD>
		<TD ALIGN="CENTER"></TD>
		<TD ALIGN="CENTER">
                <%
                    if (rpage.equals("ProjectTaskUpdate")) {
                        out.println("<DIV class=menu>" + action + "</DIV>");
                    }
                %>
                </TD>
		<TD ALIGN="CENTER"><IMG SRC="/i/track/spacer.gif" HEIGHT=32 BORDER=0></TD>
	</TR>
	<TR>
		<TD>&nbsp;</TD>
		<TD ALIGN="LEFT">
			<A HREF="javascript:submitPage('logout', 'logout', '', '');"><DIV class=menu>LOGOUT</DIV></A>
		</TD>
		<TD ALIGN="LEFT">
			<IMG SRC="/i/track/sep.gif" WIDTH=15 HEIGHT=23 BORDER=0>
		</TD>
		<TD ALIGN="LEFT">
			<A HREF="javascript:submitPage('menu', 'view', '', '<%= vp %>');"><DIV class=menu>HOME</DIV></A>
		</TD>
		<TD ALIGN="LEFT">
			<IMG SRC="/i/track/sep.gif" WIDTH=15 HEIGHT=23 BORDER=0>
		</TD>
		<TD ALIGN="LEFT">
			<A HREF="javascript:submitPage('projectList', 'view', '', '<%= vp %>');"><DIV class=menu>PROJECT</DIV></A>
		</TD>
		<TD ALIGN="LEFT">
			<IMG SRC="/i/track/sep.gif" WIDTH=15 HEIGHT=23 BORDER=0>
		</TD>
		<TD ALIGN="LEFT">
			<DIV class=menu><NOBR>PROJECT UPDATE</NOBR></DIV>
		</TD>
		<TD ALIGN="LEFT">
			<IMG SRC="/i/track/sep.gif" WIDTH=15 HEIGHT=23 BORDER=0>
		</TD>
		<TD ALIGN="LEFT">
			<DIV class=menu>DEVELOPER</DIV>
		</TD>
		<TD ALIGN="LEFT">
			<IMG SRC="/i/track/sep.gif" WIDTH=15 HEIGHT=23 BORDER=0>
		</TD>
		<TD ALIGN="LEFT">
			<DIV class=menu>TASK</DIV>
		</TD>
		<TD ALIGN="LEFT">
			<IMG SRC="/i/track/sep.gif" WIDTH=15 HEIGHT=23 BORDER=0>
		</TD>
		<TD ALIGN="LEFT">
			<DIV class=menu><NOBR>TASK UPDATE</NOBR></DIV>
		</TD>
		<TD WIDTH="100%">
		</TD>
	</TR>
</TABLE>
<FORM NAME="frmProjectMenu" ACTION="/ProjectCtxServlet" METHOD="POST"><INPUT TYPE="HIDDEN" NAME="page"><INPUT TYPE="HIDDEN" NAME="action"><INPUT TYPE="HIDDEN" NAME="key"><INPUT TYPE="HIDDEN" NAME="vp"></FORM>
<!--vp:<%= vp %>, page:<%= rpage %>, action:<%= action %>-->