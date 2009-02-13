<%@ page import="com.jivesoftware.forum.ForumMessage,
                 com.jivesoftware.forum.ForumThread,
                 com.topcoder.web.common.BaseProcessor,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 java.util.HashMap"
        %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postMode" name="postMode" type="java.lang.String" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<% ForumMessage message = (ForumMessage) request.getAttribute("message");
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

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_forums"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div class="contentOut">
        

      <jsp:include page="top.jsp" />


        <jsp:include page="topNav.jsp">
            <jsp:param name="node" value="none"/>
        </jsp:include>
        <div class="contentIn">
            <img src="/i/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <table cellpadding="0" cellspacing="0" class="rtbcTable">
                    <tr>
                        <td class="categoriesBox" style="padding-right: 20px;">
                            <jsp:include page="categoriesHeader.jsp"/>
                        </td>
                        <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
                            <jsp:include page="searchHeader.jsp"/>
                        </td>
                        <td align="right" nowrap="nowrap" valign="top">
                            <A href="?module=History" class="rtbcLink">My Post
                                History</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Watches" class="rtbcLink">My
                            Watches</A>&nbsp;&nbsp;|&nbsp;&nbsp;<A href="?module=Settings" class="rtbcLink">User
                            Settings</A><br/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="padding-bottom:3px;"><b>
                            <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
                                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink">
                                    <%=category.getName()%>
                                </A> >
                            </tc-webtag:iterator>
                            <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink">
                                <%=forum.getName()%>
                            </A>
                            <% if (thread != null) { %>
                            >
                            <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>" class="rtbcLink">
                                <%=thread.getName()%>
                            </A>
                            <% } %>
                            > <%=postHeading%></b>
                        </td>
                        <!--<td align="right" class="rtbc"><a href="javascript:toggle('Options')" class="rtbcLink">Options</a></td>-->
                    </tr>
                </table>

                <br>

                <div id="Options"><span class="small">Allowed tags: <%=ForumsUtil.getAllowedTagsDisplay()%>. Allowed attributes: <%=ForumsUtil.getAllowedAttributesDisplay()%>. <!--Usernames within [handle][/handle] blocks are converted into color-coded links.--></span>
                </div><br>
                <table cellpadding="0" cellspacing="0" class="rtTable">
                    <form name="form1" method="post" action="<%=sessionInfo.getServletPath()%>">
                        <tc-webtag:hiddenInput name="module"/>
                        <tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
                        <tc-webtag:hiddenInput name="<%=ForumConstants.MESSAGE_ID%>"/>
                        <tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>

                        <tr><td class="rtHeader" colspan="2"><%=postHeading%></td></tr>
                        <tr>
                            <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
                                <% if (ForumsUtil.displayMemberPhoto(user, user)) { %>
                                <img src="<%=user.getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto"/>
                                <br/>
                                <% } %>
                                <span class="bodyText"><studio:handle coderId="<%=user.getID()%>"/></span><br/>
                                <A href="?module=History&<%=ForumConstants.USER_ID%>=<%=user.getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(user), "post")%></A>
                            </div></td>
                            <td class="rtTextCell100">
                                <% if (errors.get(ForumConstants.MESSAGE_SUBJECT) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_SUBJECT%>"><%=err%>
                                <br/></tc-webtag:errorIterator></span><% } %>
                                <b>Subject:</b><br/>
                                <tc-webtag:textInput size="60" name="<%=ForumConstants.MESSAGE_SUBJECT%>" escapeHtml="false" onKeyPress="return noenter(event)"/>
                                <br/><br/>
                                <% if (errors.get(ForumConstants.MESSAGE_BODY) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.MESSAGE_BODY%>"><%=err%>
                                <br/></tc-webtag:errorIterator></span><% } %>
                                <b>Body:</b><font color="red">
                                <span align="left" id="Warning" style="display: none"><br/>Warning: one or more &lt;pre&gt; tags is not closed.</span>
                            </font>
                                <br/>
                                <tc-webtag:textArea id="tcPostArea" rows="15" cols="72" name="<%=ForumConstants.MESSAGE_BODY%>" onKeyDown="AllowTabCharacter()"/>
                            </td>
                        </tr>
                        <tr><td class="rtFooter">
                            <input type="image" src="/i/forums/post.gif" class="rtButton" alt="Post" onclick="form1.module.value='PostMessage'"/>
                            <input type="image" src="/i/forums/preview.gif" class="rtButton" alt="Preview" onclick="form1.module.value='PreviewMessage'"/>
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
                        <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%>" class="rtbcLink">post</A>
                        by <studio:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/>)
                        <% } %>
                    </a></td></tr>
                    <tr>
                        <td class="rtPosterCell" rowspan="2"><div class="rtPosterSpacer">
                            <% if (ForumsUtil.displayMemberPhoto(user, message.getUser())) { %>
                            <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto"/>
                            <br/>
                            <% } %>
                            <span class="bodyText"><studio:handle coderId="<%=message.getUser().getID()%>"/></span><br/>
                            <A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(message.getUser()), "post")%></A>
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
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="foot.jsp"/>
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>

</body>
</html>