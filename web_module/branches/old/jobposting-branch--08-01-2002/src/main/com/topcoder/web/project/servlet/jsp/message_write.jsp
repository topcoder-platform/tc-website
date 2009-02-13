<HTML>
<HEAD>
<%@ include file="header.jsp" %>
<%@ page import="com.topcoder.web.project.common.UserMessage" %>
</HEAD>

<%@ include file="stylesheet.jsp" %>
<%@ include file="body.jsp" %>
<%@ include file="nav.jsp" %>

<DIV CLASS=box>
	<DIV CLASS=subheader>
		<NOBR>&nbsp;Write Message</NOBR>
	</DIV>
</DIV>

<% if (pt_action == ACTION_MESSAGE_SEND) { %>
<%
	String frmSendError = "";
	// Get key from params
	String s_toUserId = "" + htParams.get("toUserId");
        String taMessage = "";
        String txtSubject = "";
	int toUserId = 0;
	try {
            toUserId = Integer.parseInt(s_toUserId);
            taMessage = request.getParameter("taMessage");
            txtSubject = request.getParameter("txtSubject");
            if (taMessage == null || txtSubject == null) {
                frmSendError += "This page was called with invalid parameters (txtSubject/taMessage).<BR>";
            } else {
                if (txtSubject.trim().length() == 0) { frmSendError += "Subject cannot be blank.<BR>"; }
                if (taMessage.trim().length() == 0) { frmSendError += "Message cannot be blank.<BR>"; }
                if (taMessage.indexOf("JEddie") > -1) { frmSendError += "Message cannot contain 'JEddie'.<BR>"; }
            }
	} catch (NumberFormatException nfe) { frmSendError += "This page was called with invalid parameters (toUserId).<BR>"; }
	if (frmSendError.length() > 0) {
            pt_action = ACTION_MESSAGE_WRITE;
%>
            <DIV CLASS=error>ERROR<BR><%= frmSendError %></DIV>
<%
	} else {
            // save message
            UserMessage userMessage = new UserMessage();
            userMessage.setMessage(taMessage);
            userMessage.setSubject(txtSubject);
            userMessage.setSender_id(user_id);
            userMessage.setReceiver_id(toUserId);
            userMessage.setReceiver_folder(FOLDER_INBOX);
            userMessage.setSender_folder(FOLDER_SENTBOX);
            ProjectBean.addUserMessage(userMessage);
            nav_message_write.setAction(ACTION_MESSAGE_SENT);
            nav_message_write.setParams("");
%>
            <%= nav_message_write.redirectJS() %>
<%
	}
} %>

<% if (pt_action == ACTION_MESSAGE_WRITE) { %>
	<%
		String frmWriteError = "";
		// Get key from params
		String s_toUserId = "" + htParams.get("toUserId");
		int toUserId = 0;
		String taMessage = request.getParameter("taMessage");
		String txtSubject = request.getParameter("txtSubject");
		if (taMessage == null) taMessage = "";
		if (txtSubject == null) txtSubject = "";
		try {
			toUserId = Integer.parseInt(s_toUserId);
		} catch (NumberFormatException nfe) {
			frmWriteError += "This page was called with invalid parameters. (toUserId)<BR>";
		}
	%>
	<% if (frmWriteError.length() > 0) { %>
		<DIV CLASS=error>ERROR<BR><%= frmWriteError %></DIV>				
	<% } %>
		<FORM NAME="frmMessage_Write" ACTION="/ProjectCtxServlet" METHOD="POST">
			<INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
			<INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="<%= pt_page %>">
			<INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_MESSAGE_SEND %>">
			<INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
			<TABLE>
				<TR VALIGN="TOP"><TD><DIV CLASS=content>Send To</DIV></TD><TD>&nbsp;</TD><TD><DIV CLASS=content><%= ProjectBean.getUserString(new Integer(toUserId)) %></DIV></TD></TR>
				<TR VALIGN="TOP"><TD><DIV CLASS=content>Subject</DIV></TD><TD>&nbsp;</TD><TD><INPUT TYPE="TEXT" NAME="txtSubject" VALUE="<%= txtSubject %>" SIZE=30 MAXLENGTH=50></TD></TR>
				<TR VALIGN="TOP"><TD><DIV CLASS=content>Message</DIV></TD><TD>&nbsp;</TD><TD><TEXTAREA NAME="taMessage" ROWS=5 COLS=60><%= taMessage %></TEXTAREA></TD></TR>
				<TR VALIGN="TOP"><TD><INPUT TYPE=SUBMIT NAME="butSubmit" VALUE="Send"></TD></TR>
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