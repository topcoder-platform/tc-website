<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
	<TITLE>TCES Mockup</TITLE>
	<%@ include file="/TC/styles/stylesheet.jsp" %>
	<%@ include file="section.jsp" %>

	<%
		// PAGE GLOBALS
		String currentSection = "contact";
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
				//int newIdx = (sectionIdx + arrSection.length + 1) % arrSection.length;			
				//response.sendRedirect(arrSection[newIdx].getPageName() + ".jsp");			
			}			
		}
	%>
</HEAD>

<BODY BGCOLOR="White" TEXT="Black" LINK="Navy" VLINK="Navy" ALINK="Navy">
<IMG SRC="../graphics/header.gif" WIDTH=700 HEIGHT=34 BORDER=0>
<BR>
The mockup is under construction.
<BR>
The link to the old mockup is <A HREF="../TCES_bk_20020529/contact.jsp">here</A>.

</BODY>
</HTML>
