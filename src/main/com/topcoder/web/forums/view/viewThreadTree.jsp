<%@ page import="com.topcoder.web.common.BaseServlet,
                com.topcoder.web.common.BaseProcessor,
                com.topcoder.web.forums.ForumConstants,
                com.topcoder.web.forums.controller.ForumsUtil,
                com.topcoder.web.common.StringUtils,
                com.jivesoftware.base.User,
                com.jivesoftware.base.JiveConstants,
                com.jivesoftware.forum.action.util.Page,
                com.jivesoftware.forum.ForumMessage,
                com.jivesoftware.forum.WatchManager,
                com.jivesoftware.forum.Watch,
                com.jivesoftware.forum.ForumThread,
                com.jivesoftware.forum.ReadTracker,
                java.util.*,
                com.topcoder.shared.util.DBMS"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<tc-webtag:useBean id="authToken" name="authToken" type="com.jivesoftware.base.AuthToken" toScope="request"/>
<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="thread" name="thread" type="com.jivesoftware.forum.ForumThread" toScope="request"/>
<tc-webtag:useBean id="activeMessage" name="activeMessage" type="com.jivesoftware.forum.ForumMessage" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>
<tc-webtag:useBean id="historyBean" name="historyBean" type="com.topcoder.web.ejb.messagehistory.MessageHistory" toScope="request"/>

<%  HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
    User user = (User)request.getAttribute("user");
    String threadView = StringUtils.checkNull(request.getParameter(ForumConstants.THREAD_VIEW));
    ReadTracker readTracker = forumFactory.getReadTracker();
    ForumThread nextThread = (ForumThread)request.getAttribute("nextThread");
    ForumThread prevThread = (ForumThread)request.getAttribute("prevThread");
    boolean showPrevNextThreads = !(user != null && "false".equals(user.getProperty("jiveShowPrevNextThreads")));
    String prevTrackerClass = "", nextTrackerClass = "";
    ForumMessage prevPost = null, nextPost = null;

    String cmd = "";
    String watchMessage = "";
    WatchManager watchManager = forumFactory.getWatchManager();
    if (!authToken.isAnonymous() && watchManager.isWatched(user, thread)) {
       Watch watch = watchManager.getWatch(user, thread);
       watchMessage = "Stop Watching Thread";
       cmd = "remove";
    } else {
       watchMessage = "Watch Thread";
       cmd = "add";
    } %>

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
            <jsp:param name="level2" value=""/>
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
   <td nowrap="nowrap" valign="top">
       <jsp:include page="searchHeader.jsp" ></jsp:include>
   </td>
   <td align="right" nowrap="nowrap" valign="top">
   <A href="?module=Watch&<%=ForumConstants.WATCH_TYPE%>=<%=JiveConstants.THREAD%>&<%=ForumConstants.WATCH_ID%>=<jsp:getProperty name="thread" property="ID"/><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>&<%=ForumConstants.WATCH_COMMAND%>=<%=cmd%>"
   class="rtbcLink"><%=watchMessage%></A>&#160;&#160;|&#160;&#160;<A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br>
   View:
   <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>&<%=ForumConstants.THREAD_VIEW%>=flat" class="rtbcLink">Flat</A>&#160;&#160;|
   <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>&<%=ForumConstants.THREAD_VIEW%>=threaded" class="rtbcLink">Threaded</A>&#160;&#160;|
   <span class="currentPage">Tree</span>
   <% if (errors.get(ForumConstants.WATCH_THREAD) != null) { %><br><font color="red"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.WATCH_THREAD%>"><%=err%></tc-webtag:errorIterator></font><% } %>
   </td>
</tr>

<tr><td><b><A href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Forums</A>
   <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
        >> <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>&mc=<jsp:getProperty name="category" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="category" property="name"/></A> 
   </tc-webtag:iterator> >>
   <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A> >>
   <jsp:getProperty name="thread" property="name"/></b>
   <%   if (showPrevNextThreads && (nextThread != null || prevThread != null)) { %><br>
        <% if (prevThread != null) { %>
            <%  prevPost = ForumsUtil.getLatestMessage(prevThread); 
                prevTrackerClass = (user == null || readTracker.getReadStatus(user, prevPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=prevThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=prevThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=prevTrackerClass%>">Previous Thread</A>
        <% } else { %>
           Previous Thread
        <% } %>&#160;|&#160;
        <% if (nextThread != null) { %>
            <%  nextPost = ForumsUtil.getLatestMessage(nextThread); 
                nextTrackerClass = (user == null || readTracker.getReadStatus(user, nextPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=nextThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=nextThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=nextTrackerClass%>">Next Thread</A>
        <% } else { %>
           Next Thread
        <% } %>
   <%   }   %>
   </td>
</tr>
</table>

<%-------------ACTIVE POST---------------%>
<table cellpadding="0" cellspacing="0" class="rtTable">
   <tr>
      <td class="rtHeader" colspan="2">
         <div valign="top" style="float: right; padding-left: 5px; white-space: nowrap;">
            <%  int editCount = historyBean.getEditCount(activeMessage.getID(), DBMS.FORUMS_DATASOURCE_NAME);
            if (editCount == 1) { %> 
            <a href="?module=RevisionHistory&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="activeMessage" property="ID"/>" class="rtbcLink" title="Last updated <tc-webtag:beanWrite name="activeMessage" property="modificationDate" format="MMM d, yyyy 'at' h:mm a z"/>">1 edit</a> | 
            <%  } else if (editCount > 1) { %> 
            <a href="?module=RevisionHistory&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="activeMessage" property="ID"/>" class="rtbcLink" title="Last updated <tc-webtag:beanWrite name="activeMessage" property="modificationDate" format="MMM d, yyyy 'at' h:mm a z"/>"><%=editCount%> edits</a> | 
            <%  } %></a>
            <a name=<jsp:getProperty name="activeMessage" property="ID"/>><tc-webtag:beanWrite name="activeMessage" property="creationDate" format="MMM d, yyyy 'at' h:mm a z"/>
         </div>

         <jsp:getProperty name="activeMessage" property="subject"/></a>
         <%  if (activeMessage.getParentMessage() != null) { %>
         (response to <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=activeMessage.getParentMessage().getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">post</A><%if (activeMessage.getParentMessage().getUser() != null) {%> by <tc-webtag:handle coderId="<%=activeMessage.getParentMessage().getUser().getID()%>"/><%}%>)
         <%  } %>
         </a>
         &#160;>>&#160; <A href="?module=Post&<%=ForumConstants.POST_MODE%>=Reply&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="activeMessage" property="ID"/>" class="rtbcLink">Reply</A>
         <%  if (activeMessage.getUser() != null && activeMessage.getUser().equals(user)) { %>
         | <A href="?module=Post&<%=ForumConstants.POST_MODE%>=Edit&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="activeMessage" property="ID"/>" class="rtbcLink">Edit</A>
         <%  } %>
      </td>
   </tr>
   <tr>
   <td class="rtPosterCell">
      <div class="rtPosterSpacer">
         <%  if (activeMessage.getUser() != null && !("false".equals(activeMessage.getUser().getProperty("jiveDisplayMemberPhoto"))) && activeMessage.getUser().getProperty("imagePath") != null) { %>
            <img src="<%=activeMessage.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br>
         <%  } %>
         <span class="bodyText"><%if (activeMessage.getUser() != null) {%><tc-webtag:handle coderId="<%=activeMessage.getUser().getID()%>"/><%}%></span><br><%if (activeMessage.getUser() != null) {%><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=activeMessage.getUser().getID()%>"><%=forumFactory.getUserMessageCount(activeMessage.getUser())%> posts</A><%}%>
      </div>
   </td>
   <td class="rtTextCell" width="100%"><jsp:getProperty name="activeMessage" property="body"/></td></tr>
</table>
<%-------------ACTIVE POST ENDS----------%>

<%-------------POSTS---------------%>
<table cellpadding="0" cellspacing="0" class="rtTable">
    <tr>
        <td class="rtHeader" width="100%">Subject</td>
        <td class="rtHeader">Author</td>
        <td class="rtHeader">Date</td>
    </tr>
   <tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage" iterator='<%=(Iterator)request.getAttribute("messages")%>'>
   <tr>
      <td class="rtThreadCellWrap">
      <%  boolean active = message.getID() == activeMessage.getID();
         int depth=thread.getTreeWalker().getMessageDepth(message);
         int width=Math.min(depth*10, 500);
      if (depth > 0) { %><img src="/images/clear.gif" width="<%=width%>" height="1"/><% } %>
      <% if (active) { %>
         <b><A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink"><jsp:getProperty name="message" property="subject"/></A></b></td>
      <% } else { %>
         <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink"><jsp:getProperty name="message" property="subject"/></A></td>
      <% } %>
         <td class="rtThreadCell"><%if (message.getUser() != null) {%><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/><%}%></td>
         <td class="rtThreadCell"><strong><tc-webtag:beanWrite name="message" property="creationDate" format="MMM d, yyyy 'at' h:mm a z"/></strong></td>
    </tr>
   </tc-webtag:iterator>
</table>
<%-------------POSTS END---------------%>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr><td><b><A href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Forums</A>
   <tc-webtag:iterator id="category" type="com.jivesoftware.forum.ForumCategory" iterator='<%=ForumsUtil.getCategoryTree(forum.getForumCategory())%>'>
        >> <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<jsp:getProperty name="category" property="ID"/>&mc=<jsp:getProperty name="category" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="category" property="name"/></A> 
   </tc-webtag:iterator> >>
   <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<jsp:getProperty name="forum" property="ID"/>&mc=<jsp:getProperty name="forum" property="messageCount"/>" class="rtbcLink"><jsp:getProperty name="forum" property="name"/></A> >>
   <jsp:getProperty name="thread" property="name"/></b>
   <%   if (showPrevNextThreads && (nextThread != null || prevThread != null)) { %><br>
        <% if (prevThread != null) { %>
            <%  prevPost = ForumsUtil.getLatestMessage(prevThread); 
                prevTrackerClass = (user == null || readTracker.getReadStatus(user, prevPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=prevThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=prevThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=prevTrackerClass%>">Previous Thread</A>
        <% } else { %>
           Previous Thread
        <% } %>&#160;|&#160;
        <% if (nextThread != null) { %>
            <%  nextPost = ForumsUtil.getLatestMessage(nextThread); 
                nextTrackerClass = (user == null || readTracker.getReadStatus(user, nextPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=nextThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=nextThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=nextTrackerClass%>">Next Thread</A>
        <% } else { %>
           Next Thread
        <% } %>
   <%   }   %>
   </td>
    <td align="right"><a href="?module=RSS&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>"><img border="none" src="http://www.topcoder.com/i/interface/btn_rss.gif"/></a></td>
</table>

        <p><br></p>
        </td>

<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
