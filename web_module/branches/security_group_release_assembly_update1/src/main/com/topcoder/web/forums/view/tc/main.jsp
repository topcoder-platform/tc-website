<%@ page import="com.jivesoftware.base.User,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.WatchManager,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.common.WebConstants,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.model.ImageData,
                 java.util.Calendar,
                 java.util.Hashtable,
                 java.util.Iterator"
        %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="categories" name="categories" type="java.util.ArrayList" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<% 	User user = (User) request.getAttribute("user");
    ResultFilter resultFilter = (ResultFilter) request.getAttribute("resultFilter");
    ReadTracker readTracker = forumFactory.getReadTracker();
    WatchManager watchManager = forumFactory.getWatchManager();
    String trackerClass = ""; %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <title>TopCoder Forums</title>
    <jsp:include page="script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_forums"/>
    </jsp:include>

</head>

<body>

<jsp:include page="top.jsp">
    <jsp:param name="level1" value="forums"/>
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
        Iterator itCategories = (Iterator)request.getAttribute("categoriesIterator_"+category.getID());
        Iterator itForums = (Iterator)request.getAttribute("forumsIterator_"+category.getID());
       	long numActiveCategories = ((Long)request.getAttribute("numActiveCategories_"+category.getID())).longValue();
        long numActiveForums = ((Long)request.getAttribute("numActiveForums_"+category.getID())).longValue();
        if (numActiveCategories > 0) { 
        	Hashtable imageDataTable = (Hashtable)request.getAttribute("imageDataTable_"+category.getID()); %>
    <br>
    <table cellpadding="0" cellspacing="0" class="rtTable">
        <tr>
            <td class="rtHeader" width="100%">
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
            </td>
            <td class="rtHeader"><div style="width:80px;">T./M.</div></td>
            <td class="rtHeader" align="center" colspan="2"><div style="width:320px;">Last Post</div></td>
        </tr>
        <tc-webtag:iterator id="subcategory" type="com.jivesoftware.forum.ForumCategory" iterator='<%=itCategories%>'>
	
            <% trackerClass = (user == null || subcategory.getMessageCount() <= 0 || subcategory.getLatestMessage() == null || readTracker.getReadStatus(user, subcategory.getLatestMessage()) == ReadTracker.READ
                    || ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, subcategory.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold"; %>
            <% if ((subcategory.getMessageCount() > 0  && subcategory.getLatestMessage() != null) || ("true".equals(category.getProperty(ForumConstants.PROPERTY_SHOW_EMPTY_FORUMS_ON_MAIN)))) { %>
            <tr>
                <td class="rtThreadCellWrap">
                	<%	if (category.getID() == WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID) { %>
                	  	<%	ImageData imageData = (ImageData)imageDataTable.get(String.valueOf(subcategory.getID())); %>
                		<%	if (!"".equals(StringUtils.checkNull(imageData.getPhaseIcon()))) { %>
                			<img align="absmiddle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/i/<%=imageData.getPhaseIcon()%>" alt="<%=imageData.getPhaseText()%>" width="25" height="17" border="0">
                		<%	} %>
                		<%	if (!"".equals(StringUtils.checkNull(imageData.getTechnologyIcon()))) { %>
							<img align="absmiddle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/i/<%=imageData.getTechnologyIcon()%>" alt="<%=imageData.getTechnologyText()%>" border="0"/>
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
        <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=itForums%>'>
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

<div style="clear:both;">&nbsp;</div>

</td>
<!-- Center Column Ends -->

</tr>
</table>

<jsp:include page="foot.jsp"/>

</body>

</html>