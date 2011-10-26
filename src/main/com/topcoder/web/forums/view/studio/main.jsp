<%@ page import="com.jivesoftware.base.User,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.WatchManager,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 java.util.Calendar,
                 java.util.Iterator"
        %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="categories" name="categories" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<% User user = (User) request.getAttribute("user");
    ResultFilter resultFilter = (ResultFilter) request.getAttribute("resultFilter");
    ReadTracker readTracker = forumFactory.getReadTracker();
    WatchManager watchManager = forumFactory.getWatchManager();
    String trackerClass = ""; %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TopCoder Studio : Forums</title>

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
						<table cellpadding="0" cellspacing="0" class="rtbcTable" style="padding:0px 0 15px 0;">
							<tr>
								<td class="categoriesBox" style="padding-right: 20px;">
									<jsp:include page="categoriesHeader.jsp"/>
								</td>
								<td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
									<jsp:include page="searchHeader.jsp"/>
								</td>
								<td align="right" nowrap="nowrap" valign="top">
									<a href="?module=History" class="rtbcLink">My Post History</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Watches" class="rtbcLink">My Watches</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="?module=Settings" class="rtbcLink">User Settings</a><br />
								</td>
							</tr>
						</table>

					<% if (categories.size() > 0) {
						Calendar calendar = Calendar.getInstance();
						calendar.set(Calendar.MILLISECOND, 0);
						calendar.set(Calendar.SECOND, 0);
						calendar.set(Calendar.MINUTE, 0); %>
					<tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=(Iterator)categories.iterator()%>'>
						<% String limit = StringUtils.checkNull(category.getProperty(ForumConstants.PROPERTY_DISPLAY_LIMIT));
							if (!"0".equals(limit)) {
								Iterator itForums = (Iterator)request.getAttribute("forumsIterator_"+category.getID());
								long numActiveForums = ((Long)request.getAttribute("numActiveForums_"+category.getID())).longValue();
								if (numActiveForums > 0 || ("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)))) { %>
						
						
						<table cellpadding="0" cellspacing="0" class="rtTable">
							<tr>
								<td class="rtHeader" width="100%">
									<a href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink">
										<%=category.getName()%>
									</a>
								</td>
								<td class="rtHeader"><div style="width:80px;">T./M.</div></td>
								<td class="rtHeader" align="center" colspan="2"><div style="width:300px;">Last Post</div></td>
							</tr>
							
							<tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=itForums%>'>
								<% trackerClass = (user == null || forum.getMessageCount() <= 0 || readTracker.getReadStatus(user, forum.getLatestMessage()) == ReadTracker.READ
										|| ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, forum.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold"; %>
								<% if (forum.getMessageCount() > 0 || ("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)))) { %>
								<tr>
									<td class="rtThreadCellWrap">
										<% if (user == null) { %>
										<a href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&<%=ForumConstants.MESSAGE_COUNT%>=<%=forum.getMessageCount()%>" class="rtLinkNew">
											<%=forum.getName()%>
										</a>
										<% } else { %>
										<a href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>" class="<%=trackerClass%>">
											<%=forum.getName()%>
										</a>
										<% } %>
										<% if (forum.getDescription() != null) { %><br />
					
										<div class="rtDescIndent">
											<%=forum.getDescription()%>
										</div><% } %></td>
									<td class="rtThreadCell" style="width: 90px;">
										<%=forum.getThreadCount()%>
										&#160;/&#160;
										<%=forum.getMessageCount()%>
									</td>
									<% if (forum.getMessageCount() > 0) { %>
									<tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
									<td class="rtThreadCell" style="width: 210px;"><b>
										<tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></b>
									</td>
									<% if (message.getUser() != null) { %>
									<td class="rtThreadCell" style="width: 90px;">
										<studio:handle coderId="<%=message.getUser().getID()%>"/></td>
									<% } else { %>
									<td class="rtThreadCell" style="width: 90px;"></td>
									<% } %>
									<% } else { %>
									<td class="rtThreadCell" style="width: 210px;">&nbsp;</td>
									<td class="rtThreadCell" style="width: 90px;">&nbsp;</td>
									<% } %>
								</tr>
								<% } %>
							</tc-webtag:iterator>
							<% if (!"".equals(limit)) {
								int limitCNT = -1;
								try {
									limitCNT = Integer.parseInt(limit);
								} catch (Exception e) {
								}
								if (category.getForumCount() >= limitCNT) { %>
							<tr><td class="rtThreadCell" colspan="4">
								<a href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtLinkNew">...more</a>
							</td></tr>
							<% } %>
							<% } %>
						</table>
						<% } %>
						<% } %>
					</tc-webtag:iterator>
					<% } %>
					
					<div style="float:right;">
						<a href="?module=RSS&<%=ForumConstants.CATEGORY_ID%>=1"><img alt="RSS" border="0" src="/i/v2/interface/btnRSS.png"/></a>
					</div>
					<span class="small">A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings.<br />
					The five most recent forums are displayed for each category other than Round Tables. Click a category's name to view its complete forum list.</span>


                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>
		
        <jsp:include page="foot.jsp"/>

	</body>
</html>