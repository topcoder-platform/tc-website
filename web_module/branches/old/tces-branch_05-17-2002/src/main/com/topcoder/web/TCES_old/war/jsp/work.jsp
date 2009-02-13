<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
	<TITLE>TCES Mockup</TITLE>
	<%@ include file="/TC/styles/stylesheet.jsp" %>
	<%@ include file="section.jsp" %>

	<%
		// PAGE GLOBALS
		String currentSection = "work";
		int sectionIdx = Integer.parseInt("" + hashSection.get(currentSection));
		String action = "";

		// PAGE SPECIFIC DECLARATIONS
		class Employment {
			int id;
			String companyName;
			
			public Employment(int idIn, String companyNameIn) {
				id = idIn;
				companyName = companyNameIn;
			}
			
			public int getId() { return id; }
			public String getCompanyName() { return companyName; }
			
			public void setCompanyName(String strIn) { companyName = strIn; }
			public void setId(int intIn) { id = intIn; }
		}

		Hashtable hashUserEmployment = new Hashtable();
		Object objUserEmployment = session.getValue("hashUserEmployment");
		if (objUserEmployment != null && objUserEmployment instanceof Hashtable) {
			hashUserEmployment = (Hashtable)objUserEmployment;
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

			if (action.equals("SAVE") || action.equals("Add Employment")) {
				Enumeration enumEmployment = hashUserEmployment.elements();
				while (enumEmployment.hasMoreElements()) {
					Employment e = (Employment)enumEmployment.nextElement();
					e.setCompanyName(request.getParameter("txtCompanyName_" + e.getId()));
					if (e.getCompanyName().trim().length() > 0) {
						if (e.getId() == 0) {
							e.setId(hashUserEmployment.size());
							hashUserEmployment.remove("0");
						}
						hashUserEmployment.put("" + e.getId(), e);
					} else {
						hashUserEmployment.remove("" + e.getId());					
					}
				}
				session.putValue("hashUserEmployment", hashUserEmployment);
			}
						
			if (action.equals("SAVE")) {
				//int newIdx = (sectionIdx + arrSection.length + 1) % arrSection.length;			
				//response.sendRedirect(arrSection[newIdx].getPageName() + ".jsp");
			}			
			if (action.equals("Add Employment")) {
				hashUserEmployment.put("0", new Employment(0, ""));
				session.putValue("hashUserEmployment", hashUserEmployment);
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
			<INPUT TYPE="SUBMIT" NAME="butAction" VALUE="Add Employment">
		</TD>
	</TR>

	<TR>
		<TD COLSPAN=3><HR></TD>
	</TR>

<% if (hashUserEmployment.size() > 0) {
		Enumeration enumEmployment = hashUserEmployment.elements();
		while (enumEmployment.hasMoreElements()) {
			Employment e = (Employment)enumEmployment.nextElement();
%>

	<TR>
		<TD>
			<DIV CLASS="subheader">
				<NOBR>
					Company Name
				</NOBR>
			</DIV>
		</TD>
		<TD>&nbsp;&nbsp;
		</TD>
		<TD>
			<INPUT TYPE="TEXT" NAME="txtCompanyName_<%= e.getId() %>" VALUE="<%= e.getCompanyName() %>" SIZE=25>
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
				You currently have no Employment listed.
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

