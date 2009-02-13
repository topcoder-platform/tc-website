<%  response.setHeader( "Expires", "Sat, 6 May 1995 12:00:00 GMT" );
    response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate" );
    response.addHeader( "Cache-Control", "post-check=0, pre-check=0" );
    response.setHeader( "Pragma", "no-cache" ); %>

<%@ page import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 com.topcoder.web.forums.model.Paging,
                 com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.JiveGlobals,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.stats.ViewCountManager,
                 com.jivesoftware.forum.ForumMessage,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.WatchManager,
                 com.jivesoftware.forum.action.util.Page,
                 com.jivesoftware.forum.action.util.Paginator,
                 java.util.Iterator,
                 java.util.Enumeration"
%>

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="authToken" name="authToken" type="com.jivesoftware.base.AuthToken" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<%  WatchManager watchManager = forumFactory.getWatchManager();
    ReadTracker readTracker = forumFactory.getReadTracker();
    User user = (User)request.getAttribute("user");
    String sortField = (String)request.getAttribute("sortField");
    String sortOrder = (String)request.getAttribute("sortOrder");

    StringBuffer linkBuffer = new StringBuffer("?module=ThreadList");
    linkBuffer.append("&").append(ForumConstants.FORUM_ID).append("=").append(forum.getID());

    StringBuffer threadLinkBuffer = new StringBuffer(linkBuffer.toString());
    StringBuffer dateLinkBuffer = new StringBuffer(linkBuffer.toString());
    threadLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.THREAD_NAME);
    dateLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.MODIFICATION_DATE);
    if (sortField.equals(String.valueOf(JiveConstants.THREAD_NAME))) {
        if (sortOrder.equals(String.valueOf(ResultFilter.ASCENDING))) {
            threadLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.DESCENDING);
        } else if (sortOrder.equals(String.valueOf(ResultFilter.DESCENDING))) {
            threadLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        } else {  // default
            threadLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
        }
    } else {  // default
        threadLinkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(ResultFilter.ASCENDING);
    }
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
    String threadLink = threadLinkBuffer.toString();
    String dateLink = dateLinkBuffer.toString();

    if (!sortField.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(sortField);
    }
    if (!sortOrder.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(sortOrder);
    }
    String link = linkBuffer.toString();
%>

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/roundTables.css"/>
<jsp:include page="script.jsp" />

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="includes/global_left.jsp">
            <jsp:param name="level1" value="forums"/>
            <jsp:param name="level2" value="<%=forum.getForumCategory().getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME)%>"/>
            <jsp:param name="unreadCategories" value="<%=unreadCategories%>"/>
         </jsp:include>
      </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" class="rtBody">

        <jsp:include page="page_title.jsp" >
            <jsp:param name="image" value="forums"/>
            <jsp:param name="title" value="&#160;"/>
        </jsp:include>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr valign="top">
	<td nowrap="nowrap" valign="top">
	   <jsp:include page="searchHeader.jsp" ></jsp:include>
	</td>
	<td align="right" nowrap="nowrap" valign="top">
	   <A href="?module=Post&<%=ForumConstants.POST_MODE%>=New&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>" class="rtbcLink">Post New Thread</A>&#160;&#160;|&#160;&#160;<A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br>
	</td>
</tr>
<tr>
    <td class="rtbc">
	    <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
	       <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>" class="rtbcLink"><jsp:getProperty name="category" property="name"/></A> >> 
	    </tc-webtag:iterator>
        <jsp:getProperty name="forum" property="name"/>
    </td>
<% Page[] pages; %>
<% if (paginator.getNumPages() > 1) { %>
   <td class="rtbc" align="right"><b>
      <%  if (paginator.getPreviousPage()) { %>
         <A href="<%=link%>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="previousPageStart"/>" class="rtbcLink">
               << PREV</A>&#160;&#160;&#160;
        <%  } %> [
        <%  pages = paginator.getPages(5);
            for (int i=0; i<pages.length; i++) {
        %>  <%  if (pages[i] != null) { %>
                 <%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
                       <span class="currentPage"><%= pages[i].getNumber() %></span>
                 <%  } else { %>
                        <A href="<%=link%>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtbcLink">
                         <%= pages[i].getNumber() %></A>
                   <%  } %>
            <%  } else { %> ... <%  } %>
        <%  } %> ]
      <%  if (paginator.getNextPage()) { %>
         &#160;&#160;&#160;<A href="<%=link%>&<%=ForumConstants.START_IDX%>=<jsp:getProperty name="paginator" property="nextPageStart"/>" class="rtbcLink">NEXT >></A>
        <%  } %>
   </b></td></tr>
<% } %>
</table>

<%  if (forum.getThreadCount() > 0) { %>
<table cellpadding="0" cellspacing="0" class="rtTable">
<tr>
<td class="rtHeader" width="70%"><a href="<%=threadLink%>" class="rtbcLink">Thread</a></td>
<td class="rtHeader" width="10%">Author</td>
<td class="rtHeader" width="10%" align="right">Replies</td>
<td class="rtHeader" width="10%" align="right">Views</td>
<td class="rtHeader" align="center" colspan="2"><a href="<%=dateLink%>" class="rtbcLink">Last Post</a></td>
</tr>
<tc-webtag:iterator id="thread" type="com.jivesoftware.forum.ForumThread" iterator='<%=(Iterator)request.getAttribute("threads")%>'>
    <%  ForumMessage lastPost = ForumsUtil.getLatestMessage(thread); 
        String trackerClass = (user == null || readTracker.getReadStatus(user, lastPost) == ReadTracker.READ ||
            ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, thread))) ? "rtLinkOld" : "rtLinkBold"; %>
    <tr>
    <tc-webtag:useBean id="message" name="thread" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
    <td class="rtThreadCellWrap">
        <%  if (((authToken.isAnonymous() || user.getProperty("jiveThreadMode") == null) && ForumConstants.DEFAULT_GUEST_THREAD_VIEW.equals("flat")) || user.getProperty("jiveThreadMode").equals("flat")) { %>
            <%  if (!authToken.isAnonymous()) { %>
            <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=0" class="<%=trackerClass%>"><%=thread.getRootMessage().getSubject()%></A>
            <%  } else { %>
                <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=0&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtLinkNew"><%=thread.getRootMessage().getSubject()%></A>
            <%  } %>
         <% Paginator threadPaginator;
            ResultFilter resultFilter = ResultFilter.createDefaultMessageFilter();
            resultFilter.setStartIndex(0);
            int range = JiveGlobals.getJiveIntProperty("skin.default.defaultMessagesPerPage", 
                  ForumConstants.DEFAULT_MESSAGE_RANGE);
            if (user != null) {
                  try {
                      range = Integer.parseInt(user.getProperty("jiveMessageRange"));
                  } catch (Exception ignored) {}
            }
            resultFilter.setNumResults(range);
            threadPaginator = new Paginator(new Paging(resultFilter, thread.getMessageCount()));

            if (threadPaginator.getNumPages() > 1) { %> [
              <%  pages = threadPaginator.getPages(4);
                  for (int i=0; i<pages.length; i++) {
              %>  <%  if (pages[i] != null) { %>
                       <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<%=pages[i].getStart()%>" class="rtLinkOld">
                         <%= pages[i].getNumber() %></A>
                  <%  } %>
              <%  } %>
                <%  if (threadPaginator.getNumPages() > 4) { %>
                    <%  if (threadPaginator.getNumPages()-4 > 1) { %> ... <%  } %>
                    <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&<%=ForumConstants.START_IDX%>=<%=(threadPaginator.getNumPages()-1)*threadPaginator.getRange()%>" class="rtLinkOld">
                            <%= threadPaginator.getNumPages() %></A>
                <%  } %> ]
          <%  } %>
      <%  } else { %>
            <%  if (!authToken.isAnonymous()) { %>
               <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>" class="<%=trackerClass%>"><%=thread.getRootMessage().getSubject()%></A>
            <%  } else { %>
                <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>" class="rtLinkNew"><%=thread.getRootMessage().getSubject()%></A>
            <%  } %>
        <%  } %></td>
    <% if (thread.getRootMessage().getUser() != null) { %>
       <td class="rtThreadCell"><tc-webtag:handle coderId="<%=thread.getRootMessage().getUser().getID()%>"/></td>
    <% } else { %>
        <td class="rtThreadCell"></td>
    <% } %>
   <td class="rtThreadCell" align="right"><%=thread.getMessageCount()-1%>&#160;&#160;&#160;&#160;&#160;</td>
   <td class="rtThreadCell" align="right"><%=ViewCountManager.getInstance().getThreadCount(thread)%>&#160;&#160;&#160;&#160;</td>
   <td class="rtThreadCell"><b><A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=lastPost.getID()%>" class="rtLinkNew"><tc-webtag:beanWrite name="thread" property="modificationDate" format="EEE, MMM d yyyy 'at' h:mm a"/></A></b></td>
   <% if (lastPost.getUser() != null) { %>
        <td class="rtThreadCell"><tc-webtag:handle coderId="<%=lastPost.getUser().getID()%>"/></td>
    <% } else { %>
        <td class="rtThreadCell"></td>
    <% } %>
   </tr>
</tc-webtag:iterator>
</table>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
    <tr>
        <td>A thread with a <b>bold title</b> indicates it is either a new thread or has new postings. <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&<%=ForumConstants.MARK_READ%>=t" class="rtbcLink">(Mark all as read)</A></td>
        <td align="right"><a href="?module=RSS&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>"><img border="none" src="http://www.topcoder.com/i/interface/btn_rss.gif"/></a></td>
    </tr>
</table>
<%  } else { %>
    <span class="bigRed"><A href="?module=Post&<%=ForumConstants.POST_MODE%>=New&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>" class="bigRed">Be the first to post in this forum!</A></span>
<%  } %>

        <p><br/></p>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
