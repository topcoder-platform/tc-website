<HTML>
<HEAD>
<%@ include file="header.jsp" %>
<%@ page import="com.topcoder.web.project.common.UserMessage" %>
</HEAD>

<%@ include file="stylesheet.jsp" %>
<%@ include file="body.jsp" %>
<%@ include file="nav.jsp" %>

<%
	// Get key from params
	String s_messageId = "" + htParams.get("messageId");
	UserMessage message = new UserMessage();
	boolean invalid = false;

	try {
		message = ProjectBean.getUserMessageById(Integer.parseInt(s_messageId));
		invalid = (message == null);
                if (message.getReceiver_id() == user_id) {
                    ProjectBean.setMessageReadDate(message.getUser_message_id(), new java.util.Date());
                }
	} catch (NumberFormatException nfe) {
		invalid = true;
	}
%>

<% if (invalid) { %> <SCRIPT Language="Javascript1.2">submitPage('<%= pt_vp %>', 'message', '<%= ACTION_NONE %>', '');</SCRIPT> <% } %>

<DIV CLASS=box>
	<DIV CLASS=subheader>
		<NOBR>&nbsp;Read Message</NOBR>
	</DIV>
</DIV>

<TABLE WIDTH="<%= tableWidth %>">
    <TR VALIGN="TOP"><TD><DIV CLASS=content>From</DIV></TD><TD>&nbsp;</TD><TD><DIV CLASS=content><%= ProjectBean.getUserString(new Integer(message.getSender_id())) %></DIV></TD></TR>
    <TR VALIGN="TOP"><TD><DIV CLASS=content>Subject</DIV></TD><TD>&nbsp;</TD><TD><DIV CLASS=content><%= message.getSubject() %></DIV></TD></TR>
    <TR VALIGN="TOP"><TD><DIV CLASS=content>Message</DIV></TD><TD>&nbsp;</TD><TD><DIV CLASS=content><%= message.getMessage() %></DIV></TD></TR>
</TABLE>

<TABLE WIDTH="<%= tableWidth %>">
    <TR>
        <TD ALIGN="LEFT">
            <% pt_params = "[toUserId=" + message.getSender_id() + "]"; %>
            <FORM NAME="frmMessage_Read" ACTION="/ProjectCtxServlet" METHOD="POST">
                    <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
                    <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="message_write">
                    <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_MESSAGE_WRITE %>">
                    <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
                    <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Reply">
            </FORM>
        </TD>
        <TD ALIGN="LEFT" WIDTH="100%">
            <% pt_params = "[messageId=" + message.getUser_message_id() + "]"; %>
            <FORM NAME="frmMessage_Read" ACTION="/ProjectCtxServlet" METHOD="POST">
                    <INPUT TYPE="HIDDEN" NAME="pt_vp" VALUE="<%= pt_vp %>">
                    <INPUT TYPE="HIDDEN" NAME="pt_page" VALUE="message">
                    <INPUT TYPE="HIDDEN" NAME="pt_action" VALUE="<%= ACTION_MESSAGE_DELETE %>">
                    <INPUT TYPE="HIDDEN" NAME="pt_params" VALUE="<%= pt_params %>">
                    <INPUT TYPE="SUBMIT" NAME="butSubmit" VALUE="Delete">
            </FORM>
        </TD>
    </TR>
</TABLE>

</BODY>
</HTML>