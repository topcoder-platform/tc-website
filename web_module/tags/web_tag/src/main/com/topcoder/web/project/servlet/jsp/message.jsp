<HTML>
<HEAD>
<%@ include file="header.jsp" %>
<%@ page import="com.topcoder.web.project.common.UserMessage" %>
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

        if (pt_action == ACTION_MESSAGE_DELETE) {
            String s_messageId = "" + htParams.get("messageId");
            try {
                UserMessage userMessage = ProjectBean.getUserMessageById(Integer.parseInt(s_messageId));
                if (userMessage.getReceiver_id() == user_id) {
                    // Set receiver folder to trash
                    ProjectBean.setReceiverUserMessageFolder(userMessage.getUser_message_id(), FOLDER_TRASH);
                } else {
                    // Set sender folder to trash
                    ProjectBean.setSenderUserMessageFolder(userMessage.getUser_message_id(), FOLDER_TRASH);
                }
            } catch (NumberFormatException nfe) {
            }
        }

        if (pt_action == ACTION_MESSAGE_MARK_UNREAD) {
            String s_messageId = "" + htParams.get("messageId");
            try {
                UserMessage userMessage = ProjectBean.getUserMessageById(Integer.parseInt(s_messageId));
                ProjectBean.setMessageReadDate(userMessage.getUser_message_id(), null);
            } catch (NumberFormatException nfe) {
            }
        }

        if (pt_action == ACTION_MESSAGE_MARK_READ) {
            String s_messageId = "" + htParams.get("messageId");
            try {
                UserMessage userMessage = ProjectBean.getUserMessageById(Integer.parseInt(s_messageId));
                ProjectBean.setMessageReadDate(userMessage.getUser_message_id(), new java.util.Date());
            } catch (NumberFormatException nfe) {
            }
        }
%>

<DIV CLASS=box>
	<DIV CLASS=subheader>
		<NOBR>&nbsp;In Box</NOBR>
	</DIV>
</DIV>

<TABLE WIDTH="<%= tableWidth %>">
    <TR BGCOLOR="#ABABCC">
        <TD WIDTH="15%"><DIV CLASS=mcontent>ACTION</DIV></TD>
        <TD WIDTH="40%"><DIV CLASS=mcontent>SUBJECT</DIV></TD>
        <TD WIDTH="15%"><DIV CLASS=mcontent>FROM</DIV></TD>
        <TD WIDTH="15%"><DIV CLASS=mcontent>SENT DATE</DIV></TD>
        <TD WIDTH="15%"><DIV CLASS=mcontent>STATUS</DIV></TD>
    </TR>
<%
    ArrayList alRead = ProjectBean.getUserMessages(0, user_id, 0, FOLDER_INBOX);
    boolean wasRead = false;
    for (int id = 0; id < alRead.size(); id++) {
	UserMessage userMessage = (UserMessage) alRead.get(id);
        wasRead = userMessage.getRead_date() != null;
%>
    <TR BGCOLOR="<%= (id % 2 == 0 ? "CDCDEE" : "BCBCDD" ) %>">
        <TD><DIV CLASS=content><NOBR>
            <% nav_generic.setLink(pt_vp, "message_read", ACTION_NONE, "[messageId=" + userMessage.getUser_message_id() + "]"); %>
            [<%= nav_generic.displayLink("V") %>]
            <% nav_generic.setLink(pt_vp, "message", ACTION_MESSAGE_MARK_UNREAD, "[messageId=" + userMessage.getUser_message_id() + "]"); %>
            [<%= nav_generic.displayLink("M") %>]
            <% nav_generic.setLink(pt_vp, "message", ACTION_MESSAGE_DELETE, "[messageId=" + userMessage.getUser_message_id() + "]"); %>
            [<%= nav_generic.displayLink("D") %>]
        </NOBR></DIV></TD>
        <TD><DIV CLASS=content><%= userMessage.getSubject() %></DIV></TD>
        <TD><DIV CLASS=content><%= ProjectBean.getUserString(new Integer(userMessage.getSender_id())) %></DIV></TD>
        <TD><DIV CLASS=content><%= userMessage.getSent_date() %></DIV></TD>
        <TD><DIV CLASS=content><%= (wasRead ? "Read (" + userMessage.getRead_date() + ")" : "Unread") %></DIV></TD>
    </TR>
<% } %>
</TABLE>

<BR>

<DIV CLASS=box>
	<DIV CLASS=subheader>
		<NOBR>&nbsp;Sent Box</NOBR>
	</DIV>
</DIV>

<TABLE WIDTH="<%= tableWidth %>">
    <TR BGCOLOR="#ABABCC">
        <TD WIDTH="15%"><DIV CLASS=mcontent>ACTION</DIV></TD>
        <TD WIDTH="55"><DIV CLASS=mcontent>SUBJECT</DIV></TD>
        <TD WIDTH="15%"><DIV CLASS=mcontent>TO</DIV></TD>
        <TD WIDTH="15%"><DIV CLASS=mcontent>SENT DATE</DIV></TD>
    </TR>
<%
    ArrayList alSent = ProjectBean.getUserMessages(user_id, 0, FOLDER_SENTBOX, 0);
    for (int id = 0; id < alSent.size(); id++) {
	UserMessage userMessage = (UserMessage) alSent.get(id);
%>
    <TR BGCOLOR="<%= (id % 2 == 0 ? "CDCDEE" : "BCBCDD" ) %>">
        <TD><DIV CLASS=content><NOBR>
            <% nav_generic.setLink(pt_vp, "message_read", ACTION_NONE, "[messageId=" + userMessage.getUser_message_id() + "]"); %>
            [<%= nav_generic.displayLink("V") %>]
            <% nav_generic.setLink(pt_vp, "message", ACTION_MESSAGE_DELETE, "[messageId=" + userMessage.getUser_message_id() + "]"); %>
            [<%= nav_generic.displayLink("D") %>]
        </NOBR></DIV></TD>
        <TD><DIV CLASS=content><%= userMessage.getSubject() %></DIV></TD>
        <TD><DIV CLASS=content><%= ProjectBean.getUserString(new Integer(userMessage.getReceiver_id())) %></DIV></TD>
        <TD><DIV CLASS=content><%= userMessage.getSent_date() %></DIV></TD>
    </TR>
<% } %>
</TABLE>

<BR>

<DIV CLASS=box>
	<DIV CLASS=subheader>
		<NOBR>&nbsp;Send Message</NOBR>
	</DIV>
</DIV>

<FORM NAME="frmMessage_Write" ACTION="/ProjectCtxServlet" METHOD="POST">
<% if (frmSendError.length() > 0) { %>
<DIV CLASS=error>ERROR<BR><%= frmSendError %></DIV>
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