<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
	<TITLE>TCES Mockup</TITLE>
	<%@ include file="/TC/styles/stylesheet.jsp" %>
	<%@ include file="section.jsp" %>

	<%
		// PAGE GLOBALS
		String currentSection = "prefs";
		int sectionIdx = Integer.parseInt("" + hashSection.get(currentSection));
		String action = "";

		// PAGE SPECIFIC DECLARATIONS

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
			if (action.equals("SAVE")) {
				int newIdx = (sectionIdx + arrSection.length + 1) % arrSection.length;			
				response.sendRedirect(arrSection[newIdx].getPageName() + ".jsp");			
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
		<TD>
			<DIV CLASS="subheader">
				Industry
			</DIV>
		</TD>
		<TD>&nbsp;&nbsp;
		</TD>
		<TD>
			<SELECT NAME="selIndustry">
				<OPTION VALUE=""> ------- Select all -------- </OPTION>
				<OPTION VALUE="1">Accounting/Auditing</OPTION>
				<OPTION VALUE="2">Administrative and Support Services</OPTION>
				<OPTION VALUE="8">Advertising/Marketing/Public Relations</OPTION>
				<OPTION VALUE="540">Agriculture, Forestry, & Fishing</OPTION>
				<OPTION VALUE="541">Architectural Services</OPTION>
				<OPTION VALUE="12">Arts, Entertainment, and Media</OPTION>
				<OPTION VALUE="576">Banking</OPTION>
				<OPTION VALUE="46">Biotechnology and Pharmaceutical</OPTION>
				<OPTION VALUE="542">Community, Social Services, and Nonprofit</OPTION>
				<OPTION VALUE="543">Computers, Hardware</OPTION>
				<OPTION VALUE="6">Computers, Software</OPTION>
				<OPTION VALUE="544">Construction, Mining and Trades</OPTION>
				<OPTION VALUE="546">Consulting Services</OPTION>
				<OPTION VALUE="545">Customer Service and Call Center</OPTION>
				<OPTION VALUE="3">Education, Training, and Library</OPTION>
				<OPTION VALUE="547">Employment Placement Agencies</OPTION>
				<OPTION VALUE="4">Engineering</OPTION>
				<OPTION VALUE="548">Finance/Economics</OPTION>
				<OPTION VALUE="549">Financial Services</OPTION>
				<OPTION VALUE="550">Government and Policy</OPTION>
				<OPTION VALUE="551">Healthcare, Other</OPTION>
				<OPTION VALUE="9">Healthcare, Practitioner and Technician</OPTION>
				<OPTION VALUE="552">Hospitality/Tourism</OPTION>
				<OPTION VALUE="5">Human Resources</OPTION>
				<OPTION VALUE="660">Information Technology</OPTION>
				<OPTION VALUE="553">Installation, Maintenance, and Repair</OPTION>
				<OPTION VALUE="45">Insurance</OPTION>
				<OPTION VALUE="554">Internet/E-Commerce</OPTION>
				<OPTION VALUE="555">Law Enforcement, and Security</OPTION>
				<OPTION VALUE="7">Legal</OPTION>
				<OPTION VALUE="47">Manufacturing and Production</OPTION>
				<OPTION VALUE="556">Military</OPTION>
				<OPTION VALUE="11">Other</OPTION>
				<OPTION VALUE="557">Personal Care and Service</OPTION>
				<OPTION VALUE="558">Real Estate</OPTION>
				<OPTION VALUE="13">Restaurant and Food Service</OPTION>
				<OPTION VALUE="44">Retail/Wholesale</OPTION>
				<OPTION VALUE="10">Sales</OPTION>
				<OPTION VALUE="559">Science</OPTION>
				<OPTION VALUE="560">Sports and Recreation</OPTION>
				<OPTION VALUE="561">Telecommunications</OPTION>
				<OPTION VALUE="562">Transportation and Warehousing</OPTION>			
			</SELECT>
		</TD>
	</TR>	

	<TR>
		<TD>
			<DIV CLASS="subheader">
				Keywords
			</DIV>
		</TD>
		<TD>&nbsp;&nbsp;
		</TD>
		<TD>
			<INPUT TYPE="TEXT" NAME="txtKeywords" VALUE="">
		</TD>
	</TR>	

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
