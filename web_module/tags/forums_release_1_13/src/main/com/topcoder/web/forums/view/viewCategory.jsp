<%  response.setHeader( "Expires", "Sat, 6 May 1995 12:00:00 GMT" );
    response.setHeader( "Cache-Control", "no-store, no-cache, must-revalidate" );
    response.addHeader( "Cache-Control", "post-check=0, pre-check=0" );
    response.setHeader( "Pragma", "no-cache" ); %>

<%@ page import="com.topcoder.web.common.BaseServlet,
                 com.topcoder.web.common.StringUtils,
                 com.topcoder.web.forums.ForumConstants,
                 com.topcoder.web.forums.controller.ForumsUtil,
                 com.jivesoftware.base.JiveConstants,
                 com.jivesoftware.base.User,
                 com.jivesoftware.forum.ResultFilter,
                 com.jivesoftware.forum.ReadTracker,
                 com.jivesoftware.forum.WatchManager,
                 com.jivesoftware.forum.action.util.Page,
                 com.jivesoftware.forum.action.util.Paginator,
                 java.util.Iterator,
                 java.util.Enumeration"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forumCategory" name="forumCategory" type="com.jivesoftware.forum.ForumCategory" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>
<tc-webtag:useBean id="unreadCategories" name="unreadCategories" type="java.lang.String" toScope="request"/>

<%  User user = (User)request.getAttribute("user"); 
    ResultFilter resultFilter = (ResultFilter)request.getAttribute("resultFilter"); 
    ReadTracker readTracker = forumFactory.getReadTracker(); 
    WatchManager watchManager = forumFactory.getWatchManager();
    String trackerClass = "";
    String sortField = (String)request.getAttribute("sortField");
    String sortOrder = (String)request.getAttribute("sortOrder");
    
    StringBuffer linkBuffer = new StringBuffer("?module=Category");
    linkBuffer.append("&").append(ForumConstants.CATEGORY_ID).append("=").append(forumCategory.getID());

    StringBuffer forumLinkBuffer = new StringBuffer(linkBuffer.toString());
    StringBuffer dateLinkBuffer = new StringBuffer(linkBuffer.toString());
    forumLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.FORUM_NAME);
    dateLinkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(JiveConstants.MODIFICATION_DATE);
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
    String forumLink = forumLinkBuffer.toString();
    String dateLink = dateLinkBuffer.toString();

    if (!sortField.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_FIELD).append("=").append(sortField);
    }
    if (!sortOrder.equals("")) {
        linkBuffer.append("&").append(ForumConstants.SORT_ORDER).append("=").append(sortOrder);
    }
    
    linkBuffer.append("&").append(ForumConstants.START_IDX).append("=");
    String link = linkBuffer.toString();
    String prevLink = linkBuffer.toString()+String.valueOf(paginator.getPreviousPageStart());
    String nextLink = linkBuffer.toString()+String.valueOf(paginator.getNextPageStart());
%>

<html>
<head>
<title>TopCoder Forums</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    <jsp:include page="script.jsp" />
        <jsp:include page="/style.jsp">
          <jsp:param name="key" value="tc_forums"/>
        </jsp:include>

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
               <jsp:param name="node" value="forums"/>
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
<tr>
   <td class="categoriesBox" style="padding-right: 20px;">
      <jsp:include page="categoriesHeader.jsp" />
   </td>
   <td nowrap="nowrap" valign="top" width="100%" style="padding-right: 20px;">
       <jsp:include page="searchHeader.jsp" ></jsp:include>
    </td>
    <td align="right" nowrap="nowrap" valign="top">
        <A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br/>
    </td>
</tr>
<tr><td colspan="2" style="padding-bottom:3px;"><b>
    <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forumCategory)%>'>
        <%  if (category.getID() != forumCategory.getID()) { %>
            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>" class="rtbcLink"><jsp:getProperty name="category" property="name"/></A> > 
        <%  } else { %>
            <jsp:getProperty name="category" property="name"/>
        <%  } %> 
    </tc-webtag:iterator>
    </b></td>
   <% Page[] pages; %>
   <% if (paginator.getNumPages() > 1) { %>
      <td class="rtbc" align="right"><b>
         <%  if (paginator.getPreviousPage()) { %>
            <A href="<%=prevLink%>" class="rtbcLink">
                  << PREV</A>&#160;&#160;&#160;
           <%  } %> [
           <%  pages = paginator.getPages(5);
               for (int i=0; i<pages.length; i++) {
           %>  <%  if (pages[i] != null) { %>
                    <%  if (pages[i].getNumber() == paginator.getPageIndex()+1) { %>
                          <span class="currentPage"><%= pages[i].getNumber() %></span>
                    <%  } else { %>
                           <A href="<%=link%><%=pages[i].getStart()%>" class="rtbcLink">
                            <%= pages[i].getNumber() %></A>
                      <%  } %>
               <%  } else { %> ... <%  } %>
           <%  } %> ]
         <%  if (paginator.getNextPage()) { %>
             &#160;&#160;&#160;<A href="<%=nextLink%>" class="rtbcLink">NEXT >></A>
         <%  } %>
      </b></td></tr>
   <% } %>
</tr>
</table>

            <%  if (forumCategory.getForumCount() > 0) { %>
            <table cellpadding="0" cellspacing="0" class="rtTable">
                <tr>
                    <td class="rtHeader" width="100%"><a href="<%=forumLink%>" class="rtbcLink">Forum</a></td>
                    <td class="rtHeader">T./M.</td>
                    <td class="rtHeader" align="center" colspan="2" nowrap="nowrap"><a href="<%=dateLink%>" class="rtbcLink">Last Post</a></td>
                </tr>
                <tc-webtag:iterator id="forum" type="com.jivesoftware.forum.Forum" iterator='<%=(Iterator)request.getAttribute("forums")%>'>
                    <%  trackerClass = (user == null || forum.getLatestMessage() == null || readTracker.getReadStatus(user, forum.getLatestMessage()) == ReadTracker.READ
                    || ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, forum.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold"; %>
                    <tr>
                        <td class="rtThreadCellWrap">
                        <%  if (user == null) { %>
                            <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&<%=ForumConstants.MESSAGE_COUNT%>=<jsp:getProperty name="forum" property="messageCount"/>" class="rtLinkNew"><jsp:getProperty name="forum" property="name"/></A>
                        <%  } else { %>
                            <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>" class="<%=trackerClass%>"><jsp:getProperty name="forum" property="name"/></A>
                        <%  } %>
                            <% if (forum.getDescription() != null) { %><br/><div class="rtDescIndent"><jsp:getProperty name="forum" property="description"/></div><% } %></td>
                        <td class="rtThreadCell"><jsp:getProperty name="forum" property="threadCount"/>&#160;/&#160;<jsp:getProperty name="forum" property="messageCount"/></td>
                        <% if (forum.getMessageCount() > 0) { %>
                            <tc-webtag:useBean id="message" name="forum" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                            <td class="rtThreadCell"><b><tc-webtag:beanWrite name="message" property="modificationDate" format="EEE, MMM d yyyy 'at' h:mm a"/></b></td>
                            <% if (message.getUser() != null) { %>
                                <td class="rtThreadCell"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
                            <% } else { %>
                                <td class="rtThreadCell">&nbsp;</td>
                            <% } %>
                        <% } else { %>
                            <td class="rtThreadCell">&nbsp;</td>
                            <td class="rtThreadCell">&nbsp;</td>
                        <% } %>
                    </tr>
                </tc-webtag:iterator>
            </table>
            <%  } %>
            
            <%  if (forumCategory.getCategoryCount() > 0) { %>
            <%  if (forumCategory.getForumCount() > 0) { %><br><% } %>
            <table cellpadding="0" cellspacing="0" class="rtTable">
                <tr>
                    <td class="rtHeader" width="80%">Category</td>
                    <td class="rtHeader" width="20%"><%  if (forumCategory.getID() != 1) { %>T./M.<%  } %></td>
                    <td class="rtHeader" align="center" colspan="2">Last Post</td>
                </tr>
                <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=(Iterator)request.getAttribute("categories")%>'>
                    <%  if (forumCategory.getID() == 1) {
                            String leftNavName = StringUtils.checkNull(category.getProperty(ForumConstants.PROPERTY_LEFT_NAV_NAME));
                            trackerClass = (!leftNavName.equals("") && unreadCategories.indexOf(leftNavName) == -1) ? "rtLinkOld" : "rtLinkBold";
                        } else {
                            trackerClass = (user == null || category.getLatestMessage() == null || readTracker.getReadStatus(user, category.getLatestMessage()) == ReadTracker.READ
                            || ("true".equals(user.getProperty("markWatchesRead")) && watchManager.isWatched(user, category.getLatestMessage().getForumThread()))) ? "rtLinkOld" : "rtLinkBold";
                        } %>
                    <tr>
                        <td class="rtThreadCellWrap">
                        <%  if (user == null) { %>
                            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>&<%=ForumConstants.MESSAGE_COUNT%>=<jsp:getProperty name="category" property="messageCount"/>" class="rtLinkNew"><jsp:getProperty name="category" property="name"/></A>
                        <%  } else { %>
                            <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>" class="<%=trackerClass%>"><jsp:getProperty name="category" property="name"/></A>
                        <%  } %>
                            <% if (category.getDescription() != null) { %><br/><div class="rtDescIndent"><jsp:getProperty name="category" property="description"/></div><% } %></td>
                        <td class="rtThreadCell"><%  if (forumCategory.getID() != 1) { %><jsp:getProperty name="category" property="threadCount"/>&#160;/&#160;<jsp:getProperty name="category" property="messageCount"/><%  } %></td>
                        <% if (category.getLatestMessage() != null) { %>
                            <tc-webtag:useBean id="message" name="category" type="com.jivesoftware.forum.ForumMessage" toScope="page" property="latestMessage"/>
                            <td class="rtThreadCell"><b><tc-webtag:beanWrite name="message" property="modificationDate" format="EEE, MMM d yyyy 'at' h:mm a"/></b></td>
                            <% if (message.getUser() != null) { %>
                                <td class="rtThreadCell"><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/></td>
                            <% } else { %>
                                <td class="rtThreadCell"></td>
                            <% } %>
                        <% } else { %>
                            <td class="rtThreadCell"></td>
                            <td class="rtThreadCell"></td>
                        <% } %>
                    </tr>
                </tc-webtag:iterator>
            </table>
            <%  } %>
            
            <table cellpadding="0" cellspacing="0" class="rtbcTable">
                <tr>
                    <%  if (forumCategory.getID() != 1) { %>
                    <td>A forum with a <b>bold title</b> indicates it either has a new thread or has a thread with new postings. <%if (user!=null) {%><A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="forumCategory" property="ID"/>&<%=ForumConstants.MARK_READ%>=t" class="rtbcLink">(Mark all as read)</A><%}%></td>
                    <%  } else { %>
                    <td>A category with a <b>bold title</b> in the left navigation indicates it has a forum with new postings. <%if (user!=null) {%><A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="forumCategory" property="ID"/>&<%=ForumConstants.MARK_READ%>=t" class="rtbcLink">(Mark all as read)</A><%}%></td>
                    <%  } %>
                    <td align="right"><a href="?module=RSS&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="forumCategory" property="ID"/>"><img border="0" src="http://www.topcoder.com/i/interface/btn_rss.gif" alt="RSS" /></a></td>
                </tr>
            </table>

         <br><br><br>
        </td>
<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>