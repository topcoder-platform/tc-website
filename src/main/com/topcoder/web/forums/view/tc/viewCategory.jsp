<%@ page import="com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.Permissions,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.ForumPermissions,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.Watch,
                 com.jivesoftware.forum.WatchManager,
                 com.jivesoftware.forum.action.util.Page,
                 com.topcoder.shared.util.ApplicationServer,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.common.WebConstants"
        %>
<%@ page import="com.topcoder.web.forums.ForumConstants" %>
<%@ page import="com.topcoder.web.forums.controller.ForumsUtil" %>
<%@ page import="com.topcoder.web.forums.model.ImageData" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %>

<tc-webtag:useBean id="authToken" name="authToken" type="com.jivesoftware.base.AuthToken" toScope="request"/>
<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forumCategory" name="forumCategory" type="com.jivesoftware.forum.ForumCategory" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<%	User user = (User) request.getAttribute("user");
    ResultFilter resultFilter = (ResultFilter) request.getAttribute("resultFilter");
    ReadTracker readTracker = forumFactory.getReadTracker();
    WatchManager watchManager = forumFactory.getWatchManager();
    String trackerClass = "";
    String sortField = (String) request.getAttribute("sortField");
    String sortOrder = (String) request.getAttribute("sortOrder");

    StringBuffer linkBuffer = new StringBuffer("?module=Category");
    linkBuffer.append("&").append(ForumConstants.CATEGORY_ID).append("=").append(forumCategory.getID());

    StringBuffer forumLinkBuffer = new StringBuffer(linkBuffer.toString());
    forumLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.FORUM_NAME);    
    if (sortField.equals(String.valueOf(JiveConstants.FORUM_NAME))) {
        if (sortOrder.equals(String.valueOf(ResultFilter.ASCENDING))) {
            forumLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        } else if (sortOrder.equals(String.valueOf(ResultFilter.DESCENDING))) {
            forumLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        } else {  // default
            forumLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        }
    } else {  // default
        forumLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
    }
    String forumLink = forumLinkBuffer.toString();
    
    StringBuffer dateLinkBuffer = new StringBuffer(linkBuffer.toString());
    dateLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.MODIFICATION_DATE);
    if (sortField.equals(String.valueOf(JiveConstants.MODIFICATION_DATE))) {
        if (sortOrder.equals(String.valueOf(ResultFilter.ASCENDING))) {
            dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        } else if (sortOrder.equals(String.valueOf(ResultFilter.DESCENDING))) {
            dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        } else {  // default
            dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        }
    } else {  // default
        dateLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
    }
    String dateLink = dateLinkBuffer.toString();

    if (!sortField.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(sortField);
    }
    if (!sortOrder.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(sortOrder);
    }

    linkBuffer.append("&").append(ForumConstants.START_IDX).append("=");
    String link = linkBuffer.toString();
    String prevLink = linkBuffer.toString() + String.valueOf(paginator.getPreviousPageStart());
    String nextLink = linkBuffer.toString() + String.valueOf(paginator.getNextPageStart());
    
    String cmd = "";
    String watchMessage = "";
    if (!authToken.isAnonymous() && watchManager.isWatched(user, forumCategory)) {
       Watch watch = watchManager.getWatch(user, forumCategory);
       watchMessage = "Stop Watching Forums";
       cmd = "remove";
    } else {
       watchMessage = "Watch Forums";
       cmd = "add";
    }
%>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
    
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
            <jsp:include page="includes/global_left.jsp">
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
                    <%  if (ForumsUtil.isSoftwareSubcategory(forumCategory)) { %>
	                	<%	ImageData imageData = (ImageData)request.getAttribute("imageData"); %>
	            		<%	if (!"".equals(StringUtils.checkNull(imageData.getPhaseIcon()))) { %>
	                		<img align="middle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/i/<%=imageData.getPhaseIcon()%>" alt="<%=imageData.getPhaseText()%>" width="25" height="17" border="0">
						<%	} %>
						<%	if (!"".equals(StringUtils.checkNull(imageData.getTechnologyIcon()))) { %>
							<img align="middle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/i/<%=imageData.getTechnologyIcon()%>" alt="<%=imageData.getTechnologyText()%>" border="0"/>
						<%	} %>
            		<%	} %>
                </td>
                <td align="right" nowrap="nowrap" valign="top">
                	<%	if (ForumsUtil.isSoftwareSubcategory(forumCategory) || ForumsUtil.isDirectProjectSubcategory(forumCategory)) { %>
                		<A href="?module=Watch&<%=ForumConstants.WATCH_TYPE%>=<%=JiveConstants.FORUM_CATEGORY%>&<%=ForumConstants.WATCH_ID%>=<%=forumCategory.getID()%>&<%=ForumConstants.WATCH_COMMAND%>=<%=cmd%>" class="rtbcLink"><%=watchMessage%></A>&#160; |&#160;
                	<%	} %>
                	<%	boolean isAuthorized = forumCategory.isAuthorized(Permissions.SYSTEM_ADMIN) || 
        					forumCategory.isAuthorized(ForumPermissions.FORUM_CATEGORY_ADMIN);
        				boolean canModifyForums = "true".equals(forumCategory.getProperty(ForumConstants.PROPERTY_MODIFY_FORUMS)) && isAuthorized;
        				if (canModifyForums) {	%>
        					<A href="?module=CreateForum&<%=ForumConstants.CATEGORY_ID%>=<%=forumCategory.getID()%>&<%=ForumConstants.POST_MODE%>=New" class="rtbcLink">Create Forum</A>&#160; |&#160; 
        			<%	} %>
                    <A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
                    <%	if (forumFactory.getRootForumCategory().equals(forumCategory) ||
                    		forumFactory.getRootForumCategory().equals(forumCategory.getParentCategory())) { %>
	                    <div style="float:right; margin: 30px 0px 10px 10px;">
	                        <A href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/forums"><img src="/i/roundTables/studioForums.png" alt="TopCoder Studio Forums" /></A>
	                    </div>
                    <%	} %>
                </td>
            </tr>
            <tr>
            	<%	int colspan = (paginator.getNumPages () > 1) ? 2 : 3; %>
            	<td colspan="<%=colspan%>" style="padding-bottom:3px;"><b>
                <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forumCategory)%>'>
                    <% if (category.getID() != forumCategory.getID()) { %>
                    	<A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
                    	<img src="/i/interface/exp_w.gif" align="absmiddle"/>
                    <% } else { %>
                    	<%=category.getName()%>
                    <% } %>
                </tc-webtag:iterator>
                <%	boolean showComponentLink = "true".equals((String)request.getAttribute("showComponentLink"));
                	if (showComponentLink) { %>
                		(<a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=forumCategory.getProperty(ForumConstants.PROPERTY_COMPONENT_ID)%>" class="rtbcLink">Component</a>)	
				<%	} %>
            </b></td>
                <% Page[] pages; %>
                <% if (paginator.getNumPages() > 1) { %>
                <td class="rtbc" align="right"><b>
                    <% if (paginator.getPreviousPage()) { %>
                    <A href="<%=prevLink%>" class="rtbcLink">
                        << PREV</A>&#160;&#160;&#160;
                    <% } %> [
                    <% pages = paginator.getPages(5);
                        for (int i = 0; i < pages.length; i++) {
                    %>  <% if (pages[i] != null) { %>
                    <% if (pages[i].getNumber() == paginator.getPageIndex() + 1) { %>
                    <span class="currentPage"><%= pages[i].getNumber() %></span>
                    <% } else { %>
                    <A href="<%=link%><%=pages[i].getStart()%>" class="rtbcLink">
                        <%= pages[i].getNumber() %></A>
                    <% } %>
                    <% } else { %> ... <% } %>
                    <% } %> ]
                    <% if (paginator.getNextPage()) { %>
                    &#160;&#160;&#160;<A href="<%=nextLink%>" class="rtbcLink">NEXT ></A>
                    <% } %>
                </b></td></tr>
            <% } %>
    </tr>
</table>

<% if (forumCategory.getForumCount() > 0) { %>
<table cellpadding="0" cellspacing="0" class="rtTable" style="margin-bottom:6px;">
    <tr>
        <td class="rtHeader" width="100%"><a href="<%=forumLink%>" class="rtbcLink">Forum</a></td>
        <td class="rtHeader"><div style="width:80px;">T./M.</div></td>
        <td class="rtHeader" align="center" colspan="2" nowrap="nowrap">
        	<div style="width:320px;"><a href="<%=dateLink%>" class="rtbcLink">Last Post</a></div>
        </td>
    </tr>
    <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=(Iterator)request.getAttribute("forums")%>'>
        <% trackerClass = (user == null || forum.getLatestMessage() == null || readTracker.getReadStatus(user, forum.getLatestMessage()) == ReadTracker.READ
                || ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, forum.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold"; %>
        <tr>
            <td class="rtThreadCellWrap">
                <% if (user == null) { %>
                <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&<%=ForumConstants.MESSAGE_COUNT%>=<%=forum.getMessageCount()%>" class="rtLinkNew"><%=forum.getName()%></A>
                <% } else { %>
                <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>" class="<%=trackerClass%>"><%=forum.getName()%></A>
                <% } %>
                <% if (forum.getDescription() != null) { %><br/>
	                <div class="rtDescIndent"><%=forum.getDescription()%>
	                	<%	if (canModifyForums) { %>
	                	(<A href="?module=CreateForum&<%=ForumConstants.CATEGORY_ID%>=<%=forumCategory.getID()%>&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&<%=ForumConstants.POST_MODE%>=Edit" class="rtbcLink">Edit</A>)
	                	<%	} %>
	                </div>
                <% } %>
            </td>
            <td class="rtThreadCell" style="width: 80px;"><%=forum.getThreadCount()%>&#160;/&#160;<%=forum.getMessageCount()%></td>
            <% if (forum.getMessageCount() > 0) { %>
            <tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
            <td class="rtThreadCell" style="width: 220px;"><b>
                <tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></b>
            </td>
            <% if (message.getUser() != null) { %>
            <td class="rtThreadCell" style="width: 100px;">
            	<tc-webtag:handle coderId="<%=message.getUser().getID()%>"/>
            </td>
            <% } else { %>
            <td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
            <% } %>
            <% } else { %>
            <td class="rtThreadCell" style="width: 220px;">&nbsp;</td>
            <td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
            <% } %>
        </tr>
    </tc-webtag:iterator>
</table>
<% } else if (forumCategory.getCategoryCount() > 0) { 
	Hashtable imageDataTable = (Hashtable) request.getAttribute("imageDataTable"); %>
<table cellpadding="0" cellspacing="0" class="rtTable" style="margin-bottom:6px;">
    <tr>
        <td class="rtHeader" width="100%"><a href="<%=forumLink%>" class="rtbcLink">Category</a></td>
        <td class="rtHeader"><div style="width:80px;"><% if (forumCategory.getID() != 1) { %>T./M.<% } %></div></td>
        <td class="rtHeader" align="center" colspan="2" nowrap="nowrap">
        	<div style="width:320px;"><a href="<%=dateLink%>" class="rtbcLink">Last Post</a></div>
        </td>
    </tr>
    <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=(Iterator)request.getAttribute("categories")%>'>
        <% if (forumCategory.getID() == 1) {
            String leftNavName = StringUtils.checkNull(category.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME));
            trackerClass = (!leftNavName.equals("") && unreadCategories.indexOf(leftNavName) == -1) ? "rtLinkOld" : "rtLinkBold";
        } else {
            trackerClass = (user == null || category.getLatestMessage() == null || readTracker.getReadStatus(user, category.getLatestMessage()) == ReadTracker.READ
                    || ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, category.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold";
        } %>
        <tr>
            <td class="rtThreadCellWrap">
            	<%	if (forumCategory.getID() == WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID) { %>
            	    <%	ImageData imageData = (ImageData)imageDataTable.get(String.valueOf(category.getID())); %>
            		<%	if (!"".equals(StringUtils.checkNull(imageData.getPhaseIcon()))) { %>
                		<img align="absmiddle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/i/<%=imageData.getPhaseIcon()%>" alt="<%=imageData.getPhaseText()%>" width="25" height="17" border="0">
					<%	} %>
					<%	if (!"".equals(StringUtils.checkNull(imageData.getTechnologyIcon()))) { %>
						<img align="absmiddle" src="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/i/<%=imageData.getTechnologyIcon()%>" alt="<%=imageData.getTechnologyText()%>" border="0"/>
					<%	} %>
					&#160;
				<%	} %>
                <% if (user == null) { %>
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>&<%=ForumConstants.MESSAGE_COUNT%>=<%=category.getMessageCount()%>" class="rtLinkNew"><%=category.getName()%></A>
                <% } else { %>
                <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="<%=trackerClass%>"><%=category.getName()%></A>
                <% } %>
                <% if (category.getDescription() != null) { %><br/>

                <div class="rtDescIndent"><%=category.getDescription()%></div><% } %></td>
            <td class="rtThreadCell" style="width: 80px;"><% if (forumCategory.getID() != 1) { %>
                <%=category.getThreadCount()%>&#160;/&#160;<%=category.getMessageCount()%><% } %></td>
            <% if (category.getLatestMessage() != null) { %>
            <tc-webtag:useBean id="message" name="category" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
            <td class="rtThreadCell" style="width: 220px;"><b>
                <tc-webtag:format object="${message.modificationDate}" format="EEE, MMM d yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></b>
            </td>
            <% if (message.getUser() != null) { %>
            <td class="rtThreadCell" style="width: 100px;">
            	<tc-webtag:handle coderId="<%=message.getUser().getID()%>"/>
            </td>
            <% } else { %>
            <td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
            <% } %>
            <% } else { %>
            <td class="rtThreadCell" style="width: 220px;">&nbsp;</td>
            <td class="rtThreadCell" style="width: 100px;">&nbsp;</td>
            <% } %>
        </tr>
    </tc-webtag:iterator>
</table>
<% } %>

<%	if (paginator.getNumPages () > 1) { %> 
<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
    	<td colspan="<%=colspan%>" style="padding-bottom:3px;"><b>
        <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forumCategory)%>'>
            <% if (category.getID() != forumCategory.getID()) { %>
            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
            <img src="/i/interface/exp_w.gif" align="absmiddle"/>
            <% } else { %>
            <%=category.getName()%>
            <% } %>
        </tc-webtag:iterator>
        <%	if (showComponentLink) { %>
        		(<a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=forumCategory.getProperty(ForumConstants.PROPERTY_COMPONENT_ID)%>" class="rtbcLink">Component</a>)	
		<%	} %>
    </b></td>
        <% if (paginator.getNumPages() > 1) { %>
        <td class="rtbc" align="right"><b>
            <% if (paginator.getPreviousPage()) { %>
            <A href="<%=prevLink%>" class="rtbcLink">
                << PREV</A>&#160;&#160;&#160;
            <% } %> [
            <% pages = paginator.getPages(5);
                for (int i = 0; i < pages.length; i++) {
            %>  <% if (pages[i] != null) { %>
            <% if (pages[i].getNumber() == paginator.getPageIndex() + 1) { %>
            <span class="currentPage"><%= pages[i].getNumber() %></span>
            <% } else { %>
            <A href="<%=link%><%=pages[i].getStart()%>" class="rtbcLink">
                <%= pages[i].getNumber() %></A>
            <% } %>
            <% } else { %> ... <% } %>
            <% } %> ]
            <% if (paginator.getNextPage()) { %>
            &#160;&#160;&#160;<A href="<%=nextLink%>" class="rtbcLink">NEXT ></A>
            <% } %>
        </b></td></tr>
    	<% } %>
    </tr>
</table>
<%	} %>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
        <% if (forumCategory.getID() != 1) { %>
        <td>A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new
            postings. <%if (user != null && forumCategory.getID() != WebConstants.TCS_FORUMS_ROOT_CATEGORY_ID) {%><A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=forumCategory.getID()%>&<%=ForumConstants.MARK_READ%>=t" class="rtbcLink">(Mark
            all as read)</A><%}%></td>
        <% } else { %>
        <td>A category with a <b>bold title</b> in the left navigation indicates it has a forum with new
            postings.</td>
        <% } %>
        <td align="right">
        	<%	if (paginator.getNumPages () > 1) { %> 
        	<div style="margin: 2px 0px 0px 0px;">
            	<a href="?module=RSS&<%=ForumConstants.CATEGORY_ID%>=<%=forumCategory.getID()%>"><img alt="RSS" border="none" src="/i/interface/btn_rss.gif"/></a>
            </div>
            <%	} else { %>
            	<a href="?module=RSS&<%=ForumConstants.CATEGORY_ID%>=<%=forumCategory.getID()%>"><img alt="RSS" border="none" src="/i/interface/btn_rss.gif"/></a>
            <% 	} %>
        </td>
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