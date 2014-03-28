<%@ page import="com.jivesoftware.base.JiveConstants,
                com.jivesoftware.base.User,
                com.jivesoftware.forum.*,
                com.jivesoftware.forum.database.DbAttachmentManager,
                com.topcoder.shared.util.ApplicationServer,
                com.topcoder.web.common.BaseProcessor,
                com.topcoder.web.common.StringUtils,
                com.topcoder.web.forums.ForumConstants,
                com.topcoder.web.forums.controller.ForumsUtil,
                com.topcoder.web.forums.model.ImageData,
                java.util.HashMap,
                java.util.Hashtable,
                java.util.Iterator"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=utf-8" %>

<tc-webtag:useBean id="authToken" name="authToken" type="com.jivesoftware.base.AuthToken" toScope="request"/>
<tc-webtag:useBean id="forumFactory" name="forumFactory" type="com.jivesoftware.forum.ForumFactory" toScope="request"/>
<tc-webtag:useBean id="forum" name="forum" type="com.jivesoftware.forum.Forum" toScope="request"/>
<tc-webtag:useBean id="thread" name="thread" type="com.jivesoftware.forum.ForumThread" toScope="request"/>
<tc-webtag:useBean id="activeMessage" name="activeMessage" type="com.jivesoftware.forum.ForumMessage" toScope="request"/>
<tc-webtag:useBean id="paginator" name="paginator" type="com.jivesoftware.forum.action.util.Paginator" toScope="request"/>

<%  HashMap errors = (HashMap)request.getAttribute(BaseProcessor.ERRORS_KEY);
    User user = (User)request.getAttribute("user");
    String threadView = StringUtils.checkNull(request.getParameter(ForumConstants.THREAD_VIEW));
    RatingManager ratingManager = RatingManagerFactory.getInstance(authToken);
    ReadTracker readTracker = forumFactory.getReadTracker();
    ForumThread nextThread = (ForumThread)request.getAttribute("nextThread");
    ForumThread prevThread = (ForumThread)request.getAttribute("prevThread");
    boolean showPrevNextThreads = !(user != null && "false".equals(user.getProperty("jiveShowPrevNextThreads")));
    String prevTrackerClass = "", nextTrackerClass = "";
    ForumMessage prevPost = null, nextPost = null;
    Hashtable editCountTable = (Hashtable)request.getAttribute("editCountTable");

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
    } 
    
    String flatMode = "flat";
    if (user != null && user.getProperty("jiveFlatMode") != null) {
        flatMode = user.getProperty("jiveFlatMode");
    } %>

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE">
    
<title>TopCoder Forums</title>
    <jsp:include page="script.jsp" />
        <jsp:include page="/style.jsp">
          <jsp:param name="key" value="tc_forums"/>
        </jsp:include>

</head>

<body>

<jsp:include page="top.jsp" >
    <jsp:param name="level1" value="forums"/>
</jsp:include>

<script type="text/javascript">
<!--
function toggle(obj) {
    var el = document.getElementById(obj);
    if ( el.style.display != "none" ) {
        el.style.display = 'none';
    }
    else {
        el.style.display = '';
    }
}

var req;
function rate(messageID, voteValue) {
   var url = "?module=Rating";
   if (window.XMLHttpRequest) {
       req = new XMLHttpRequest();
   } else if (window.ActiveXObject) {
       req = new ActiveXObject("Microsoft.XMLHTTP");
   }
   req.open("POST", url, true);
   req.onreadystatechange = callback;
   req.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   req.send("messageID="+messageID+"&voteValue="+voteValue);
}

function callback() {
    if (req.readyState == 4) {
        if (req.status == 200) {
            var messageID = req.responseXML.getElementsByTagName("messageID")[0].firstChild.nodeValue;
            var posRatings = req.responseXML.getElementsByTagName("posRatings")[0].firstChild.nodeValue;
            var negRatings = req.responseXML.getElementsByTagName("negRatings")[0].firstChild.nodeValue;
            var userRating = req.responseXML.getElementsByTagName("userRating")[0].firstChild.nodeValue;
            displayVotes(messageID, posRatings, negRatings, userRating);
        }
    }
}

function displayVotes(messageID, posVotes, negVotes, userRating) {
    var mspan = document.getElementById("ratings"+messageID);
    mspan.innerHTML = "(+"+posVotes+"/-"+negVotes+")";
    var title = "Your vote: ";
    if (userRating == 2) {
    	title += "+1";
    } else if (userRating == 1) {
    	title += "-1";
    } else {
    	title += "0";
    }
    mspan.title = title;
}

//-->
</script>

<style type="text/css">
<!--
.pointer {
    cursor: pointer;
}

.rtTextCellHlt
{
    background-color: #FFFF99;
    padding: 10px 15px 10px 15px;
    color: #333;
    font-size: 12px;
    vertical-align: top;
}
-->
</style>

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
   <td nowrap="nowrap" valign="top" style="padding-right: 20px;">
    <c:if test="${!isNewStyle}">
           <jsp:include page="searchHeader.jsp" />
    </c:if>
       <%  if (ForumsUtil.isSoftwareSubcategory(forum.getForumCategory())) { %>
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
       <c:if test="${isNewStyle}">
           <a class="rtbcLink search" href="?module=Search">Search</a>
           <span class="thin-sep">|</span>
       </c:if>
   <A href="?module=Watch&<%=ForumConstants.WATCH_TYPE%>=<%=JiveConstants.THREAD%>&<%=ForumConstants.WATCH_ID%>=<%=thread.getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>&<%=ForumConstants.WATCH_COMMAND%>=<%=cmd%>"
   class="rtbcLink"><%=watchMessage%></A>&#160;&#160;|&#160;&#160;<A href="?module=History" class="rtbcLink">My Post History</A>&#160;&#160;|&#160;&#160;<A href="?module=Watches" class="rtbcLink">My Watches</A>&#160;&#160;|&#160;&#160;<A href="?module=Settings" class="rtbcLink">User Settings</A><br>
   View:
   <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>&<%=ForumConstants.THREAD_VIEW%>=<%=flatMode%>" class="rtbcLink">Flat</A>&#160;&#160;|
   <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>&mc=<%=thread.getMessageCount()%>&<%=ForumConstants.THREAD_VIEW%>=threaded" class="rtbcLink">Threaded</A>&#160;&#160;|
   <span class="currentPage">Tree</span>
   <% if (errors.get(ForumConstants.WATCH_THREAD) != null) { %><br><font color="red"><tc-webtag:errorIterator id="err" name="<%=ForumConstants.WATCH_THREAD%>"><%=err%></tc-webtag:errorIterator></font><% } %>
   <%   if (showPrevNextThreads && (nextThread != null || prevThread != null)) { %><br>
        <% if (prevThread != null) { %>
            <%  prevPost = prevThread.getLatestMessage();
                prevTrackerClass = (user == null || readTracker.getReadStatus(user, prevPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=prevThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=prevThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=prevTrackerClass%>">Previous Thread</A>
        <% } else { %>
           Previous Thread
        <% } %>&#160;|&#160;
        <% if (nextThread != null) { %>
            <%  nextPost = nextThread.getLatestMessage();
                nextTrackerClass = (user == null || readTracker.getReadStatus(user, nextPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=nextThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=nextThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=nextTrackerClass%>">Next Thread</A>
        <% } else { %>
           Next Thread
        <% } %>
   <%   }   %>
   </td>
</tr>

<tr><td class='breadcrumbs' colspan="3" style="padding-bottom:3px;"><b>
   <%	boolean showComponentLink = "true".equals((String)request.getAttribute("showComponentLink"));
   		Iterator itCategories = ForumsUtil.getCategoryTree(forum.getForumCategory());
    	while (itCategories.hasNext()) {
    		ForumCategory category = (ForumCategory)itCategories.next(); %>
	        <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
	<%      if (!itCategories.hasNext() && showComponentLink) { %>
	        	(<a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=forum.getForumCategory().getProperty(ForumConstants.PROPERTY_COMPONENT_ID)%>" class="rtbcLink">Component</a>)	
		<%	} %>
			<img src="/i/interface/exp_w.gif" align="absmiddle"/>
   <%	} %>
   <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></A>
   <%	String linkStr = ForumsUtil.createLinkString(forum);
   		if (!linkStr.equals("()")) { %>
   			<%=linkStr%>
   <% 	} %>
   <img src="/i/interface/exp_w.gif" align="absmiddle"/> <%=thread.getName()%></b>
   </td>
</tr>
</table>

<%-------------ACTIVE POST---------------%>
<table cellpadding="0" cellspacing="0" class="rtTable rtTablePost">
   <tr>
      <td class="rtHeader" colspan="2">
      <%  String msgBodyID = "msgBody" + activeMessage.getID(); 
          String ratingsID = "ratings" + activeMessage.getID(); 
          int ratingCount = -1;
          int posRatings = -1;
          int negRatings = -1; %> 
         <div valign="top" style="float: right; padding-left: 5px; white-space: nowrap;">
            <%  int editCount = editCountTable.containsKey(String.valueOf(activeMessage.getID())) ? 
            		Integer.parseInt((String)editCountTable.get(String.valueOf(activeMessage.getID()))) : 0;
            if (editCount > 0) { %> 
                <a href="?module=RevisionHistory&<%=ForumConstants.MESSAGE_ID%>=<%=activeMessage.getID()%>" class="rtbcLink" title="Last updated <tc-webtag:format object="${activeMessage.modificationDate}" format="EEE, MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>"><%=ForumsUtil.display(editCount, "edit")%></a> | 
            <%  } %>
            <a name=<%=activeMessage.getID()%>><tc-webtag:format object="${activeMessage.creationDate}" format="EEE, MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/>
         </div>

         <%=activeMessage.getSubject()%></a>
         <%  if (activeMessage.getParentMessage() != null) { %>
         (response to <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=activeMessage.getParentMessage().getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink">post</A><%if (activeMessage.getParentMessage().getUser() != null) {%> by <tc-webtag:handle coderId="<%=activeMessage.getParentMessage().getUser().getID()%>"/><%}%>)
         <%  } %>
         <%  if (ratingManager.isRatingsEnabled() && user != null && ForumsUtil.showRatings(user)) {
                int[] ratings = ForumsUtil.getRatings(ratingManager, activeMessage);
                posRatings = ratings[0];
                negRatings = ratings[1];
                ratingCount = posRatings+negRatings; 
                Rating rating = ratingManager.getRating(user, activeMessage); 
                String ratingVal = (rating == null) ? "0" : rating.getScore() == 2 ? "+1":"-1"; %>
            | Feedback: <span id="<%=ratingsID%>" class="pointer" title="Your vote: <%=ratingVal%>">(+<%=posRatings%>/-<%=negRatings%>)</span> | <a href="javascript:void(0)" onclick="rate('<%=activeMessage.getID()%>','2')" class="rtbcLink">[+]</a> <a href="javascript:void(0)" onclick="rate('<%=activeMessage.getID()%>','1')" class="rtbcLink">[-]</a>
        <%  } %>
         | <A href="?module=Post&<%=ForumConstants.POST_MODE%>=Reply&<%=ForumConstants.MESSAGE_ID%>=<%=activeMessage.getID()%>" class="rtbcLink">Reply</A>
         <%  if (activeMessage.getUser() != null && activeMessage.getUser().equals(user)) { %>
         | <A href="?module=Post&<%=ForumConstants.POST_MODE%>=Edit&<%=ForumConstants.MESSAGE_ID%>=<%=activeMessage.getID()%>" class="rtbcLink">Edit</A>
         <%  } %>
      </td>
   </tr>
	<%	if (activeMessage.getAttachmentCount() > 0) { %>
	<tr>
		<td class="rtHeader" colspan="2">
			Attachments:
			<%	Iterator attachments = activeMessage.getAttachments();
				while(attachments.hasNext()) {
					Attachment attachment = (Attachment)attachments.next(); %>&nbsp;
					<A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>"><img align="absmiddle" src="/i/roundTables/icons/<%=DbAttachmentManager.getThumbnailImage(attachment.getContentType())%>" border="0" alt="Attachment" /></A>
					<A href="?module=GetAttachment&<%=ForumConstants.ATTACHMENT_ID%>=<%=attachment.getID()%>" class="rtbcLink"><%=attachment.getName()%></A> (<%=ForumsUtil.getFileSizeStr(attachment.getSize())%>)&nbsp;&nbsp;
			<% 	} %>
		</td>
 	</tr>
	<% 	} %>
   <tr id="<%=msgBodyID%>">
   <td class="rtPosterCell">
      <div class="rtPosterSpacer">
         <%  if (ForumsUtil.displayMemberPhoto(user, activeMessage.getUser())) { %>
            <img src="<%=activeMessage.getUser().getProperty("imagePath")%>" width="61" height="61" border="0" class="rtPhoto" /><br>
         <%  } %>
         <span class="bodyText"><%if (activeMessage.getUser() != null) {%><tc-webtag:handle coderId="<%=activeMessage.getUser().getID()%>"/><%}%></span><br><%if (activeMessage.getUser() != null) {%><A href="?module=History&<%=ForumConstants.USER_ID%>=<%=activeMessage.getUser().getID()%>"><%=ForumsUtil.display(forumFactory.getUserMessageCount(activeMessage.getUser()), "post")%></A><%}%>
      </div>
   </td>
   <%   double pct = ratingCount<=0 ? 0 : 100*(double)(posRatings)/(double)(ratingCount);  %>
   <%   if (ForumsUtil.highlightPost(user, pct, ratingCount)) { %>
   <td class="rtTextCellHlt" width="100%"><%=activeMessage.getBody()%></td>
   <%   } else { %>
   <td class="rtTextCell" width="100%"><%=activeMessage.getBody()%></td>
   <%   } %>
   </tr>
</table>
<%-------------ACTIVE POST ENDS----------%>

<%-------------POSTS---------------%>
<table cellpadding="0" cellspacing="0" class="rtTable rtTablePost" style="margin-bottom:6px;">
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
      if (depth > 0) { %><img src="/i/clear.gif" width="<%=width%>" height="1"/><% } %>
      <% if (active) { %>
         <b><A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink"><%=message.getSubject()%></A></b></td>
      <% } else { %>
         <A href="?module=Message&<%=ForumConstants.MESSAGE_ID%>=<%=message.getID()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="rtbcLink"><%=message.getSubject()%></A></td>
      <% } %>
         <td class="rtThreadCell"><%if (message.getUser() != null) {%><tc-webtag:handle coderId="<%=message.getUser().getID()%>"/><%}%></td>
         <td class="rtThreadCell"><strong><tc-webtag:format object="${message.creationDate}" format="MMM d, yyyy 'at' h:mm a z" timeZone="${sessionInfo.timezone}"/></strong></td>
    </tr>
   </tc-webtag:iterator>
</table>
<%-------------POSTS END---------------%>

<table cellpadding="0" cellspacing="0" class="rtbcTable">
<tr><td class='breadcrumbs'><b>
   <%	itCategories = ForumsUtil.getCategoryTree(forum.getForumCategory());
    	while (itCategories.hasNext()) {
    		ForumCategory category = (ForumCategory)itCategories.next(); %>
	        <A href="?module=Category&<%=ForumConstants.CATEGORY_ID%>=<%=category.getID()%>" class="rtbcLink"><%=category.getName()%></A>
	<%      if (!itCategories.hasNext() && showComponentLink) { %>
	        	(<a href="http://<%=ApplicationServer.SOFTWARE_SERVER_NAME%>/catalog/c_component.jsp?comp=<%=forum.getForumCategory().getProperty(ForumConstants.PROPERTY_COMPONENT_ID)%>" class="rtbcLink">Component</a>)	
		<%	} %>
			<img src="/i/interface/exp_w.gif" align="absmiddle"/>
   <%	} %>
   <A href="?module=ThreadList&<%=ForumConstants.FORUM_ID%>=<%=forum.getID()%>&mc=<%=forum.getMessageCount()%>" class="rtbcLink"><%=forum.getName()%></A>
   <%	linkStr = ForumsUtil.createLinkString(forum);
   		if (!linkStr.equals("()")) { %>
   			<%=linkStr%>
   <% 	} %>
   <img src="/i/interface/exp_w.gif" align="absmiddle"/> <%=thread.getName()%></b>
   <%   if (showPrevNextThreads && (nextThread != null || prevThread != null)) { %><br>
        <% if (prevThread != null) { %>
            <%  prevPost = prevThread.getLatestMessage();
                prevTrackerClass = (user == null || readTracker.getReadStatus(user, prevPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=prevThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=prevThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=prevTrackerClass%>">Previous Thread</A>
        <% } else { %>
           Previous Thread
        <% } %>&#160;|&#160;
        <% if (nextThread != null) { %>
            <%  nextPost = nextThread.getLatestMessage();
                nextTrackerClass = (user == null || readTracker.getReadStatus(user, nextPost) == ReadTracker.READ) ? "rtbcLink" : "rtLinkBold"; %>
           <A href="?module=Thread&<%=ForumConstants.THREAD_ID%>=<%=nextThread.getID()%>&<%=ForumConstants.START_IDX%>=0&mc=<%=nextThread.getMessageCount()%><%if (!threadView.equals("")) { %>&<%=ForumConstants.THREAD_VIEW%>=<%=threadView%><% } %>" class="<%=nextTrackerClass%>">Next Thread</A>
        <% } else { %>
           Next Thread
        <% } %>
   <%   }   %>
   </td>
   <td align="right"><a href="?module=RSS&<%=ForumConstants.THREAD_ID%>=<%=thread.getID()%>"><img alt="RSS" border="none" src="/i/interface/btn_rss.gif"/></a></td>
</table>

<div style="clear:both;">&nbsp;</div>

        </td>

<!-- Center Column Ends -->

    </tr>
</table>

<jsp:include page="foot.jsp" />

</body>

</html>
