<%@ page import="com.jivesoftware.forum.Attachment,
                com.jivesoftware.forum.ForumMessage,
                com.jivesoftware.forum.ForumPermissions,
                com.jivesoftware.forum.ForumThread,
                com.jivesoftware.forum.database.DbAttachmentManager,
                com.topcoder.web.common.BaseProcessor,
                com.topcoder.web.forums.ForumConstants,
                com.topcoder.web.forums.controller.ForumsUtil,
                java.util.HashMap,
                java.util.Iterator"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="message" name="message" type="com.jivesoftware.forum.ForumMessage" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postMode" name="postMode" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%  ForumMessage parentMessage = (ForumMessage)request.getAttribute("parentMessage");
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
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<title>TopCoder Forums</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="script.jsp" />
        <jsp:include page="/style.jsp">
          <jsp:param name="key" value="tc_forums"/>
        </jsp:include>

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="forums"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
      <td width="180">
          <jsp:include page="includes/global_left.jsp">
             <jsp:param name="node" value="forums"/>
          </jsp:include>
      </td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
        <td width="100%" class="rtBody">

            <jsp:include page="page_title.jsp" >
                <jsp:param name="image" value="forums"/>
                <jsp:param name="title" value="Message Preview"/>
            </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr>
   <td class="categoriesBox" style="padding-right: 20px;">
      <jsp:include page="categoriesHeader.jsp" />
   </td>
   <td nowrap="nowrap" valign="top" style="padding-right: 20px;">
       <jsp:include page="searchHeader.jsp" />
   </td>
</tr>

<tr><td colspan="2" style="padding-bottom:3px;" class='breadcrumbs'><b>
       <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A> <img src="/i/interface/exp_w.gif" align="absmiddle"/> 
       </tc-webtag:iterator>
         <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></A>
            <%   if (thread != null) { %>
            <img src="/i/interface/exp_w.gif" align="absmiddle"/> <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>" class="rtbcLink"><%=thread.getName()%></A>
            <%   } %>
            <img src="/i/interface/exp_w.gif" align="absmiddle"/> <%=message.getSubject()%>
       </td>
    </tr>
</table>
<br/><div id="Options">Allowed tags: <%=ForumsUtil.getAllowedTagsDisplay()%>. Allowed attributes: <%=ForumsUtil.getAllowedAttributesDisplay()%>. Syntax highlighting is applied to text within [code][/code], [cpp][/cpp], [java][/java], [c#][/c#], [vb][/vb], and [py][/py] blocks. Usernames within [handle][/handle] and [h][/h] blocks are converted into color-coded links.</div>
<br>
<span class="bodySubtitle">Message Preview</span><br/>
<table cellpadding="0" cellspacing="0" class="rtTable rtTablePost">
   <tr>
        <td class="rtHeader" colspan="2">
            <div valign="top" style="float: right; padding-left: 5px; white-space: nowrap;">
               <a name=<%=message.getID()%>><tc-webtag:format object="${message.creationDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></a>
            </div>
            <%=message.getSubject()%>
         <%   if (parentMessage != null) { %>
               (response to <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=parentMessage.getID()%>" class="rtbcLink">post</A> by <tc-webtag:handle coderId="<%=parentMessage.getUser().getID()%>"/>)
         <%   } %>
        </td>
    </tr>
    <%     if (message.getAttachmentCount() > 0) { %>
        <tr>
            <td class="rtHeader" colspan="2">
                Attachments:
                <%    Iterator attachments = message.getAttachments();
                    while(attachments.hasNext()) {
                        Attachment attachment = (Attachment)attachments.next(); %>&nbsp;
                        <A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>"><img align="absmiddle" src="/i/roundTables/icons/<%=DbAttachmentManager.getThumbnailImage(attachment.getContentType())%>" border="0" alt="Attachment" /></A>
                        <A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>" class="rtbcLink"><%=attachment.getName()%></A> (<%=ForumsUtil.getFileSizeStr(attachment.getSize())%>)&nbsp;&nbsp;
                <%     } %>
            </td>
        </tr>
    <% } %>
    <tr>
       <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
       <%  if (ForumsUtil.displayMemberPhoto(user, user)) { %>
          <img src="<%=user.getProperty("imagePath")%>" width="61" height="61" border="0" class="rtPhoto" /><br/>
       <%  } %>
       <span class="bodyText"><tc-webtag:handle coderId="<%=user.getID()%>"/></span><br/><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=user.getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(user), "post")%></A></div></td>
       <td class="rtTextCell100"><%=message.getBody()%></td>
    </tr>
</table>

<span class="bodySubtitle">Edit Message</span><br/>
<table cellpadding="0" cellspacing="0" class="rtTable rtTablePost">
<form name="form1" method="post" action="<%=sessionInfo.getServletPath()%>">
<tc-webtag:hiddenInput name="module"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.TEMP_MESSAGE_ID%>"/>
<tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>

<tr><td class="rtHeader" colspan="2"><%=message.getSubject()%></td></tr>
<%     if (message.getAttachmentCount() > 0) { %>
        <tr>
            <td class="rtHeader" colspan="2">
                Attachments:
                <%    Iterator attachments = message.getAttachments();
                    while(attachments.hasNext()) {
                        Attachment attachment = (Attachment)attachments.next(); %>&nbsp;
                        <A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>"><img align="absmiddle" src="/i/roundTables/icons/<%=DbAttachmentManager.getThumbnailImage(attachment.getContentType())%>" border="0" alt="Attachment" /></A>
                        <A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>" class="rtbcLink"><%=attachment.getName()%></A> (<%=ForumsUtil.getFileSizeStr(attachment.getSize())%>)&nbsp;&nbsp;
                <%     } %>
            </td>
        </tr>
<% } %>
<tr>
<td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
<%  if (ForumsUtil.displayMemberPhoto(user, user)) { %>
   <img src="<%=user.getProperty("imagePath")%>" width="61" height="61" border="0" class="rtPhoto" /><br/>
<%  } %>
<span class="bodyText"><tc-webtag:handle coderId="<%=user.getID()%>"/></span><br/><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=user.getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(user), "post")%></A></div></td>
<td class="rtTextCell100">
<%     if (errors.get(ForumConstants.ATTACHMENT_ERROR) != null) { %>
        <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.ATTACHMENT_ERROR%>"><%=err%><br/></tc-webtag:errorIterator></span>
<%     } %>
<% if (errors.get(ForumConstants.MESSAGE_SUBJECT) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_SUBJECT%>"><%=err%></tc-webtag:errorIterator><br/></span><% } %>
<b>Subject:</b><br/><tc-webtag:textInput size="60" name="<%=ForumConstants.MESSAGE_SUBJECT%>" escapeHtml="false" onKeyPress="return noenter(event)"/><br/><br/>
<% if (errors.get(ForumConstants.MESSAGE_BODY) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_BODY%>"><%=err%></tc-webtag:errorIterator><br/></span><% } %>
<b>Body:</b><font color="red"><span align="left" id="Warning" style="display: none"><br/>Warning: one or more &lt;pre&gt; tags is not closed.</span></font>
<br/><tc-webtag:textArea id="tcPreviewArea" rows="15" cols="72" name="<%=ForumConstants.MESSAGE_BODY%>" onKeyDown="AllowTabCharacter()"/>

    <c:if test="${isNewStyle}">
        <div class="rtFooter">
            <a onclick="form1.module.value='PostMessage';form1.submit();" class="btn" href="javascript:;" alt="Post">Post</a>

            <a onclick="form1.module.value='PreviewMessage';form1.submit();" class="btn btnBlue" href="javascript:;" alt="Preview">Preview</a>

            <%    if (forum.isAuthorized(ForumPermissions.CREATE_MESSAGE_ATTACHMENT)) { %>
            <%    if (postMode.equals("Edit")) { %>
            <%    } else { %>
            <a onclick="form1.module.value='AttachFiles';form1.submit();" class="btn btnBlue" href="javascript:;" alt="Attach Files">Attach Files</a>
            <%    } %>
            <%    } %>
            <%    String cancelLink = "?module=ThreadList&"+ForumConstants.FORUM_ID+"="+forum.getID();
                if (message != null) {
                    cancelLink = "?module=Message&"+ForumConstants.MESSAGE_ID+"="+message.getID();
                } else if (thread != null) {
                    cancelLink = "?module=Thread&"+ForumConstants.THREAD_ID+"="+thread.getID();
                } %>
            <a href="<%=cancelLink%>" class="btn btnBlue">Cancel</a>
        </div>
    </c:if>


</td>
</tr>

<c:if test="${!isNewStyle}">
<tr>
    <td class="rtFooter">
        <input type="image" src="/i/roundTables/post.gif" class="rtButton" alt="Post" onclick="form1.module.value='PostMessage'"/>
        <input type="image" src="/i/roundTables/preview.gif" class="rtButton" alt="Preview" onclick="form1.module.value='PreviewMessage'"/>
        <%    if (forum.isAuthorized(ForumPermissions.CREATE_MESSAGE_ATTACHMENT)) { %>
            <%    if (!postMode.equals("Edit")) { %>
            <input type="image" src="/i/interface/btn_attach_files.gif" class="rtButton" alt="Attach Files" onclick="form1.module.value='AttachFiles'"/>
            <%    } %>
        <%    } %>
        <%    String cancelLink = "?module=ThreadList&"+ForumConstants.FORUM_ID+"="+forum.getID(); 
            if (parentMessage != null) {
                cancelLink = "?module=Message&"+ForumConstants.MESSAGE_ID+"="+parentMessage.getID();
            } else if (thread != null) {
                cancelLink = "?module=Thread&"+ForumConstants.THREAD_ID+"="+thread.getID();
            } %>
        <a href="<%=cancelLink%>"><img src="/i/interface/btn_cancel.gif" alt="Cancel"/></a>
    </td>
</tr>
</c:if>


</form></table>

<div style="clear:both;">&nbsp;</div>

</td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
