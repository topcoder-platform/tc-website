<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
	<TITLE>TCES Mockup</TITLE>
	<%@ include file="/TC/styles/stylesheet.jsp" %>
	<%@ include file="section.jsp" %>

	<%
		// PAGE GLOBALS
		String currentSection = "skill";
		int sectionIdx = Integer.parseInt("" + hashSection.get(currentSection));
		String action = "";

		// PAGE SPECIFIC DECLARATIONS
		class Skill {
			int id;
			String skillName;
			int level;
			public Skill(int idIn, String skillNameIn, int levelIn) {
				id = idIn;
				skillName = skillNameIn;
				level = levelIn;
			}
			public int getId() { return id; }
			public String getSkillName() { return skillName; }
			public int getLevel() { return level; }
			public void setLevel(int levelIn) { level = levelIn; }
		}
		
		Skill arrSkill[] = new Skill[7];
		arrSkill[0] = new Skill(1, "Programming - Java", -1);
		arrSkill[1] = new Skill(2, "Programming - C++", -1);
		arrSkill[2] = new Skill(3, "Programming - FORTRAN", -1);
		arrSkill[3] = new Skill(4, "Programming - Visual Basic", -1);
		arrSkill[4] = new Skill(5, "Database - Oracle", -1);
		arrSkill[5] = new Skill(6, "Database - MSSQL", -1);
		arrSkill[6] = new Skill(7, "Database - PL/SQL", -1);
		
		Hashtable hashSkill = new Hashtable();
		for (int i=0; i < arrSkill.length; i++) {
			hashSkill.put("" + arrSkill[i].getId(), arrSkill[i]);
		}
		
		Hashtable hashUserSkill = new Hashtable();
		Object objUserSkill = session.getValue("hashUserSkill");
		if (objUserSkill != null && objUserSkill instanceof Hashtable) {
			hashUserSkill = (Hashtable)objUserSkill;
		}

		// PAGE LOGIC GOES HERE
		action = request.getParameter("butAction");
		if (action != null) {
			if (action.equals("<<")) {
				int newIdx = (sectionIdx + arrSection.length - 1) % arrSection.length;
				response.sendRedirect(arrSection[newIdx].getPageName() + ".jsp");
			}
			if (action.equals(">>")) {
				int newIdx = (sectionIdx + arrSection.length + 1) % arrSection.length;			
				response.sendRedirect(arrSection[newIdx].getPageName() + ".jsp");
			}
			
			if (action.equals("SAVE") || action.equals("Add skills")) {
				// Save skill levels
				Enumeration enumUserSkill = hashUserSkill.elements();
				while (enumUserSkill.hasMoreElements()) {
					Skill tmpSkill = (Skill)enumUserSkill.nextElement();
					String level = request.getParameter("radSkillLevel_" + tmpSkill.getId());
					if (level != null) {
						tmpSkill.setLevel(Integer.parseInt(level));
						hashUserSkill.put("" + tmpSkill.getId(), tmpSkill);
					}
				}
				session.putValue("hashUserSkill", hashUserSkill);
			}
			
			if (action.equals("SAVE")) {
				//int newIdx = (sectionIdx + arrSection.length + 1) % arrSection.length;			
				//response.sendRedirect(arrSection[newIdx].getPageName() + ".jsp");			
			}
			if (action.equals("Add skills")) {
				// get selections from selSkill
				String selectedSkills[] = request.getParameterValues("selSkill");
				if (selectedSkills != null) {
					for (int i=0; i < selectedSkills.length; i++) {
						if (hashUserSkill != null && hashSkill.get(selectedSkills[i]) != null) {
							hashUserSkill.put(selectedSkills[i], hashSkill.get(selectedSkills[i]));
						}
					}
					session.putValue("hashUserSkill", hashUserSkill);
				}
			}
		}
		String removeSkill = request.getParameter("remove");
		if (removeSkill != null) {
			hashUserSkill.remove(removeSkill);
			session.putValue("hashUserSkill", hashUserSkill);
		}

		// PAGE SPECIFIC CODE
		ArrayList alSkill = new ArrayList();
		for (int i=0; i < arrSkill.length; i++) {
			if (hashUserSkill != null && hashUserSkill.get("" + arrSkill[i].getId()) == null) {
				alSkill.add(arrSkill[i]);
			}
		}
		Skill skillList[] = (Skill[])alSkill.toArray(new Skill[0]);
	%>
</HEAD>

<BODY BGCOLOR="White" TEXT="Black" LINK="Navy" VLINK="Navy" ALINK="Navy">
<IMG SRC="../graphics/header.gif" WIDTH=700 HEIGHT=34 BORDER=0>
<TABLE WIDTH="700" CELLSPACING=0 CELLPADDING=0 BORDER=0>
	<TR VALIGN="TOP">
		<!-- nav -->
		<TD>
			<%@ include file="nav.jsp" %>
		</TD>
		<!-- main content -->
		<TD WIDTH="100%">
		 <TABLE WIDTH="100%">
		 	<TR>
				<TD>&nbsp;</TD>
				<TD WIDTH="100%" ALIGN="LEFT" BGCOLOR="#FFFFFF">

<FORM NAME="frm<%= currentSection %>" ACTION="<%= currentSection %>.jsp" METHOD="POST">
<TABLE WIDTH="100%" BORDER=0>

	<TR>
		<TD></TD>
		<TD></TD>
		<TD WIDTH="100%"></TD>
	</TR>	

	<TR VALIGN="TOP">
		<TD>
			<DIV CLASS="subheader">
				Skills
			</DIV>
		</TD>
		<TD>&nbsp;&nbsp;
		</TD>
		<TD>
			<SELECT NAME="selSkill" multiple SIZE=5>
				<OPTION VALUE="0">----- available skills to add -------
				<% for (int i=0; i < skillList.length; i++) { %>
				<OPTION VALUE="<%= skillList[i].getId() %>"><%= skillList[i].getSkillName() %>
				<% } %>
			</SELECT>
			<INPUT TYPE="SUBMIT" NAME="butAction" VALUE="Add skills">
		</TD>
	</TR>	

	<TR>
		<TD COLSPAN=3><HR></TD>
	</TR>

<% if (hashUserSkill.size() > 0) { %>
	<TR>
		<TD COLSPAN=3>
			<TABLE CELLSPACING=0 CELLPADDING=0 WIDTH="100%">
				<TR>
					<TD>
						<NOBR>
						<DIV CLASS="mcontent">
						</DIV>
						</NOBR>
					</TD>
					<TD>&nbsp;</TD>
					<TD ALIGN="LEFT">
						<NOBR>
						<DIV CLASS="mcontent">
						Beginner
						</DIV>
						</NOBR>
					</TD>
					<TD ALIGN="RIGHT">
						<NOBR>
						<DIV CLASS="mcontent">
						Expert
						</DIV>
						</NOBR>
					</TD>
					<TD WIDTH="100%">&nbsp;</TD>
				</TR>

				<%
					Enumeration enum = hashUserSkill.elements();
					boolean switchColor = false;
					while (enum.hasMoreElements()) {
						//Skill currentSkill = (Skill)hashSkill.get(enum.nextElement());
						Skill currentSkill = (Skill)enum.nextElement();
						switchColor = !switchColor;
				%>
				<TR<%= " BGCOLOR=\"" + (switchColor ? "#E0E0F0" : "#F2F2FF") + "\"" %>>
					<TD>
						<NOBR>
						<DIV CLASS="mcontent">
							<%= currentSkill.getSkillName() %>
						</DIV>
						</NOBR>
					</TD>
					<TD>&nbsp;&nbsp;&nbsp;</TD>
					<TD COLSPAN=2>
						<NOBR>
						<% for (int i=0; i < 5; i++) { %>
							<INPUT TYPE="RADIO" NAME="radSkillLevel_<%= currentSkill.getId() %>" VALUE="<%= i+1 %>"<%= (currentSkill.getLevel() == i+1 ? " CHECKED" : "") %>>&nbsp;&nbsp;&nbsp;
						<% } %>
						</NOBR>
					</TD>
					<TD ALIGN="RIGHT">
						<DIV CLASS="mcontent">
							<A HREF="skill.jsp?remove=<%= currentSkill.getId() %>">remove</A>
						</DIV>
					</TD>
				</TR>
				<% } %>

			</TABLE>	
		</TD>
	</TR>
<% } else { %>
	<TR>
		<TD COLSPAN=3>
			<DIV CLASS="mcontent">
				You currently have no skills added.
			</DIV>
		</TD>
	</TR>
<% } %>

	<TR>
		<TD COLSPAN=3><HR></TD>
	</TR>

	<TR>
		<TD ALIGN="RIGHT" COLSPAN=3>
			<INPUT TYPE="SUBMIT" NAME="butAction" VALUE="<<">
			<INPUT TYPE="SUBMIT" NAME="butAction" VALUE="SAVE">
			<INPUT TYPE="SUBMIT" NAME="butAction" VALUE=">>">			
		</TD>
	</TR>

</TABLE>
</FORM>

				</TD>
			</TR>
		 </TABLE>
		</TD>
	</TR>
</TABLE>

</BODY>
</HTML>
