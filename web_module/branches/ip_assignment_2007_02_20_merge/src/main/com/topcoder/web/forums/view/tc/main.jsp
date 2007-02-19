<%@ page import="com.jivesoftware.base.User,
                 com.jivesoftware.forum.Forum,
                 com.jivesoftware.forum.ForumCategory,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.WatchManager,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 com.topcoder.web.forums.util.ImageMapper,
                 java.util.*"
        %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="categories" name="categories" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>
<tc-webtag:useBean id="forumsBean" name="forumsBean" type="com.topcoder.web.ejb.forums.Forums" toScope="request"/>

<% 	User user = (User) request.getAttribute("user");
    ResultFilter resultFilter = (ResultFilter) request.getAttribute("resultFilter");
    ReadTracker readTracker = forumFactory.getReadTracker();
    WatchManager watchManager = forumFactory.getWatchManager();
    String trackerClass = ""; %>

<html>
<head>
    <title>TopCoder Forums</title>
    <jsp:include page="script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_forums"/>
    </jsp:include>

</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">

<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="forums"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->


<!-- Center Column Begins -->
<td width="100%" class="rtBody">

<jsp:include page="page_title.jsp">
    <jsp:param name="image" value="forums"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>
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
                History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User
            Settings</A><br/>
            <div style="float:right; margin: 30px 0px 10px 10px;">
                <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums"><img src="/i/roundTables/studioForums.png" alt="TopCoder Studio Forums" /></A>
            </div>
        </td>
    </tr>
</table>

<% if (categories.size() > 0) {
    Calendar calendar = Calendar.getInstance();
    calendar.set(Calendar.MILLISECOND, 0);
    calendar.set(Calendar.SECOND, 0);
    calendar.set(Calendar.MINUTE, 0);
%>
<tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=(Iterator)categories.iterator()%>'>
    <% String limit = StringUtils.checkNull(category.getProperty(ForumConstants.PROPERTY_DISPLAY_LIMIT));
       if (!"0".equals(limit)) {
       	Iterator itForums = null, itForumsCopy = null;
       	Iterator itCategories = null, itCategoriesCopy = null;
        int numActiveForums = 0, numActiveCategories = 0;
        if (!"".equals(limit)) {
            if (limit.endsWith("d")) {
                int numDays = Integer.parseInt(limit.substring(0, limit.length() - 1));
                calendar.add(Calendar.DATE, numDays * -1);
                resultFilter.setModificationDateRangeMin(calendar.getTime());
                calendar.add(Calendar.DATE, numDays);
                resultFilter.setNumResults(ForumConstants.MAX_DISPLAYED_FORUMS_PER_CATEGORY);
                itForums = category.getForums(resultFilter);
                itForumsCopy = category.getForums(resultFilter);
            } else {
                //resultFilter.setNumResults(Integer.parseInt(category.getProperty("displayLimit")));
                if (category.getCategoryCount() > 0) {
                	ArrayList categoriesList = ForumsUtil.getCategories(forumsBean, category, resultFilter, true);
                	ArrayList pageList = ForumsUtil.getPage(categoriesList, 0, Integer.parseInt(category.getProperty("displayLimit")));
                	itCategories = pageList.iterator();
                	itCategoriesCopy = pageList.iterator();
                } else {
                	ArrayList forumsList = ForumsUtil.getForums(category, resultFilter, true);
                	ArrayList pageList = ForumsUtil.getPage(forumsList, 0, Integer.parseInt(category.getProperty("displayLimit")));
                	itForums = pageList.iterator();
                	itForumsCopy = pageList.iterator();
                }
            }
        } else {
            resultFilter.setNumResults(ResultFilter.NULL_INT);
            itForums = category.getForums(resultFilter);
            itForumsCopy = category.getForums(resultFilter);
        }
        if (itCategories != null) {
        	while (itCategories.hasNext()) {
        		if (((ForumCategory) itCategories.next()).getMessageCount() > 0) numActiveCategories++;
        	}
        }
  		if (itForums != null) {
	        while (itForums.hasNext()) {
	            if (((Forum) itForums.next()).getMessageCount() > 0) numActiveForums++;
	        }
        }
        if (numActiveCategories > 0) { %>
    <br>
    <table cellpadding="0" cellspacing="0" class="rtTable">
        <tr>
            <td class="rtHeader" width="100%">
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
            </td>
            <td class="rtHeader"><div style="width:80px;">T./M.</div></td>
            <td class="rtHeader" align="center" colspan="2"><div style="width:320px;">Last Post</div></td>
        </tr>
        <tc-webtag:iterator id="subcategory" type="com.jivesoftware.forum.ForumCategory" iterator='<%=itCategoriesCopy%>'>
            <% trackerClass = (user == null || subcategory.getMessageCount() <= 0 || readTracker.getReadStatus(user, subcategory.getLatestMessage()) == ReadTracker.READ
                    || ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, subcategory.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold"; %>
            <% if (subcategory.getMessageCount() > 0 || ("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)))) { %>
            <tr>
                <td class="rtThreadCellWrap">
  					<%	String phaseIcon = ImageMapper.getPhaseIcon(forumsBean, subcategory);
  						String phaseText = ImageMapper.getPhaseText(forumsBean, subcategory);
  						String technologyIcon = ImageMapper.getTechnologyIcon(forumsBean, subcategory);
  						String technologyText = ImageMapper.getTechnologyText(forumsBean, subcategory); %>
                	<%	if ("software".equals(category.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME))) { %>
                		<%	if (!"".equals(StringUtils.checkNull(phaseIcon))) { %>
                			<img align="absmiddle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/images/<%=phaseIcon%>" alt="<%=phaseText%>" width="25" height="17" border="0">
                		<%	} %>
                		<%	if (!"".equals(StringUtils.checkNull(technologyIcon))) { %>
							<img align="absmiddle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/images/<%=technologyIcon%>" alt="<%=technologyText%>" border="0"/>
						<%	} %>
						&#160;
					<%	} %>
                    <% if (user == null) { %>
                    <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=subcategory.getID()%>&<%=ForumConstants.MESSAGE_COUNT%>=<%=subcategory.getMessageCount()%>" class="rtLinkNew"><%=subcategory.getName()%></A>
                    <% } else { %>
                    <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=subcategory.getID()%>" class="<%=trackerClass%>"><%=subcategory.getName()%></A>
                    <% } %>
                    <% if (subcategory.getDescription() != null) { %><br/>
						<div class="rtDescIndent"><%=subcategory.getDescription()%></div>
					<% } %>
				</td>
                <td class="rtThreadCell" style="width: 80px;"><%=subcategory.getThreadCount()%>
                    &#160;/&#160;<%=subcategory.getMessageCount()%></td>
                <% if (subcategory.getMessageCount() > 0) { %>
                <tc-webtag:useBean id="message" name="subcategory" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                <td class="rtThreadCell" style="width: 220px;"><b>
                    <tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></b>
                </td>
                <% if (message.getUser() != null) { %>
                <td class="rtThreadCell" style="width: 100px;">
                    <tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
                <% } else { %>
                <td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
                <% } %>
                <% } else { %>
                <td class="rtThreadCell" style="width: 220px;">&nbsp;</td>
                <td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
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
            		<A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtLinkNew">...more</A>
        		</td></tr>
        	<% } %>
        <% } %>
    </table>      
    <%  } else if (numActiveForums > 0 || ("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)))) { %>
    <br>
    <table cellpadding="0" cellspacing="0" class="rtTable">
        <tr>
            <td class="rtHeader" width="100%">
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
            </td>
            <td class="rtHeader"><div style="width:80px;">T./M.</div></td>
            <td class="rtHeader" align="center" colspan="2"><div style="width:320px;">Last Post</div></td>
        </tr>
        <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=itForumsCopy%>'>
            <% trackerClass = (user == null || forum.getMessageCount() <= 0 || readTracker.getReadStatus(user, forum.getLatestMessage()) == ReadTracker.READ
                    || ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, forum.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold"; %>
            <% if (forum.getMessageCount() > 0 || ("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)))) { %>
            <tr>
                <td class="rtThreadCellWrap">
                    <% if (user == null) { %>
                    <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&<%=ForumConstants.MESSAGE_COUNT%>=<%=forum.getMessageCount()%>" class="rtLinkNew"><%=forum.getName()%></A>
                    <% } else { %>
                    <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>" class="<%=trackerClass%>"><%=forum.getName()%></A>
                    <% } %>
                    <% if (forum.getDescription() != null) { %><br/>
                    	<div class="rtDescIndent"><%=forum.getDescription()%></div>
                    <% } %>
                </td>
                <td class="rtThreadCell" style="width: 80px;"><%=forum.getThreadCount()%>
                    &#160;/&#160;<%=forum.getMessageCount()%></td>
                <% if (forum.getMessageCount() > 0) { %>
                <tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                <td class="rtThreadCell" style="width: 220px;"><b>
                    <tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></b>
                </td>
                <% if (message.getUser() != null) { %>
                <td class="rtThreadCell" style="width: 100px;">
                    <tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
                <% } else { %>
                <td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
                <% } %>
                <% } else { %>
                <td class="rtThreadCell" style="width: 220px;">&nbsp;</td>
                <td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
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
            		<A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtLinkNew">...more</A>
        		</td></tr>
        	<% } %>
        <% } %>
    </table>
    <% } %>
    <% } %>
</tc-webtag:iterator>
<% } %>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
        <td>A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings.</td>
        <td align="right">
            <a href="?module=RSS&<%=ForumConstants.CATEGORY_ID%>=1"><img alt="RSS" border="none" src="/i/interface/btn_rss.gif"/></a>
        </td>
    </tr>
    <tr>
        <td>The five most recent forums are displayed for each category other than Round Tables. Click a category's name
            to view its complete forum list.</td>
        <td></td>
    </tr>
</table>
</td>
<!-- Center Column Ends -->

</tr>
</table>

<jsp:include page="foot.jsp"/>

</body>

</html>