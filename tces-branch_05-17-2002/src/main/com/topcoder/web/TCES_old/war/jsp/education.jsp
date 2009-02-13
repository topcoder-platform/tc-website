<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
	<TITLE>TCES Mockup</TITLE>
	<%@ include file="/TC/styles/stylesheet.jsp" %>
	<%@ include file="section.jsp" %>

	<%
		// PAGE GLOBALS
		String currentSection = "education";
		int sectionIdx = Integer.parseInt("" + hashSection.get(currentSection));
		String action = "";

		// PAGE SPECIFIC DECLARATIONS
		class Education {
			int id;
			String institutionName;
			int degree;
			int major;
			int minor;
			
			public Education(int idIn, String institutionNameIn, int degreeIn, int majorIn, int minorIn) {
				id = idIn;
				institutionName = institutionNameIn;
				degree = degreeIn;
				major = majorIn;
				minor = minorIn;
			}
			
			public int getId() { return id; }
			public String getInstitutionName() { return institutionName; }
			public int getDegree() { return degree; }
			public int getMajor() { return major; }
			public int getMinor() { return minor; }
			
			public void setInstitutionName(String strIn) { institutionName = strIn; }
			public void setId(int intIn) { id = intIn; }
		}

		Hashtable hashUserEducation = new Hashtable();
		Object objUserEducation = session.getValue("hashUserEducation");
		if (objUserEducation != null && objUserEducation instanceof Hashtable) {
			hashUserEducation = (Hashtable)objUserEducation;
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

			if (action.equals("SAVE") || action.equals("Add Education")) {
				Enumeration enumEducation = hashUserEducation.elements();
				while (enumEducation.hasMoreElements()) {
					Education e = (Education)enumEducation.nextElement();
					e.setInstitutionName(request.getParameter("txtInstitutionName_" + e.getId()));
					if (e.getInstitutionName().trim().length() > 0) {
						if (e.getId() == 0) {
							e.setId(hashUserEducation.size());
							hashUserEducation.remove("0");
						}
						hashUserEducation.put("" + e.getId(), e);
					} else {
						hashUserEducation.remove("" + e.getId());					
					}
				}
				session.putValue("hashUserEducation", hashUserEducation);
			}
						
			if (action.equals("SAVE")) {
				//int newIdx = (sectionIdx + arrSection.length + 1) % arrSection.length;			
				//response.sendRedirect(arrSection[newIdx].getPageName() + ".jsp");
			}			
			if (action.equals("Add Education")) {
				hashUserEducation.put("0", new Education(0, "", 0, 0, 0));
				session.putValue("hashUserEducation", hashUserEducation);
			}
		}
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

	<TR>
		<TD COLSPAN=3>
			<INPUT TYPE="SUBMIT" NAME="butAction" VALUE="Add Education">
		</TD>
	</TR>

	<TR>
		<TD COLSPAN=3><HR></TD>
	</TR>

<% if (hashUserEducation.size() > 0) {
		Enumeration enumEducation = hashUserEducation.elements();
		while (enumEducation.hasMoreElements()) {
			Education e = (Education)enumEducation.nextElement();
%>
	<TR>
		<TD>
			<DIV CLASS="subheader">
				<NOBR>
					Degree
				</NOBR>
			</DIV>
		</TD>
		<TD>&nbsp;&nbsp;
		</TD>
		<TD>
			<SELECT NAME="selDegree_<%= e.getId() %>">
				<OPTION VALUE="BA">B.A.
				<OPTION VALUE="BS">B.S.
				<OPTION VALUE="MS">M.S.
				<OPTION VALUE="PH">Ph.D.				
			</SELECT>
		</TD>
	</TR>	

	<TR>
		<TD>
			<DIV CLASS="subheader">
				<NOBR>
					Institution Name
				</NOBR>
			</DIV>
		</TD>
		<TD>&nbsp;&nbsp;
		</TD>
		<TD>
			<INPUT TYPE="TEXT" NAME="txtInstitutionName_<%= e.getId() %>" VALUE="<%= e.getInstitutionName() %>" SIZE=25>
		</TD>
	</TR>	

	<TR>
		<TD>
			<DIV CLASS="subheader">
				<NOBR>
					Major
				</NOBR>
			</DIV>
		</TD>
		<TD>&nbsp;&nbsp;
		</TD>
		<TD>
			<SELECT NAME="selMajor_<%= e.getId() %>">
				<OPTION VALUE="1">Arts
				<OPTION VALUE="2">Science
				<OPTION VALUE="3">Philosophy
				<OPTION VALUE="4">Medicine
				<OPTION VALUE="5">Law
			</SELECT>
		</TD>
	</TR>	

	<TR>
		<TD>
			<DIV CLASS="subheader">
				<NOBR>
					Graduation Month/Year
				</NOBR>
			</DIV>
		</TD>
		<TD>&nbsp;&nbsp;
		</TD>
		<TD>
			<SELECT NAME="selGradMonth_<%= e.getId() %>">
				<% for (int i=0; i < 12; i++) { %>
					<OPTION VALUE="<%= i %>"><%= i+1 %>
				<% } %>				
			</SELECT>
			<SELECT NAME="selGradYear_<%= e.getId() %>">
				<% for (int i=1960; i < 2010; i++) { %>
					<OPTION VALUE="<%= i %>"><%= i %>
				<% } %>
			</SELECT>
		</TD>
	</TR>	

	<TR>
		<TD COLSPAN=3><HR></TD>
	</TR>

<%   } %>
<% } else { %>

	<TR>
		<TD COLSPAN=3>
			<DIV CLASS="mcontent">
				You currently have no education listed.
			</DIV>
		</TD>
	</TR>

	<TR>
		<TD COLSPAN=3><HR></TD>
	</TR>

<% } %>

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

