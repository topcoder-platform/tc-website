<%@ page import="com.jivesoftware.base.User,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil"
        %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="message" name="message" type="com.jivesoftware.forum.ForumMessage" toScope="request"/>
<tc-webtag:useBean id="revisionList" name="revisionList" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<% String threadView = (String) request.getAttribute("threadView");
    User user = (User) request.getAttribute("user"); %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio</title>

    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_studio_forums"/>
    </jsp:include>
	
	<script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
	<script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
    <script type="text/javascript">
			$(document).ready(function(){
				//Run the script to preload images from CSS
				$.preloadCssImages(); 
			});
	</script>
	<script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
	<script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
	<script type="text/javascript" language="javascript">

	$(document).ready(function(){
	
	
		$("#nav ul li").hoverIntent(function(){
			$(this).children("ul").slideDown("fast");
		}, function() {
			$(this).children("ul").slideUp("fast");
		});
		
		$("#nav ul ul li").hover(function() {
			$(this).parents("#nav ul li").children('a').addClass("active-item");
		}, function() {
			$(this).parents("#nav ul li").children('a').removeClass("active-item");
		});
	
	
	});
	</script>
</head>

<body>
	<div id="page-wrap">
    	<div align="center">
			<jsp:include page="top.jsp">
            <jsp:param name="section" value="forums" />
        </jsp:include>
        <br />
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="wrapper">
            	<div id="content">
                	<div class="contentTop">
                	<h1>Forums</h1>
                	<div class="contentMiddle forums">

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
                    <tr>
                        <td colspan="3" style="padding:15px 0 3px 0;">
                            <b>
                                <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
                                    <a href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink">
                                        <%=category.getName()%>
                                    </a> >
                                </tc-webtag:iterator>
                                <a href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink">
                                    <%=forum.getName()%>
                                </a> >
                                <a href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%>" class="rtbcLink">
                                    <%=message.getSubject()%>
                                </a> >
                                Revision History
                                <% if (revisionList.size() == 1) { %>
                                (1 edit)
                                <% } else { %>
                                (<%=revisionList.size()%> edits)
                                <% } %>
                            </b><br />
                        </td>
                    </tr>
                </table>

                <%-------------POSTS---------------%>
                <table cellpadding="0" cellspacing="0" class="rtTable">
                    <tr>
                        <td class="rtHeader" colspan="2">
                            <div style="float: right; padding-left: 5px; white-space: nowrap;">
                                <a style="text-decoration: none;" name=<%=message.getID()%>><tc-webtag:format object="${message.modificationDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>
                            </div>
                            <%=message.getSubject()%>
                        </a>
                        <% if (message.getParentMessage() != null) { %>
                        (response to
                        <a href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">post</a><%if (message.getParentMessage().getUser() != null) {%>
                        by <studio:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/><%}%>)
                        <% } %>
                    </td>
                </tr>
                <tr>
                    <td class="rtPosterCell">
                        <div class="rtPosterSpacer">
                            <% if (ForumsUtil.displayMemberPhoto(user, message.getUser())) { %>
                            <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto"/>
                            <br />
                            <% } %>
                            <span class="bodyText"><%if (message.getUser() != null) {%><studio:handle coderId="<%=message.getUser().getID()%>"/><%}%></span>
                            <br /><%if (message.getUser() != null) {%><a href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(message.getUser()), "post")%></a><%}%>
                        </div>
                    </td>
                    <td class="rtTextCell" width="100%">
                        <%=message.getBody()%>
                    </td>
                </tr>
            </table>

            <tc-webtag:iterator id="revision" type="com.topcoder.web.forums.model.Revision"
                                iterator='<%=revisionList.iterator()%>'>
            <table cellpadding="0" cellspacing="0" class="rtTable">
                <tr>
                    <td class="rtHeader" colspan="2">
                        <div style="float: right; padding-left: 5px; white-space: nowrap;">
                            <a style="text-decoration: none;" name=<%=revision.getID()%>><tc-webtag:format object="${revision.modificationDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>
                        </div>
                        <%=revision.getSubject()%>
                    </a>
                    <% if (message.getParentMessage() != null) { %>
                    (response to
                    <a href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">post</a><%if (message.getParentMessage().getUser() != null) {%>
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
                    <br />
                    <% } %>
                    <span class="bodyText"><%if (message.getUser() != null) {%><studio:handle coderId="<%=message.getUser().getID()%>"/><%}%></span>
                    <br /><%if (message.getUser() != null) {%><a href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=forumFactory.getUserMessageCount(message.getUser())%>
                    posts</a><%}%>
                </div>
            </td>
            <td class="rtTextCell" width="100%">
                <%=revision.getBody()%>
            </td>
        </tr>
    </table>
    </tc-webtag:iterator>
    <%-------------POSTS END---------------%>



                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>


        <jsp:include page="foot.jsp"/>


</body>
</html>