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
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>
<tc-webtag:useBean id="historyBean" name="historyBean" type="com.topcoder.web.ejb.messagehistory.MessageHistory" toScope="request"/>

<%	HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
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
   <span class="currentPage">Threaded</span>&#160;&#160;|
   <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<jsp:getProperty name="thread" property="ID"/>&mc=<jsp:getProperty name="thread" property="messageCount"/>&<%=ForumConstants.THREAD_VIEW%>=tree" class="rtbcLink">Tree</A>
   <% if (errors.get(ForumConstants.WATCH_THREAD) != null) { %><br><font color="red"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.WATCH_THREAD%>"><%=err%></tc-webtag:errorIterator></font><% } %>
   </td>
</tr>

<tr><td><b><A href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Forums</A> >>
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

<%-------------POSTS---------------%>
<tc-webtag:iterator id="message" type="com.jivesoftware.forum.ForumMessage" iterator='<%=(Iterator)request.getAttribute("messages")%>'>
	<%  int depth=thread.getTreeWalker().getMessageDepth(message);
		int width=Math.round(Math.min(500,500-((depth-50)*(depth-50))/5));
		if (depth > 0) { %>
<div style="padding:0px 0px 0px <%=width%>px;">
<%	}	%>
<table cellpadding="0" cellspacing="0" class="rtTable">
		<tr>
	       <td class="rtHeader" colspan="2" width="100%">
            <div valign="top" style="float: right; padding-left: 5px; white-space: nowrap;">
                  <%  int editCount = historyBean.getEditCount(message.getID(), DBMS.FORUMS_DATASOURCE_NAME);
                  if (editCount == 1) { %> 
                     <a href="?module=RevisionHistory&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>" class="rtbcLink" title="Last updated <tc-webtag:beanWrite name="message" property="modificationDate" format="MMM d, yyyy 'at' h:mm a z"/>">1 edit</a> | 
                  <%  } else if (editCount > 1) { %> 
                     <a href="?module=RevisionHistory&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>" class="rtbcLink" title="Last updated <tc-webtag:beanWrite name="message" property="modificationDate" format="MMM d, yyyy 'at' h:mm a z"/>"><%=editCount%> edits</a> | 
                  <%  } %>
               <a name=<jsp:getProperty name="message" property="ID"/>><tc-webtag:beanWrite name="message" property="creationDate" format="MMM d, yyyy 'at' h:mm a z"/></a>
            </div>
            <jsp:getProperty name="message" property="subject"/>
            <%	if (message.getParentMessage() != null) { %>
					(response to <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getParentMessage().getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">post</A><%if (message.getParentMessage().getUser() != null) {%> by <tc-webtag:handle coderId="<%=message.getParentMessage().getUser().getID()%>"/><%}%>)
				<%	} %>
				</a>
			    &#160;>>&#160; <A href="?module=Post&<%=ForumConstants.POST_MODE%>=Reply&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>" class="rtbcLink">Reply</A>
			    <%  if (message.getUser() != null && message.getUser().equals(user)) { %>
			    | <A href="?module=Post&<%=ForumConstants.POST_MODE%>=Edit&<%=ForumConstants.MESSAGE_ID%>=<jsp:getProperty name="message" property="ID"/>" class="rtbcLink">Edit</A>
			    <%   } %>
	       </td>
        </tr>
		<tr>
      <td class="rtPosterCell">
         <div class="rtPosterSpacer">
         <%  if (message.getUser() != null && !("false".equals(message.getUser().getProperty("jiveDisplayMemberPhoto"))) && message.getUser().getProperty("imagePath") != null) { %>
            <img src="<%=message.getUser().getProperty("imagePath")%>" width="55" height="61" border="0" class="rtPhoto" /><br>
         <%  } %>
         <span class="bodyText"><%if (message.getUser() != null) {%><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/><%}%></span><br><%if (message.getUser() != null) {%><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=message.getUser().getID()%>"><%=forumFactory.getUserMessageCount(message.getUser())%> posts</A><%}%>
         </div>
      </td>
      <td class="rtTextCell" width="100%"><jsp:getProperty name="message" property="body"/></td></tr>
</table>
</div>
</tc-webtag:iterator>
<%-------------POSTS END---------------%>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr><td><b><A href="<%=ForumConstants.FORUMS_DIR%>" class="rtbcLink">Forums</A> >>
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
