<%@ page import="com.jivesoftware.base.User,
                 com.jivesoftware.forum.Forum,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 java.util.Calendar"
        %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.TimeZone" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="openaim.tld" prefix="openaim" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forumCategory" name="forumCategory" type="com.jivesoftware.forum.ForumCategory" toScope="request"/>
<tc-webtag:useBean id="announcement" name="announcement" type="com.jivesoftware.forum.Announcement" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<% Forum forum = (Forum) request.getAttribute("forum");
    User user = (User) request.getAttribute("user");

    String level2val = "";
    if (forumCategory != null) {
        level2val = forumCategory.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME);
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
                                History</a> | <a href="?module=Watches" class="rtbcLink">My
                            Watches</a> | <a href="?module=Settings" class="rtbcLink">User
                            Settings</a><br />
                        </td>
                    </tr>
                    <tr><td colspan="3" style="padding-bottom:3px;"><b>
                        <%   if (ForumsUtil.canAnnounce(forum)) { %>
                        <div style="float:right; white-space: nowrap;">
                            <% Date now = Calendar.getInstance(TimeZone.getTimeZone("EST")).getTime();
                                if (announcement.getEndDate() == null || announcement.getEndDate().after(now)) { %>
                            <br /><a href="?module=Announcement&<%=ForumConstants.ANNOUNCEMENT_ID%>=<%=announcement.getID()%>&<%=ForumConstants.ANNOUNCEMENT_COMMAND%>=Expire" class="rtbcLink">Expire</a>&#160;
                            |
                            <% } else { %>
                            <a href="?module=Announcement&<%=ForumConstants.ANNOUNCEMENT_ID%>=<%=announcement.getID()%>&<%=ForumConstants.ANNOUNCEMENT_COMMAND%>=Activate" class="rtbcLink">Activate</a>&#160;
                            |
                            <% } %>
                            &#160;<a href="?module=Announcement&<%=ForumConstants.ANNOUNCEMENT_ID%>=<%=announcement.getID()%>&<%=ForumConstants.ANNOUNCEMENT_COMMAND%>=Delete" class="rtbcLink">Delete</a>
                        </div>
                        <%   } %>
                        <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory"
                                            iterator='<%=ForumsUtil.getCategoryTree(forumCategory)%>'>
                        <a href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink">
                            <%=category.getName()%>
                        </a> >
                        </tc-webtag:iterator>
                        <%  if (forum != null) { %>
                        <a href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></a>
                        >
                        <%  } %>
                        <img src="/i/events/openaim/interface/btnAnnouncement.png" alt="" border="0"/> <%=announcement.getSubject()%>
                    </td>
                    </tr>
                </table>

                <%-------------POSTS---------------%>
                <table cellpadding="0" cellspacing="0" class="rtTable">
                    <tr>
                        <td class="rtHeader" colspan="2">
                            <div style="float: right; padding-left: 5px; white-space: nowrap;">
                                <a name=<%=announcement.getID()%>><tc-webtag:format object="${announcement.startDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>
                            </div>
                            <%=announcement.getSubject()%>
                        </a>
                        <% if (announcement.getUser() != null && announcement.getUser().equals(user)) { %>
                        |
                        <a href="?module=PostAnnounce&<%=ForumConstants.POST_MODE%>=Edit&<%=ForumConstants.ANNOUNCEMENT_ID%>=<%=announcement.getID()%>" class="rtbcLink">Edit</a>
                        <% } %>
                    </td>
                </tr>
                <tr>
                    <td class="rtPosterCell">
                        <div class="rtPosterSpacer">
                            <% if (ForumsUtil.displayMemberPhoto(user, announcement.getUser())) { %>
                            <img src="<%=announcement.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto"/>
                            <br />
                            <% } %>
                            <span class="bodyText"><%if (announcement.getUser() != null) {%><tc-webtag:handle coderId="<%=announcement.getUser().getID()%>"/><%}%></span>
                            <br /><%if (announcement.getUser() != null) {%><a href="?module=History&<%=ForumConstants.USER_ID%>=<%=announcement.getUser().getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(announcement.getUser()), "post")%></a><%}%>
                        </div>
                    </td>
                    <td class="rtTextCell" width="100%">
                        <%=announcement.getBody()%>
                    </td>
                </tr>
            </table>
            <%-------------POSTS END---------------%>

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