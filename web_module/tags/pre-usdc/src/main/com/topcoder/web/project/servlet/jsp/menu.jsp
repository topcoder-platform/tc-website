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
        &nbsp;Messages
    </DIV>
</DIV>

<DIV CLASS=content>
<%
    int numMessages = 0;
    ArrayList alRead = ProjectBean.getUserMessages(0, user_id, 0, FOLDER_INBOX);
    for (int id = 0; id < alRead.size(); id++) {
        UserMessage userMessage = (UserMessage) alRead.get(id);
        if (userMessage.getRead_date() == null) numMessages++;
    }
%>
<% nav_generic.setLink(pt_vp, "message", ACTION_NONE, ""); %>             
<%= (numMessages == 0 ? "- No new messages." : "- You have " + nav_generic.displayLink("" + numMessages) + " new message(s).") %>
</DIV>

<BR>

<DIV CLASS=box>
    <DIV CLASS=subheader>
        &nbsp;Change Viewpoint
    </DIV>
</DIV>

<DIV CLASS="content">
<% for (int i=1; i < arrGroups.length; i++) { %>
    <% if (groups.indexOf("[" + i + "]") > -1) { %>
        - <A HREF="javascript:submitPage('<%= "" + i %>', 'menu', '<%= ACTION_NONE %>', '<%= pt_params %>');"><%= arrGroups[i] %> View</A>
        <BR>
    <% } %>
<% } %>
</DIV>

</BODY>
</HTML>