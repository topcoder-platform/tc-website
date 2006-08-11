<%@ page import="com.jivesoftware.base.User,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil"
        %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="message" name="message" type="com.jivesoftware.forum.ForumMessage" toScope="request"/>
<tc-webtag:useBean id="revisionList" name="revisionList" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<% String threadView = (String) request.getAttribute("threadView");
    User user = (User) request.getAttribute("user"); %>

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
        <jsp:include page="top.jsp">
            <jsp:param name="section" value="default"/>
        </jsp:include>
        <jsp:include page="topNav.jsp">
            <jsp:param name="node" value="forums"/>
        </jsp:include>
        <div class="contentIn">
            <img src="/i/studio/layout/contentInN.gif" alt="" style="display:block;"/>

            <div class="contentSpacer">

                <table cellpadding="0" cellspacing="0" class="rtbcTable">
                    <tr>
                        <td class="categoriesBox" style="padding-right: 20px;">
                            <jsp:include page="categoriesHeader.jsp"/>
                        </td>
                        <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
                            <jsp:include page="searchHeader.jsp">
                            </jsp:include>
                        </td>
                        <td align="right" nowrap="nowrap" valign="top">
                            <A href="?module=History" class="rtbcLink">My Post
                                History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My
                            Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User
                            Settings</A><br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-bottom:3px;">
                            <b>
                                <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
                                    <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>" class="rtbcLink">
                                        <jsp:getProperty name="category" property="name"/>
                                    </A> >
                                </tc-webtag:iterator>
                                <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink">
                                    <jsp:getProperty name="forum" property="name"/>
                                </A> >
                                <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>" class="rtbcLink">
                                    <jsp:getProperty name="message" property="subject"/>
                                </A> >
                                Revision History
                                <% if (revisionList.size() == 1) { %>
                                (1 edit)
                                <% } else { %>
                                (<%=revisionList.size()%> edits)
                                <% } %>
                            </b><br>
                        </td>
                    </tr>
                </table>

                <%-------------POSTS---------------%>
                <table cellpadding="0" cellspacing="0" class="rtTable">
                    <tr>
                        <td class="rtHeader" colspan="2">
                            <div style="float: right; padding-left: 5px; white-space: nowrap;">
                                <a name=
                                <jsp:getProperty name="message" property="ID"/>><tc-webtag:beanWrite name="message"
                                                                                                     property="modificationDate"
                                                                                                     format="MMM d, yyyy 'at' h:mm a z"/>
                            </div>
                            <jsp:getProperty name="message" property="subject"/>
                        </a>
                        <% if (message.getParentMessage() != null) { %>
                        (response to
                        <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">post</A><%if (message.getParentMessage().getUser() != null) {%>
                        by <studio:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/><%}%>)
                        <% } %>
                    </td>
                </tr>
                <tr>
                    <td class="rtPosterCell">
                        <div class="rtPosterSpacer">
                            <% if (ForumsUtil.displayMemberPhoto(user, message.getUser())) { %>
                            <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto"/>
                            <br/>
                            <% } %>
                            <span class="bodyText"><%if (message.getUser() != null) {%><studio:handle coderId="<%=message.getUser().getID()%>"/><%}%></span>
                            <br/><%if (message.getUser() != null) {%><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(message.getUser()), "post")%></A><%}%>
                        </div>
                    </td>
                    <td class="rtTextCell" width="100%">
                        <jsp:getProperty name="message" property="body"/>
                    </td>
                </tr>
            </table>

            <tc-webtag:iterator id="revision" type="com.topcoder.web.forums.model.Revision"
                                iterator='<%=revisionList.iterator()%>'>
            <table cellpadding="0" cellspacing="0" class="rtTable">
                <tr>
                    <td class="rtHeader" colspan="2">
                        <div style="float: right; padding-left: 5px; white-space: nowrap;">
                            <a name=
                                <jsp:getProperty name="revision" property="ID"/>><tc-webtag:beanWrite name="revision"
                                                                                                      property="modificationDate"
                                                                                                      format="MMM d, yyyy 'at' h:mm a z"/>
                        </div>
                        <jsp:getProperty name="revision" property="subject"/>
                    </a>
                    <% if (message.getParentMessage() != null) { %>
                    (response to
                    <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">post</A><%if (message.getParentMessage().getUser() != null) {%>
                    by <studio:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/><%}%>)
                    <% } %>
                </a>
            </td>
        </tr>
        <tr>
            <td class="rtPosterCell">
                <div class="rtPosterSpacer">
                    <% if (ForumsUtil.displayMemberPhoto(user, message.getUser())) { %>
                    <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto"/>
                    <br/>
                    <% } %>
                    <span class="bodyText"><%if (message.getUser() != null) {%><studio:handle coderId="<%=message.getUser().getID()%>"/><%}%></span>
                    <br/><%if (message.getUser() != null) {%><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=forumFactory.getUserMessageCount(message.getUser())%>
                    posts</A><%}%>
                </div>
            </td>
            <td class="rtTextCell" width="100%">
                <jsp:getProperty name="revision" property="body"/>
            </td>
        </tr>
    </table>
    </tc-webtag:iterator>
    <%-------------POSTS END---------------%>

</div>
<img src="/i/studio/layout/contentInS.gif" alt="" style="display:block;"/>
</div>
<jsp:include page="foot.jsp"/>
<img src="/i/studio/layout/contentOutS.gif" alt="" style="display:block;"/>
</div>
</div>

</body>
</html>