<HTML>
<HEAD>
<%@ include file="header.jsp" %>
</HEAD>

<%@ include file="stylesheet.jsp" %>
<%@ include file="body.jsp" %>
<%@ include file="nav.jsp" %>

<DIV CLASS=box>
	<DIV CLASS=subheader>
		<NOBR>&nbsp;Write Note</NOBR>
	</DIV>
</DIV>

<% if (pt_action == ACTION_MESSAGE_SEND) { %>
	<%
		String frmSendError = "";
		// Get key from params
		String s_toUserId = "" + htParams.get("toUserId");
		int toUserId = 0;
		try {
			toUserId = Integer.parseInt(s_toUserId);
			
			// Get note content and save to db
			String taNote = request.getParameter("taNote");
			if (taNote == null) {
				frmSendError += "This page was called with invalid parameters (taNote).<BR>";
			} else {
				if (taNote.trim().length() == 0) { frmSendError += "Note cannot be blank.<BR>"; }
				if (taNote.indexOf("JEddie") > -1) { frmSendError += "Note cannot contain 'JEddie'.<BR>"; }
			}
		} catch (NumberFormatException nfe) {
			frmSendError += "This page was called with invalid parameters (toUserId).<BR>";
		}
	%>
	<%
			if (frmSendError.length() > 0) {
				pt_action = ACTION_MESSAGE_WRITE;
	%>
				<DIV CLASS=error>&nbsp;&nbsp;ERROR:&nbsp;<%= frmSendError %></DIV>
	<%
			} else {
				nav_message_write.setAction(ACTION_MESSAGE_SENT);
				nav_message_write.setParams("");				
	%>
				<%= nav_message_write.redirectJS() %>
	<%
			}
	%>
<% } %>

<% if (pt_action == ACTION_MESSAGE_WRITE) { %>
	<%
		String frmWriteError = "";
		// Get key from params
		String s_toUserId = "" + htParams.get("toUserId");
		int toUserId = 0;
		String taMessage = request.getParameter("taMessage");
		if (taMessage == null) taNote = "";
		try {
			toUserId = Integer.parseInt(s_toUserId);
		} catch (NumberFormatException nfe) {
			frmWriteError += "This page was called with invalid parameters. (toUserId)<BR>";
		}
	%>
	<% if (frmWriteError.length() > 0) { %>
		<DIV CLASS=error>&nbsp;&nbsp;ERROR:&nbsp;<%= frmWriteError %></DIV>				
	<% } %>
		<FORM NAME="frmMessage_Write" ACTION="/ProjectCtxServlet" METHOD="POST">
			<INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
			<INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="<%= pt_page %>">
			<INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_MESSAGE_SEND %>">
			<INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
			<TABLE>
				<TR><TD><DIV CLASS=content>Send message to: <%= ProjectBean.getUserString(new Integer(toUserId)) %></DIV></TD></TR>
				<TR><TD><TEXTAREA NAME="taMessage" ROWS=5 COLS=60><%= taMessage %></TEXTAREA></TD></TR>
				<TR><TD><INPUT TYPE=SUBMIT NAME="butSubmit" VALUE="Send"></TD></TR>
			</TABLE>
		</FORM>
<% } %>

<% if (pt_action == ACTION_MESSAGE_SENT) { %>
<DIV CLASS=content>
	Your message was sent successfully.
</DIV>			
<% } %>


</BODY>
</HTML>