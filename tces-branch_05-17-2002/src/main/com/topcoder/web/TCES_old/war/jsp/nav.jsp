			<TABLE CELLSPACING=3 CELLPADDING=2 BGCOLOR="#F5F5FF" BORDER=1>
				<TR>
					<TD COLSPAN=2 BGCOLOR="#333355">
						<DIV CLASS="subheader_ltcontrast">
							Profile Sections
						</DIV>
					</TD>
				</TR>
				<% for (int i=0; i < arrSection.length; i++) { %>
				<TR VALIGN="MIDDLE">
					<TD>
						<% if (arrSection[i].getSectionState() == 0) { %>
							<IMG SRC="../graphics/unchecked.gif" WIDTH=18 HEIGHT=18 BORDER=0>
						<% } %>
						<% if (arrSection[i].getSectionState() == 1) { %>
							<IMG SRC="../graphics/checked_on.gif" WIDTH=18 HEIGHT=18 BORDER=0>
						<% } %>
						<% if (arrSection[i].getSectionState() == 2) { %>
							<IMG SRC="../graphics/checked_off.gif" WIDTH=18 HEIGHT=18 BORDER=0>
						<% } %>
					</TD>
					<TD<%= (currentSection.equals(arrSection[i].getPageName()) ? " BGCOLOR=\"#FFFF66\"" : "") %>>
						<DIV CLASS="mcontent">
						<NOBR>
							<%= i+1 %>. <A HREF="<%= arrSection[i].getPageName() %>.jsp"><%= arrSection[i].getLabelName() %></A> (<%= arrSection[i].getSectionStateName() %>)
						</NOBR>
						</DIV>
					</TD>
				</TR>
				<% } %>
			</TABLE>
			<BR>
			<DIV CLASS="mcontent">
				<UL>
					<LI>Clicking on "Save" will save any changes you make.
					<LI>Clicking on "<<" or ">>" will take you to the previous or next section without saving any changes.
				</UL>
			</DIV>
