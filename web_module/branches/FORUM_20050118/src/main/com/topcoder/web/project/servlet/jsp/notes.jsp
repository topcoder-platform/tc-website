<HTML>
<HEAD>
<%@ include file="header.jsp" %>
</HEAD>

<%@ include file="stylesheet.jsp" %>
<%@ include file="body.jsp" %>
<%@ include file="nav.jsp" %>

<%
	String frmSendError = "";
	
	if (pt_action == ACTION_MESSAGE_USER) {
		String toHandle = request.getParameter("txtToHandle");
		if (toHandle == null) { frmSendError += "This page was called with invalid parameters.<BR>"; }
		int to_user_id = ProjectBean.getUserId(toHandle);
		if (to_user_id < 0) { frmSendError += "The handle '" + toHandle + "' was not found.<BR>"; }
		if (frmSendError.length() == 0) {
			nav_message_write.setParams("[toUserId=" + to_user_id + "]");
			nav_message_write.setAction(ACTION_MESSAGE_WRITE);
%>
			<%= nav_message_write.redirectJS() %>
<%
		}
	}
%>

<DIV CLASS=box>
	<DIV CLASS=subheader>
		<NOBR>&nbsp;Read Messages</NOBR>
	</DIV>
</DIV>

<DIV CLASS=content>
</DIV>

<BR>

<DIV CLASS=box>
	<DIV CLASS=subheader>
		<NOBR>&nbsp;Sent Messages</NOBR>
	</DIV>
</DIV>

<DIV CLASS=content>
</DIV>

<BR>

<DIV CLASS=box>
	<DIV CLASS=subheader>
		<NOBR>&nbsp;Send Message</NOBR>
	</DIV>
</DIV>

<FORM NAME="frmMessage_Write" ACTION="/ProjectCtxServlet" METHOD="POST">
<% if (frmSendError.length() > 0) { %>
<DIV CLASS=error>&nbsp;&nbsp;ERROR:&nbsp;<%= frmSendError %></DIV>
<% } %>

<DIV CLASS=content>
	<INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
	<INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="message">
	<INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_MESSAGE_USER %>">
	<INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
	Handle <INPUT TYPE="TEXT" NAME="txtToHandle" VALUE="">
	<INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Send">
</DIV>
</FORM>

</BODY>
</HTML>