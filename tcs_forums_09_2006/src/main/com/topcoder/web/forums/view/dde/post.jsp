<%@ page import="com.topcoder.web.common.BaseServlet,
                com.topcoder.web.common.BaseProcessor,
                com.topcoder.web.forums.ForumConstants,
                com.topcoder.web.forums.controller.ForumsUtil,
                com.jivesoftware.forum.stats.ViewCountManager,
                com.jivesoftware.forum.ForumMessage,
                com.jivesoftware.forum.ForumThread,
                java.util.*,
                com.jivesoftware.base.action.ActionUtils,
                com.jivesoftware.util.ByteFormat,
                com.jivesoftware.forum.Attachment,
                com.jivesoftware.forum.action.PostAction,
                com.jivesoftware.forum.AttachmentManager,
                com.jivesoftware.forum.proxy.AttachmentProxy,
                com.topcoder.web.forums.controller.request.Post"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postMode" name="postMode" type="java.lang.String" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  ForumMessage message = (ForumMessage)request.getSession().getAttribute("tempMessage");
	if(message == null) {
		message = (ForumMessage)request.getAttribute("tempMessage");
	}
    ForumThread thread = (ForumThread)request.getAttribute("thread");
    HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY); %>

<script type="text/javascript">
function noenter(e)
{
    var k = (window.event)? event.keyCode: e.which;
    return !(k == 13);
}

function toggle(targetId)
{
    target = document.getElementById(targetId);
    if (target.style.display == "none") {
        target.style.display="";
    } else {
        target.style.display="none";
    }
}

function AllowTabCharacter() {
    // IE only
    if (navigator.appName.indexOf('Microsoft') != -1) {
	    if (event != null) {
	        if (event.srcElement) {
	            if (event.srcElement.value) {
	                if (event.keyCode == 9) {  // tab character
	                    if (document.selection != null) {
	                        document.selection.createRange().text = '\t';
	                        event.returnValue = false;
	                    } else {
	                        event.srcElement.value += '\t';
	                        return false;
	                    }
	                }
	            }
	        }
	    }
    }
}
</script>

<html>
<head>
<title>TopCoder Software Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    
        <jsp:include page="/style.jsp">
          <jsp:param name="key" value="tcs_forums"/>
        </jsp:include>

</head>

<body>

<jsp:include page="includes/top.jsp"/>
<jsp:include page="includes/menu.jsp">
    <jsp:param name="isSoftwarePage" value="true"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
      <td width="180" class="leftColumn">
        <jsp:include page="includes/left.jsp" >
            <jsp:param name="level1" value="forum"/>
            <jsp:param name="level2" value="all"/>
        </jsp:include>
      </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<%  String postHeading = "";
    String postDesc = "";

   if (postMode.equals("New")) {
      postHeading = "New Thread";
      postDesc = "Create a new thread";
   } else if (postMode.equals("Reply")) {
      String replySubject = message.getSubject();
      if (!replySubject.startsWith("Re: ")) {
           replySubject = "Re: " + replySubject;
        }
      postHeading = replySubject;
      postDesc = "Reply";
   } else if (postMode.equals("Edit")) {
      String editSubject = message.getSubject();
      if (!editSubject.startsWith("Edit: ")) {
           editSubject = "Edit: " + editSubject;
        }
      postHeading = editSubject;
      postDesc = "Edit message";
   } %>

        <td width="100%" class="rtBody">

        <jsp:include page="page_title.jsp" >
            <jsp:param name="image" value="forums"/>
            <jsp:param name="title" value="<%=postDesc%>"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
   <td class="categoriesBox" style="padding-right: 20px;">
      <jsp:include page="categoriesHeader.jsp" />
   </td>
   <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
       <jsp:include page="searchHeader.jsp" />
   </td>
</tr>

<tr><td colspan="2" style="padding-bottom:3px;"><b>
       <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>" class="rtbcLink"><jsp:getProperty name="category" property="name"/></A> >
       </tc-webtag:iterator>
         <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A>
            <%   if (thread != null) { %>
               > <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="thread" property="name"/></A>
            <%   } %>
            > <%=postHeading%>
       </b></td>
       <!--<td align="right" class="rtbc"><a href="javascript:toggle('Options')" class="rtbcLink">Options</a></td>-->
   </tr>
</table>
<br><div id="Options">Allowed tags: <%=ForumsUtil.getAllowedTagsDisplay()%>. Allowed attributes: <%=ForumsUtil.getAllowedAttributesDisplay()%>. Syntax highlighting is applied to text within [code][/code], [cpp][/cpp], [java][/java], [c#][/c#], and [vb][/vb] blocks. Usernames within [handle][/handle] blocks are converted into color-coded links.</div>
<p><b>Please do not cross post, most people read all posts and will not appreciate reading yours twice.</b></p>
            <table cellpadding="0" cellspacing="0" class="rtTable">
<form name="postform" method="post" action="<jsp:getProperty name="sessionInfo" property="servletPath"/>">
<tc-webtag:hiddenInput name="module"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>

<tr><td class="rtHeader" colspan="2"><%=postHeading%></td></tr>
<tr>
<td class="rtPosterCell" rowspan="3"><div class="rtPosterSpacer">
<%  if (ForumsUtil.displayMemberPhoto(user, user)) { %>
   <img src="<%=user.getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br/>
<%  } %>
<span class="bodyText"><tc-webtag:handle coderId="<%=user.getID()%>"/></span><br/><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=user.getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(user), "post")%></A></div></td>
<td class="rtTextCell100">

<%  if (errors.get(ForumConstants.ATTACHMENT_ERROR) != null) { %>
	<span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.ATTACHMENT_ERROR%>"><%=err%><br/></tc-webtag:errorIterator></span>
<% } %>

<%  if (errors.get(ForumConstants.MESSAGE_SUBJECT) != null) { %>
	<span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_SUBJECT%>"><%=err%><br/></tc-webtag:errorIterator></span>
<% } %>
<b>Subject:</b><br/><tc-webtag:textInput size="60" name="<%=ForumConstants.MESSAGE_SUBJECT%>" onKeyPress="return noenter(event)"/>
<br/>
<br/>
<%  if (errors.get(ForumConstants.MESSAGE_BODY) != null) { %>
	<span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_BODY%>"><%=err%><br/></tc-webtag:errorIterator></span>
<% } %>
<b>Body:</b><font color="red"><span align="left" id="Warning" style="display: none"><br/>Warning: one or more &lt;pre&gt; tags is not closed.</span></font>
<br/>
<tc-webtag:textArea id="tcPostArea" rows="15" cols="72" name="<%=ForumConstants.MESSAGE_BODY%>" onKeyDown="AllowTabCharacter()"/>
</td>
</tr>
<tr>
	<td class="rtFooter">
		<input type="image" src="http://forums.dev.topcoder.com/i/roundTables/post.gif" class="rtButton" alt="Post" onclick="postform.module.value='PostMessage'"/>
		<input type="image" src="http://forums.dev.topcoder.com/i/roundTables/preview.gif" class="rtButton" alt="Preview" onclick="postform.module.value='PreviewMessage'"/>
		<%  if (ForumsUtil.userCanAttach((Map) session.getAttribute("roleMap"), forum)) {

        %>
            <%-- Attach files --%>
            <!--input type="submit" name="doAttach" value="Attach Files" /-->
            <input type="image" class="rtButton" alt="Attach Files" onclick="postform.module.value='AttachFiles'"/>

        <%
            }
        %>
	</td>
</tr>
<tr>
<td class="rtFooter">
<table>

<%  // attachment list start
	Iterator attachments = message.getAttachments();
    int attachCounter = 0;
    if (attachments.hasNext()) {
%>
    <tr valign="top">
        <td>
            Attachments:
        </td>
        
        <td>
            <table cellpadding="0" cellspacing="0" border="0" width="100%">

            <%  // Loop thru attachments, print out info:
                ByteFormat byteFormatter = new ByteFormat();
                while (attachments.hasNext()) {
                    Attachment attachment = (Attachment)attachments.next();
                    attachCounter ++;
            %>
                <tr valign="top">
                    <td width="1%">

                        <table cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td nowrap class="jive-attach-item">
                                <A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>"><%= attachment.getName() %></A>
                                (<%= byteFormatter.format(attachment.getSize()) %>)
                                [<A href="?module=RemoveAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>&<%=ForumConstants.POST_MODE%>=<%=request.getAttribute("postMode")%>&<%=ForumConstants.MESSAGE_ID%>=<%=request.getParameter(ForumConstants.MESSAGE_ID)%>" target="_blank">remove</A>]
                            </td>
                        </tr>
                        </table>

                    </td>
                </tr>

            <%  } %>

            </table>
        </td>
    </tr>

<%  }
	// attachment list end
%>

</table>
</td>
</tr>
</form>
</table>

<%  if (postMode.equals("Edit") || postMode.equals("Reply")) { %>
        <span class="bodySubtitle">Original Message</span><br/>
        <table cellpadding="0" cellspacing="0" class="rtTable">
        <tr><td class="rtHeader" colspan="2"><a name=<jsp:getProperty name="message" property="ID"/>><tc-webtag:beanWrite name="message" property="modificationDate" format="MMM d, yyyy 'at' h:mm a z"/> | <jsp:getProperty name="message" property="subject"/>
        <%  if (message.getParentMessage() != null) { %>
            (response to <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%>" class="rtbcLink">post</A> by <tc-webtag:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/>)
        <%  } %>
        </a></td></tr>
        <% 
        ForumMessage originalMsg = (ForumMessage) request.getAttribute("message");
        if (originalMsg.getAttachmentCount() > 0) {
        %>
		  <tr>
			  <td class="rtHeader" colspan="2" width="100%">
				Attachments:
				<%
				Iterator originalMsgAttachments = originalMsg.getAttachments();
				while(originalMsgAttachments.hasNext()) {
					AttachmentProxy attachment = (AttachmentProxy) originalMsgAttachments.next();
				%>
					&nbsp;&nbsp;<A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>"><%= attachment.getName() %></A>&nbsp;&nbsp;
				<% } %>
			  </td>
		  </tr>
       <% } %>
        <tr>
        <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
        <%  if (ForumsUtil.displayMemberPhoto(user, message.getUser())) { %>
            <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br/>
        <%  } %>
        <span class="bodyText"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></span><br/><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(message.getUser()), "post")%></A></div></td>
        <td class="rtTextCell100"><jsp:getProperty name="message" property="body"/></td>
        </tr>
        </table>
<%  } %>
<font color="red"><div align="left" id="Warning" style="display: none">Warning: one or more &lt;pre&gt; tags is not closed.</div></font>

        <p><br/></p>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="includes/foot.jsp" />

</body>

</html>