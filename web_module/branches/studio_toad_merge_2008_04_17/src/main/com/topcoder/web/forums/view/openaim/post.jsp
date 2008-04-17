<%@ page import="com.jivesoftware.forum.Attachment,
                 com.jivesoftware.forum.ForumMessage,
                 com.jivesoftware.forum.ForumPermissions,
                 com.jivesoftware.forum.ForumThread,
                 com.jivesoftware.forum.database.DbAttachmentManager,
                 com.topcoder.web.common.BaseProcessor,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 java.util.HashMap"
%>
<%@ page import="java.util.Iterator" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="openaim.tld" prefix="openaim" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postMode" name="postMode" type="java.lang.String" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<%     ForumMessage message = (ForumMessage) request.getAttribute("message");
    ForumMessage tempMessage = (ForumMessage)request.getAttribute("tempMessage");
    if (postMode.equals("Edit")) {
        tempMessage = message;
    }
    ForumThread thread = (ForumThread) request.getAttribute("thread");
    HashMap errors = (HashMap) request.getAttribute(BaseProcessor.ERRORS_KEY);

    String postHeading = "";
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


<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Open AIM Developer Challenge :: Powered by TopCoder</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_openaim_forums"/>
    </jsp:include>
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
            target.style.display = "";
        } else {
            target.style.display = "none";
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
</head>

<body>

<jsp:include page="tcTop.jsp"/>

<div align="center">
    <div id="aimFrame">
        <div id="aimFrameN">
            <div id="aimFrameS">

                <jsp:include page="openaimTop.jsp"/>

                <div class="content" align="right">
                    <div class="contentTexture">
                        <jsp:include page="topNav.jsp"/>
                        <div class="siteBoxFull">

<table cellpadding="0" cellspacing="0" class="rtbcTable">
                    <tr>
                        <td class="categoriesBox" style="padding-right: 20px;">
                            <jsp:include page="categoriesHeader.jsp"/>
                        </td>
                        <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
                            <jsp:include page="searchHeader.jsp"/>
                        </td>
                        <td align="right" nowrap="nowrap" valign="top">
                            <a href="?module=History" class="rtbcLink">My Post
                                History</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Watches" class="rtbcLink">My
                            Watches</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Settings" class="rtbcLink">User
                            Settings</a><br />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-bottom:3px;"><b>
                            <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
                                <a href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink">
                                    <%=category.getName()%>
                                </a> >
                            </tc-webtag:iterator>
                            <a href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink">
                                <%=forum.getName()%>
                            </a>
                            <% if (thread != null) { %>
                            >
                            <a href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>" class="rtbcLink">
                                <%=thread.getName()%>
                            </a>
                            <% } %>
                            > <%=postHeading%></b>
                        </td>
                        <!--<td align="right" class="rtbc"><a href="javascript:toggle('Options')" class="rtbcLink">Options</a></td>-->
                    </tr>
                </table>

                <br />

                <div id="Options"><span class="small">Allowed tags: <%=ForumsUtil.getAllowedTagsDisplay()%>. Allowed attributes: <%=ForumsUtil.getAllowedAttributesDisplay()%>. <!--Usernames within [handle][/handle] blocks are converted into color-coded links.--></span>
                </div><br />
                <table cellpadding="0" cellspacing="0" class="rtTable">
                    <form name="form1" method="post" action="<%=sessionInfo.getServletPath()%>">
                        <tc-webtag:hiddenInput name="module"/>
                        <tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
                        <tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_ID%>"/>
                        <tc-webtag:hiddenInput name="<%=ForumConstants.TEMP_MESSAGE_ID%>"/>
                        <tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>
                        <tc-webtag:hiddenInput name="<%=ForumConstants.ATTACHMENT_ID%>"/>

                        <tr>
                            <td class="rtHeader" colspan="2">
                                <%    if (tempMessage == null || tempMessage.getSubject().trim().equals("")) { %>
                                    <%=postHeading%>
                                <%    } else { %>
                                    <%=tempMessage.getSubject().trim()%>
                                <%    } %>
                            </td>
                        </tr>
                        <%     if (tempMessage != null && tempMessage.getAttachmentCount() > 0) { %>
                            <tr valign="middle">
                                <td class="rtHeader" colspan="2">
                                    Attachments:
                                    <%    Iterator attachments = tempMessage.getAttachments();
                                        while(attachments.hasNext()) {
                                            Attachment attachment = (Attachment)attachments.next(); %>&nbsp;
                                            <a href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>"><img align="absmiddle" src="/i/roundTables/icons/<%=DbAttachmentManager.getThumbnailImage(attachment.getContentType())%>" border="0" alt="Attachment" /></a>
                                            <a href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>" class="rtbcLink"><%=attachment.getName()%></a> (<%=ForumsUtil.getFileSizeStr(attachment.getSize())%>)
                                            <%    if (!postMode.equals("Edit")) { %>
                                                    [<a href="javascript:void(0)" onClick="form1.module.value='RemoveAttachment';form1.<%=ForumConstants.ATTACHMENT_ID%>.value='<%=attachment.getID()%>';form1.submit();" class="rtbcLink">remove</a>]
                                            <%    } %>
                                            &nbsp;
                                    <%     } %>
                                </td>
                            </tr>
                        <%     } %>
                        <tr>
                            <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
                                <% if (ForumsUtil.displayMemberPhoto(user, user)) { %>
                                <img src="<%=user.getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto"/>
                                <br />
                                <% } %>
                                <span class="bodyText"><tc-webtag:handle coderId="<%=user.getID()%>"/></span><br />
                                <a href="?module=History&<%=ForumConstants.USER_ID%>=<%=user.getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(user), "post")%></a>
                            </div></td>
                            <td class="rtTextCell100">
                                <%  if (errors.get(ForumConstants.ATTACHMENT_ERROR) != null) { %>
                                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.ATTACHMENT_ERROR%>"><%=err%><br /></tc-webtag:errorIterator></span>
                                <%     } %>
                                <%     if (errors.get(ForumConstants.MESSAGE_SUBJECT) != null) { %>
                                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_SUBJECT%>"><%=err%><br /></tc-webtag:errorIterator></span>
                                <%     } %>
                                <b>Subject:</b><br />
                                <tc-webtag:textInput size="60" name="<%=ForumConstants.MESSAGE_SUBJECT%>" escapeHtml="false" onKeyPress="return noenter(event)"/>
                                <br /><br />
                                <%     if (errors.get(ForumConstants.MESSAGE_BODY) != null) { %>
                                    <span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_BODY%>"><%=err%><br /></tc-webtag:errorIterator></span>
                                <%     } %>
                                <b>Body:</b><font color="red">
                                <span align="left" id="Warning" style="display: none"><br />Warning: one or more &lt;pre&gt; tags is not closed.</span>
                                </font><br />
                                <tc-webtag:textArea id="tcPostArea" rows="15" cols="60" name="<%=ForumConstants.MESSAGE_BODY%>" onKeyDown="AllowTabCharacter()"/>
                            </td>
                        </tr>
                        <tr><td class="rtFooter">
                            <input type="image" src="/i/events/openaim/interface/btnPost.png" class="rtButton" alt="Post" onClick="form1.module.value='PostMessage'"/>
                            <input type="image" src="/i/events/openaim/interface/btnPreview.png" class="rtButton" alt="Preview" onClick="form1.module.value='PreviewMessage'"/>
                            <%    if (forum.isAuthorized(ForumPermissions.CREATE_MESSAGE_ATTACHMENT)) { %>
                                <%    if (postMode.equals("Edit")) { %>
                                    <input type="image" src="/i/events/openaim/interface/btnAttachFiles.png" class="rtButton" alt="Attach Files" onClick="form1.module.value='EditAttachments'"/>
                                <%    } else { %>
                                    <input type="image" src="/i/events/openaim/interface/btnAttachFiles.png" class="rtButton" alt="Attach Files" onClick="form1.module.value='AttachFiles'"/>
                                <%    } %>
                            <%    } %>
                            <%    String cancelLink = "?module=ThreadList&"+ForumConstants.FORUM_ID+"="+forum.getID(); 
                                if (message != null) {
                                    cancelLink = "?module=Message&"+ForumConstants.MESSAGE_ID+"="+message.getID();
                                } else if (thread != null) {
                                    cancelLink = "?module=Thread&"+ForumConstants.THREAD_ID+"="+thread.getID();
                                } %>
                            <a href="<%=cancelLink%>"><img src="/i/events/openaim/interface/btnCancel.png" alt="Cancel"/></a>
                        </td></tr>
                    </form>
                </table>

                <% if (postMode.equals("Edit") || postMode.equals("Reply")) { %>
                <h3>Original Message</h3>
                <table cellpadding="0" cellspacing="0" class="rtTable">
                    <tr><td class="rtHeader" colspan="2"><a name=<%=message.getID()%>>
                        <tc-webtag:format object="${message.modificationDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>
                        |
                        <%=message.getSubject()%>
                        <% if (message.getParentMessage() != null) { %>
                        (response to
                        <a href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%>" class="rtbcLink">post</a>
                        by <tc-webtag:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/>)
                        <% } %>
                    </a></td></tr>
                    <%     if (message.getAttachmentCount() > 0) { %>
                        <tr>
                            <td class="rtHeader" colspan="2">
                                Attachments:
                                <%    Iterator attachments = message.getAttachments();
                                    while(attachments.hasNext()) {
                                        Attachment attachment = (Attachment)attachments.next(); %>&nbsp;
                                        <a href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>"><img align="absmiddle" src="/i/roundTables/icons/<%=DbAttachmentManager.getThumbnailImage(attachment.getContentType())%>" border="0" alt="Attachment" /></a>
                                        <a href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>" class="rtbcLink"><%=attachment.getName()%></a> (<%=ForumsUtil.getFileSizeStr(attachment.getSize())%>)&nbsp;&nbsp;
                                <%     } %>
                            </td>
                        </tr>
                       <% } %>
                    <tr>
                        <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
                            <% if (ForumsUtil.displayMemberPhoto(user, message.getUser())) { %>
                            <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto"/>
                            <br />
                            <% } %>
                            <span class="bodyText"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></span><br />
                            <a href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(message.getUser()), "post")%></a>
                        </div></td>
                        <td class="rtTextCell100">
                            <%=message.getBody()%>
                        </td>
                    </tr>
                </table>
                <% } %>
                <font color="red"><div align="left" id="Warning" style="display: none">Warning: one or more &lt;pre&gt;
                    tags is not closed.</div></font>


                        </div>
                        <div style="clear: both;">&nbsp;</div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<jsp:include page="tcFoot.jsp"/>

</body>
</html>