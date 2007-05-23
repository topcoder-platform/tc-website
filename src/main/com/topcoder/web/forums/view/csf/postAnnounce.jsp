<%@ page import="com.jivesoftware.forum.Announcement,
                 com.jivesoftware.forum.Forum,
                 com.jivesoftware.forum.ForumCategory,
                 com.topcoder.web.common.BaseProcessor,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 java.util.HashMap"
        %>
<%@ page contentType="text/html;charset=utf-8" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="csf.tld" prefix="csf" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="user" name="user" type="com.jivesoftware.base.User" toScope="request"/>
<tc-webtag:useBean id="postMode" name="postMode" type="java.lang.String" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>

<% Announcement announcement = (Announcement) request.getAttribute("announcement");
    ForumCategory forumCategory = (ForumCategory) request.getAttribute("category");
    Forum forum = (Forum) request.getAttribute("forum");
    HashMap errors = (HashMap) request.getAttribute(BaseProcessor.ERRORS_KEY);

    String level2val = "";
    if (forumCategory != null) {
        level2val = forumCategory.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME);
    }

    String postHeading = "";
    String postDesc = "";

    if (postMode.equals("New")) {
        postHeading = "New Announcement";
        postDesc = "Create a new announcement";
    } else if (postMode.equals("Edit")) {
        String editSubject = announcement.getSubject();
        if (!editSubject.startsWith("Edit: ")) {
            editSubject = "Edit: " + editSubject;
        }
        postHeading = editSubject;
        postDesc = "Edit announcement";
    } %>

<script type="text/javascript">
    function noenter(e)
    {
        var k = (window.event) ? event.keyCode : e.which;
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

    // IE only
    function AllowTabCharacter() {
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
</script>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>CSF</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="csfforums"/>
    </jsp:include>
</head>

<body>

<div align="center">
    <div class="contentOut">


        <jsp:include page="top.jsp"/>


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
                            <A href="?module=History" class="rtbcLink">My Post History</A> |
                            <A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-bottom:3px;"><b>
                            <% ForumCategory crumbCategory = forumCategory;
                                if (crumbCategory == null) {
                                    crumbCategory = forumFactory.getRootForumCategory();
                                } %>
                            <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(crumbCategory)%>'>
                                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%>
                                </A> >
                            </tc-webtag:iterator>
                            <% if (forum != null) { %>
                            <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=
                                forum.getName()%>
                            </A>
                            <% } %>
                            > <%=postHeading%>
                        </b>
                        </td>
                        <!--<td align="right" class="rtbc"><a href="javascript:toggle('Options')" class="rtbcLink">Options</a></td>-->
                    </tr>
                </table>

                <br>

                <div id="Options"><span class="small">Allowed tags: <%=ForumsUtil.getAllowedTagsDisplay()%>. Allowed attributes: <%=ForumsUtil.getAllowedAttributesDisplay()%>. <!--Usernames within [handle][/handle] blocks are converted into color-coded links.--></span>
                </div>
                <br>
                <table cellpadding="0" cellspacing="0" class="rtTable">
                    <form name="form1" method="post" action="<%=sessionInfo.getServletPath()%>">
                        <tc-webtag:hiddenInput name="module"/>
                        <tc-webtag:hiddenInput name="<%=ForumConstants.CATEGORY_ID%>"/>
                        <tc-webtag:hiddenInput name="<%=ForumConstants.FORUM_ID%>"/>
                        <tc-webtag:hiddenInput name="<%=ForumConstants.ANNOUNCEMENT_ID%>"/>
                        <tc-webtag:hiddenInput name="<%=ForumConstants.POST_MODE%>"/>

                        <tr>
                            <td class="rtHeader" colspan="2"><%=postHeading%>
                            </td>
                        </tr>
                        <tr>
                            <td class="rtPosterCell" rowspan="2">
                                <div class="rtPosterSpacer">
                                    <% if (ForumsUtil.displayMemberPhoto(user, user)) { %>
                                    <img src="<%=user.getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto"/><br/>
                                    <% } %>
                                    <span class="bodyText"><csf:handle coderId="<%=user.getID()%>"/></span><br/><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=user.getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(user), "post")%>
                                </A></div>
                            </td>
                            <td class="rtTextCell100">
                                <% if (errors.get(ForumConstants.ANNOUNCEMENT_SUBJECT) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.ANNOUNCEMENT_SUBJECT%>"><%=err%>
                                <br/></tc-webtag:errorIterator></span><% } %>
                                <b>Subject:</b><br/>
                                <tc-webtag:textInput size="60" name="<%=ForumConstants.ANNOUNCEMENT_SUBJECT%>" escapeHtml="false" onKeyPress="return noenter(event)"/>
                                <br/><br/>
                                <% if (errors.get(ForumConstants.ANNOUNCEMENT_BODY) != null) { %><span class="bigRed"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.ANNOUNCEMENT_BODY%>"><%=err%>
                                <br/></tc-webtag:errorIterator></span><% } %>
                                <b>Body:</b><font color="red"><span align="left" id="Warning" style="display: none"><br/>Warning: one or more &lt;pre&gt; tags is not closed.</span></font>
                                <br/>
                                <tc-webtag:textArea id="tcPostArea" rows="15" cols="72" name="<%=ForumConstants.ANNOUNCEMENT_BODY%>" onKeyDown="AllowTabCharacter()"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="rtFooter">
                                <input type="image" src="/i/forums/post.gif" class="rtButton" alt="Post" onClick="form1.module.value='PostAnnouncement'"/><input type="image" src="/i/forums/preview.gif" class="rtButton" alt="Preview" onClick="form1.module.value='PreviewAnnouncement'"/>
                            </td>
                        </tr>
                    </form>
                </table>

                <% if (postMode.equals("Edit")) { %>
                <h3>Original Announcement</h3>
                <table cellpadding="0" cellspacing="0" class="rtTable">
                    <tr>
                        <td class="rtHeader" colspan="2">
                            <a name=<%=announcement.getID()%>>
                                <tc-webtag:format object="${announcement.startDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>
                                | <%=announcement.getSubject()%>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td class="rtPosterCell" rowspan="2">
                            <div class="rtPosterSpacer">
                                <% if (ForumsUtil.displayMemberPhoto(user, announcement.getUser())) { %>
                                <img src="<%=announcement.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto"/><br/>
                                <% } %>
                                <span class="bodyText"><csf:handle coderId="<%=announcement.getUser().getID()%>"/></span><br/><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=announcement.getUser().getID()%>"><%=
                                ForumsUtil.display(forumFactory.getUserMessageCount(announcement.getUser()), "post")%>
                            </A></div>
                        </td>
                        <td class="rtTextCell100"><%=announcement.getBody()%>
                        </td>
                    </tr>
                </table>
                <% } %>
                <font color="red">
                    <div align="left" id="Warning" style="display: none">Warning: one or more &lt;pre&gt; tags is not
                        closed.
                    </div>
                </font>

            </div>
            <img src="/i/layout/contentInS.gif" alt="" style="display:block;"/>
        </div>
        <jsp:include page="foot.jsp"/>
        <img src="/i/layout/contentOutS.gif" alt="" style="display:block;"/>
    </div>
</div>
</body>
</html>
